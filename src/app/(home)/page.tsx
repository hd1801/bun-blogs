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
export default async function Home(props: any) {
  console.log(props);
  const data = await prisma.blog.findMany({
    take: 10,
    include: {
      author: true,
      BlogTag: {
        include: {
          tag: {
            where: {
              name: "tech",
            },
          },
        },
      },
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
