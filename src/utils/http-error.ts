import { NextResponse } from "next/server";

export class HttpError extends Error {
  constructor(public statusCode: number, public message: string) {
    super(message);
  }
}

export const sendError = (status: number, message: string) => {
  return NextResponse.json(
    {
      message,
    },
    { status }
  );
};
