import { BlogCard, BlogPagination, SearchBar } from "@/components";
import prisma from "@/db";
import { Prisma } from "@prisma/client";
import _ from "lodash";

interface PageProps {
  searchParams: {
    search?: string;
    tag?: string;
    page?: number;
  };
}

export default async function Home(props: PageProps) {
  const { tag, page = 1, search } = props.searchParams;
  const recordsPerPage = 6;
  const offset = (page - 1) * recordsPerPage;
  const searchFilter: Prisma.BlogWhereInput = search
    ? {
        title: {
          contains: search,
          mode: "insensitive", // case-insensitive
        },
      }
    : {};

  const tagFilter: Prisma.BlogWhereInput = tag
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
    : {};

  const data = await prisma.blog.findMany({
    where: {
      AND: [searchFilter, tagFilter],
    },
    include: {
      author: true,
      blogTags: {
        include: {
          tag: true,
        },
      },
    },
    take: recordsPerPage,
    skip: offset,
    orderBy: {
      createdAt: "desc",
    },
  });

  const currentPageCount = data.length;
  const startRecord = offset + 1;
  const endRecord = offset + currentPageCount;

  return (
    <div className="flex flex-col p-4 h-full bg-slate-300">
      <SearchBar />
      <main className="grid md:grid-cols-2 lg:grid-cols-3 p-5 gap-10 grid-flow-dense">
        {!data.length && (
          <div className=" text-xl font-bold flex flex-col flex-1 items-center justify-center">
            <h2>No Results</h2>
          </div>
        )}
        {_.map(data, (blog) => (
          <BlogCard key={blog.id} blog={blog} />
        ))}
      </main>
      <BlogPagination
        start={startRecord}
        count={11}
        end={endRecord}
        page={page}
      />
    </div>
  );
}
