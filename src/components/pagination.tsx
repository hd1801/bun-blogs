"use client";
import _ from "lodash";
import { usePathname, useRouter, useSearchParams } from "next/navigation";

interface BlogPaginationProps {
  start: number;
  end: number;
  count: number;
  page: number;
}
export const BlogPagination = ({
  start,
  end,
  page,
  count,
}: BlogPaginationProps) => {
  const searchParams = useSearchParams();
  const pathname = usePathname();
  const { replace } = useRouter();

  const changePage = (page: number) => {
    const params = new URLSearchParams(searchParams);
    params.set("page", page.toString());
    replace(`${pathname}?${params.toString()}`);
  };

  return (
    <div className="w-full  border-t border-gray-300">
      <div className="mt-2 flex flex-col md:flex-row items-center justify-between">
        <div>
          <p>
            showing <strong>{start}</strong> to <strong>{end}</strong> of{" "}
            <strong>{count}</strong> results
          </p>
        </div>
        <div className="space-x-2">
          <button
            type="button"
            onClick={() => changePage(page - 1)}
            disabled={page <= 1}
            className="rounded-md bg-black px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-black/80 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-black disabled:opacity-50 disabled:cursor-not-allowed  "
          >
            &larr; Previous
          </button>
          <button
            type="button"
            disabled={count <= end}
            onClick={() => changePage(_.parseInt(String(page)) + 1)}
            className="rounded-md bg-black px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-black/80 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-black disabled:opacity-50 disabled:cursor-not-allowed"
          >
            Next &rarr;
          </button>
        </div>
      </div>
    </div>
  );
};
