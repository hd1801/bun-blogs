import { createUser } from "@/app/services";
import { NextRequest, NextResponse } from "next/server";

export async function POST(req: NextRequest, res: NextResponse) {
  const { email, name, password } = await req.json();
  const user = createUser(email, name, password);
  NextResponse.json(user, { status: 201 });
}
