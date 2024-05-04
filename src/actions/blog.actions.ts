"use server";
import prisma from "@/db";
import { getUserByEmail } from "@/lib";
import { blogSchema } from "@/schema";
import { Blog, Tag } from "@prisma/client";
import { getServerSession } from "next-auth";
import { redirect } from "next/navigation";

const validateBlog = async (formData: FormData) => {
  console.log(formData);
  const validatedFields = await blogSchema.validate(
    {
      title: formData.get("title"),
      coverImage: formData.get("coverImage"),
      tags: formData.getAll("tags"),
      content: formData.get("content"),
    },
    {
      strict: true,
    }
  );
  if (!validatedFields) {
    throw new Error("Invalid fields");
  }
  return validatedFields;
};
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
    console.log(tag);
    const newTag = await prisma.tag.upsert({
      where: { name: tag.name },
      update: {},
      create: { name: tag.name },
    });
    console.log(newTag);
    await prisma.blogTag.create({
      data: {
        BlogId: blogData.id,
        TagId: newTag.id,
      },
    });
  }
}

export const createBlog = async (formData: FormData) => {
  "use server";
  const validatedFields = await validateBlog(formData);
  console.log(validatedFields);
  const { content, coverImage, title, tags } = validatedFields;
  const user = await getUserFromSession();
  const blog = await prisma.blog.create({
    data: {
      title,
      bannerImage: coverImage || null,
      content,
      AuthorId: user?.id,
      publishedAt: new Date(),
    },
  });
  console.log(tags);
  if (tags) {
    await createBlogWithTags(blog, tags);
  }
  // redirect(`/`);
};
