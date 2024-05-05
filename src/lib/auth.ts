import prisma from "@/db";
import bcrypt from "bcrypt";
import { HttpError } from "../utils";
import CredentialsProvider from "next-auth/providers/credentials";

export const config = {
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
    jwt({ token, user, account }: any) {
      if (account) {
        token.id = account.id;
        token.name = account.name;
        token.email = account.email;
      }
      if (user) {
        token.id = user.id;
        token.name = user.name;
        token.email = user.email;
      }
      return token;
    },
    session: async ({ session, token, user }: any) => {
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
};

export const getUserByEmail = async (email: string) => {
  return prisma.user.findFirst({
    where: {
      email: email,
    },
  });
};

export const createUser = async (
  email: string,
  name: string,
  password: string
) => {
  return prisma.$transaction(async (tx) => {
    const user = await tx.user.create({
      data: {
        email: email,
        name: name,
      },
    });
    const hash = hashPassword(password);

    await tx.userPassword.create({
      data: {
        password: hash,
        UserId: user.id,
      },
    });
    return user;
  });
};

const hashPassword = (password: string) => {
  let salt = bcrypt.genSaltSync(10);
  return bcrypt.hashSync(password, salt);
};

export const getUser = async (email: string) => {
  return prisma.user.findFirst({
    where: {
      email: email,
    },
  });
};

export const validateUser = (email: string, password: string) => {
  return prisma.$transaction(async (tx) => {
    const user = await tx.user.findFirst({
      where: {
        email,
      },
      include: {
        UserPassword: true,
      },
    });

    if (!user || !user.UserPassword) {
      throw new HttpError(401, "User not found");
    }

    const isValid = bcrypt.compareSync(password, user.UserPassword.password);

    if (!isValid) {
      throw new HttpError(401, "Invalid password");
    }

    return user;
  });
};
