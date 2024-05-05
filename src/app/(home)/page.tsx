import { BlogCard } from "@/components";
import prisma from "@/db";
import _ from "lodash";

interface PageProps {
  searchParams: {
    search?: string;
    tag: string;
    page?: number;
  };
}

export default async function Home(props: PageProps) {
  const { tag, page, search } = props.searchParams;
  const data = await prisma.blog.findMany({
    where: {
      AND: [
        search
          ? {
              title: {
                contains: search,
                mode: "insensitive", // case-insensitive
              },
            }
          : {},
        tag
          ? {
              blogTags: {
                // changed to blogTags
                some: {
                  tag: {
                    name: {
                      equals: tag,
                      mode: "insensitive",
                    },
                  },
                },
              },
            }
          : {},
      ],
    },
    include: {
      blogTags: true,
    },
    take: 10,
    skip: page ? (page - 1) * 10 : 0,
    orderBy: {
      createdAt: "desc",
    },
  });
  return (
    <main className="flex flex-1 h-full bg-slate-400 flex-row gap-8 flex-wrap p-4 justify-center">
      {!data.length && (
        <div className="text-xl font-bold h-full flex flex-col items-center justify-center">
          <h2>No Results</h2>
        </div>
      )}
      {_.map(data, (blog) => (
        <BlogCard key={blog.id} blog={blog} />
      ))}
    </main>
  );
}
