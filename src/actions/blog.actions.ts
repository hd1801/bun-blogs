"use server";
import prisma from "@/db";
import { getUserByEmail } from "@/lib";
import { Blog, Tag } from "@prisma/client";
import { getServerSession } from "next-auth";
import { headers } from "next/headers";
import { redirect } from "next/navigation";

const getUserFromSession = async () => {
  const session = await getServerSession();
  if (!session || !session.user || !session?.user?.email) {
    throw new Error("Unauthorized");
  }
  const user = await getUserByEmail(session?.user?.email);
  if (!user) {
    throw new Error("User not found");
  }
  return user;
};

async function createBlogWithTags(blogData: Blog, tags: Pick<Tag, "name">[]) {
  for (const tag of tags) {
    const newTag = await prisma.tag.upsert({
      where: { name: tag.name },
      update: {},
      create: { name: tag.name },
    });
    await prisma.blogTag.create({
      data: {
        BlogId: blogData.id,
        TagId: newTag.id,
      },
    });
  }
}

export const createBlog = async (formData: FormData) => {
  const response = await fetch("http://localhost:3000/api/blogs", {
    method: "POST",
    body: formData,
    headers: {
      cookie: headers().get("cookie") || "",
    },
  });
  const data = await response.json();
  if (response.ok) {
    redirect(`/`);
  }
  return {
    errors: data,
  };
};
