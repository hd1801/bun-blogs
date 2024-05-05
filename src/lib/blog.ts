import prisma from "@/db";
import { Blog, Prisma } from "@prisma/client";

export const createBlog = async (blogDetails: {
  AuthorId: number;
  title: string;
  content: string;
  bannerImage?: string | null;
}) => {
  return await prisma.blog.create({
    data: { ...blogDetails, publishedAt: new Date() },
  });
};

export const createBlogTags = async (
  blogId: number,
  tags: Prisma.TagCreateInput[]
) => {
  // TODO: can reduce this to a single query or 2 queries ??
  for (const tag of tags) {
    const newTag = await prisma.tag.upsert({
      where: { name: tag.name },
      update: {},
      create: { name: tag.name },
    });
    await prisma.blogTag.create({
      data: {
        BlogId: blogId,
        TagId: newTag.id,
      },
    });
  }
};
