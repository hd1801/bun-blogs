import { createUser, getUserByEmail, validateUser } from "@/lib";
import { HttpError } from "@/utils";
import NextAuth from "next-auth";
import CredentialsProvider from "next-auth/providers/credentials";

export default NextAuth({
  providers: [
    CredentialsProvider({
      id: "login",
      name: "Login",
      credentials: {
        username: { label: "email", type: "text" },
        password: { label: "password", type: "password" },
      },
      async authorize({ email, password }: any) {
        try {
          const user = await validateUser(email, password);
          return {
            id: String(user.id),
            name: user.name,
            email: user.email,
          };
        } catch (error) {
          // Return null if user data could not be retrieved
          return null;
        }
      },
    }),
    CredentialsProvider({
      id: "signup",
      name: "Sign Up",
      credentials: {
        name: { label: "name", type: "text" },
        email: { label: "email", type: "text" },
        password: { label: "password", type: "password" },
      },
      async authorize({ name, email, password }: any) {
        try {
          const existingUser = await getUserByEmail(email);
          if (existingUser) {
            throw new HttpError(400, "User already exists");
          }
          const user = await createUser(email, name, password);
          return {
            id: String(user.id),
            name: user.name,
            email: user.email,
          };
        } catch (error) {
          // Return null if user data could not be retrieved
          return null;
        }
      },
    }),
  ],
  callbacks: {
    jwt({ token, account }) {
      return token;
    },
    session: async ({ session, token, user }) => {
      if (session.user) {
        session.user.email = token.email;
        session.user.name = token.name;
      }
      return session;
    },
  },
  pages: {
    signIn: "/signin",
    newUser: "/signup",
  },

  secret: process.env.NEXTAUTH_SECRET,
});
