import prisma from "@/db";

// Path: /api/blogs
export async function GET() {
  return prisma.blog.findMany({});
}

export async function POST() {}
