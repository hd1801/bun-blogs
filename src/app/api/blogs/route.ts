import prisma from "@/db";
import { config, createBlog, createBlogTags, getUserByEmail } from "@/lib";
import { blogSchema } from "@/schema";
import { sendError } from "@/utils";
import { getServerSession } from "next-auth";
import { getSession } from "next-auth/react";
import { NextRequest, NextResponse } from "next/server";

const validateBlog = async (formData: FormData) => {
  const tags = formData.get("tags");
  const blogDetails = {
    title: formData.get("title"),
    coverImage: formData.get("coverImage"),
    tags: tags ? JSON.parse(tags as string) : undefined,
    content: formData.get("content"),
  };

  const validatedFields = await blogSchema.validate(blogDetails, {
    strict: true,
  });

  if (!validatedFields) {
    throw new Error("Invalid fields");
  }

  return validatedFields;
};

export async function GET(req: NextRequest, res: NextResponse) {
  return prisma.blog.findMany({});
}

export async function POST(req: NextRequest, res: NextResponse) {
  const body = await req.formData();
  const data = await validateBlog(body);
  const session = await getServerSession(config);
  const user = session?.user;
  if (!user || !user.email) {
    return sendError(401, "Unauthorized");
  }
  const loggedInUser = await getUserByEmail(user.email);
  if (!loggedInUser) {
    return sendError(401, "Unauthorized");
  }
  const newBlog = await createBlog({
    AuthorId: loggedInUser?.id,
    bannerImage: data.coverImage,
    content: data.content,
    title: data.title,
  });
  if (data.tags) {
    await createBlogTags(newBlog.id, data.tags);
  }
  return NextResponse.json(newBlog);
}
