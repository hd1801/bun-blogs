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
      author: true,
      blogTags: {
        include: {
          tag: true,
        },
      },
    },
    take: 10,
    skip: page ? (page - 1) * 10 : 0,
    orderBy: {
      createdAt: "desc",
    },
  });
  return (
    <main className="grid md:grid-cols-2 lg:grid-cols-3 p-5 gap-10 grid-flow-dense">
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
