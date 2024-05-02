import { SignUpForm } from "@/components";
import Link from "next/link";

interface SignUpPageProps {
  searchParams: Record<"callbackUrl" | "error", string>;
}
export default function SignUpPage({ searchParams }: SignUpPageProps) {
  return (
    <section>
      <div className="flex items-center justify-center px-4 py-10 sm:px-6 sm:py-16 lg:px-8 lg:py-24">
        <div className="xl:mx-auto xl:w-full xl:max-w-sm 2xl:max-w-md">
          <h2 className="text-center text-2xl font-bold leading-tight text-black">
            Sign up to create account
          </h2>
          <p className="mt-2 text-center text-base text-gray-600">
            Already have an account?{" "}
            <Link
              href="/signin"
              title=""
              className="font-medium text-black transition-all duration-200 hover:underline"
            >
              Sign In
            </Link>
          </p>
          <SignUpForm {...searchParams} />
        </div>
      </div>
    </section>
  );
}
