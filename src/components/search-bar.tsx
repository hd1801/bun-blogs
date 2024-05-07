"use client";

import { usePathname, useSearchParams } from "next/navigation";
import { useRouter } from "next/navigation";
import { ChangeEventHandler } from "react";

export const SearchBar = () => {
  const searchParams = useSearchParams();
  const pathname = usePathname();
  const { replace } = useRouter();

  const onChange: ChangeEventHandler<HTMLInputElement> = (e) => {
    const params = new URLSearchParams(searchParams);
    params.set("search", e.target.value);
    replace(`${pathname}?${params.toString()}`);
  };
  return (
    <div className="">
      <input
        type="text"
        className="w-full rounded-md border border-gray-300 px-3 py-2"
        placeholder="Search for blogs"
        onChange={onChange}
      />
    </div>
  );
};
