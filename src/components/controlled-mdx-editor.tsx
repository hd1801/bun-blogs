'use client'
import { MDXEditorProps } from "@mdxeditor/editor";
import { Controller, useFormContext } from "react-hook-form";
import { ForwardRefEditor } from "./forward-ref-editor";

interface ControlledMDXEditorProps extends MDXEditorProps {
  name: string;
}

export const ControlledMDXEditor = ({
  name,
  markdown,
  ...rest
}: ControlledMDXEditorProps) => {
  const { control } = useFormContext();

  return (
    <Controller
      name={name}
      control={control}
      render={({
        field: { name, onChange, onBlur, value },
        fieldState: { error },
      }) => {
        return (
          <div>
            <ForwardRefEditor
              markdown={value || ""}
              onChange={onChange}
              onBlur={onBlur}
              {...rest}
            />
            {!!error && (
              <span className="text-red-500 text-sm">{error.message}</span>
            )}
          </div>
        );
      }}
    />
  );
};
