import prisma from "@/db";
import bcrypt from "bcrypt";
import { HttpError } from "../utils";

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
