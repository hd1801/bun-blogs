"use client";
import { AuthFormProps } from "@/types";
import { ArrowRight } from "lucide-react";
import { signIn } from "next-auth/react";
import { FormEvent, useState } from "react";
import { InputField } from "./input-field";

export const SignInForm = ({ callbackUrl, error }: AuthFormProps) => {
  const [state, setState] = useState({
    email: "",
    password: "",
  });
  const handleChange = (e: FormEvent<HTMLInputElement>) => {
    const { id, value } = e.currentTarget;
    setState((prev) => ({ ...prev, [id]: value }));
  };
  const handleSubmit = async (e: FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    await signIn("login", {
      email: state.email,
      password: state.password,
      callbackUrl: callbackUrl || "/",
      redirect: true,
    });
  };
  return (
    <form onSubmit={handleSubmit} className="mt-8">
      <div className="space-y-5">
        <InputField
          id="email"
          label="Email"
          type="email"
          placeholder="Email"
          onChange={handleChange}
        />
        <InputField
          id="password"
          type="password"
          label="Password"
          placeholder="Password"
          onChange={handleChange}
        />
        {!!error && (
          <div className="text-red-500 text-sm font-medium">
            Invalid credentials
          </div>
        )}
        <div>
          <button
            type="submit"
            className="inline-flex w-full items-center justify-center rounded-md bg-black px-3.5 py-2.5 font-semibold leading-7 text-white hover:bg-black/80"
          >
            Sign In <ArrowRight className="ml-2" size={16} />
          </button>
        </div>
      </div>
    </form>
  );
};
