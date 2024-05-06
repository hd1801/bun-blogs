import { Prisma } from "@prisma/client";
import { ArrowRight } from "lucide-react";
import Image from "next/image";
import Link from "next/link";
interface BlogCardProps {
  blog: Prisma.BlogGetPayload<{
    include: {
      author: true;
      blogTags: {
        include: {
          tag: true;
        };
      };
    };
  }>;
}
export function BlogCard({ blog }: BlogCardProps) {
  return (
    <Link href={`/${blog.id}`}>
      <div className="flex flex-col text-cyan-900 rounded-2xl   hover:shadow-lg relative">
        <div
          className="p-4 w-full h-40
        py-2 text-lg bg-[#00000088] backdrop-blur-sm
        rounded-t-2xl text-white font-bold absolute"
        ></div>
        <Image
          className="w-full h-40 object-cover rounded-t-2xl"
          src={blog.bannerImage || ""}
          width={300}
          height={100}
          alt={blog.title}
        />
        <div
          className="p-4
        pb-2 bg-cyan-50 "
        >
          <span className="text-cyan-700 text-xs">
            {blog.publishedAt.toDateString()}
          </span>
          <h1 className="text-xl text-cyan-900 font-bold">{blog.title}</h1>
        </div>
        <div
          className="px-5 
        flex rounded-b-2xl justify-end
        text-neutral-700 bg-cyan-50   pb-3 "
        >
          <ArrowRight />
        </div>
      </div>
    </Link>
  );
}
