import prisma from "@/db";
import _ from "lodash";
import Image from "next/image";
import Markdown from "react-markdown";
import remarkGfm from "remark-gfm";

export default async function BlogPage(props: {
  params: {
    id: string;
  };
}) {
  console.log(props.params);
  const blog = await prisma.blog.findUnique({
    where: {
      id: parseInt(props.params.id),
    },
    include: {
      author: true,
      blogTags: {
        include: {
          tag: true,
        },
      },
    },
  });

  return (
    <>
      <div className="flex flex-col md:flex-row gap-4 p-4  md:p-10">
        <Image
          src={blog?.bannerImage || ""}
          width={300}
          height={300}
          alt={blog?.title || ""}
          className="rounded-md w-80 object-cover"
        />
        <div className="flex flex-col">
          <div className="gap-4 py-2">
            <h1 className="text-3xl font-bold">{blog?.title}</h1>
            <h1 className="text-lg">by {blog?.author.name}</h1>
          </div>
          <div className="flex gap-4 ">
            {_.map(blog?.blogTags, (blogTag) => (
              <span className="bg-gray-200 px-2 py-1 rounded-md font-medium">
                {blogTag.tag?.name}
              </span>
            ))}
          </div>
        </div>
      </div>
      <Markdown remarkPlugins={[remarkGfm]} className='px-4 pb-10 md:px-10'>{blog?.content}</Markdown>
    </>
  );
}
