import clsx from "clsx";
import { DetailedHTMLProps, InputHTMLAttributes, ReactNode } from "react";
import { Controller, useFormContext } from "react-hook-form";

interface InputFieldProps
  extends DetailedHTMLProps<
    InputHTMLAttributes<HTMLInputElement>,
    HTMLInputElement
  > {
  label: string;
  rightElement?: ReactNode;
}

export const InputField = ({
  id,
  type,
  label,
  placeholder,
  rightElement,
  ...rest
}: InputFieldProps) => (
  <div className="flex flex-col gap-2">
    <label htmlFor={id} className="text-base font-medium text-gray-900">
      {label}
    </label>
    <div className="flex items-center gap-2 w-full">
      <input
        name={id}
        className=" h-10 w-full rounded-md border border-gray-300 bg-transparent px-3 py-2 text-sm placeholder:text-gray-400 focus:outline-none focus:ring-1 focus:ring-gray-400 focus:ring-offset-1 disabled:cursor-not-allowed disabled:opacity-50"
        type={type}
        placeholder={placeholder}
        id={id}
        {...rest}
      />
      {rightElement}
    </div>
  </div>
);

interface ControlledInputFieldProps extends InputFieldProps {
  name: string;
}
export const ControlledInputField = ({
  name,
  className,
  label,
  rightElement,
  ...rest
}: ControlledInputFieldProps) => {
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
            <InputField
              id={name}
              label={label}
              name={name}
              onChange={onChange}
              value={value}
              onBlur={onBlur}
              rightElement={rightElement}
              {...rest}
            />
            {!!error && <span className="text-red-500">{error.message}</span>}
          </div>
        );
      }}
    />
  );
};
