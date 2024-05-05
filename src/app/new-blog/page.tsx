"use client";
import { createBlog } from "@/actions/blog.actions";
import {
  ControlledInputField,
  ControlledMDXEditor,
  InputField,
} from "@/components";
import { BlogDto, blogSchema } from "@/schema";
import { yupResolver } from "@hookform/resolvers/yup";
import { Plus, X } from "lucide-react";
import { useRef, useState } from "react";
import { FormProvider, useFieldArray, useForm } from "react-hook-form";

export default function CreateBlogPage() {
  const ref = useRef<HTMLFormElement>(null);
  const form = useForm({
    resolver: yupResolver(blogSchema),
  });
  const [tag, setTag] = useState<string>("");
  const { fields, append, remove } = useFieldArray<BlogDto>({
    control: form.control,
    name: "tags",
  });

  return (
    <div className="h-screen w-full p-4 flex flex-col gap-2 ">
      <form
        ref={ref}
        action={(e) => {
          e.append("content", form.getValues("content"));
          e.set("tags", JSON.stringify(form.getValues("tags")));
          createBlog(e);
        }}
      >
        <FormProvider {...form}>
          <h1 className="text-2xl font-semibold">Write your blog</h1>
          <button
            type="submit"
            onClick={(e) => {
              e.preventDefault();
              form.handleSubmit((data) => {
                ref.current?.requestSubmit();
              })();
            }}
          >
            Save
          </button>
          <div className="w-full flex flex-col gap-2">
            <ControlledInputField
              name="title"
              label="Title"
              placeholder="Enter title"
            />
            <ControlledInputField
              name="coverImage"
              label="Cover Image"
              placeholder="Enter cover image url"
            />
            <InputField
              name="tag"
              label="Tags"
              placeholder="Enter tags"
              onChange={(e) => {
                setTag(e.target.value);
              }}
              rightElement={
                <Plus
                  onClick={() => {
                    append({ name: tag });
                    setTag("");
                  }}
                />
              }
            />
            <div className="flex flex-wrap gap-2">
              {fields.map((field, index) => (
                <div
                  key={field.id}
                  className="flex items-center justify-center rounded-md bg-gray-200 px-3 py-1 gap-1 font-medium"
                >
                  {field.name}
                  <X
                    size="1rem"
                    onClick={() => {
                      remove(index);
                    }}
                  />
                </div>
              ))}
            </div>
          </div>
          <div className="flex-1 w-full pt-2">
            <ControlledMDXEditor
              name="content"
              markdown=""
              className="p-4 h-ful"
              contentEditableClassName="w-full flex-1 bg-gray-50"
              autoFocus
            />
          </div>
        </FormProvider>
      </form>
    </div>
  );
}
