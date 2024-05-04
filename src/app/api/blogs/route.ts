import prisma from "@/db";
import { NextRequest, NextResponse } from "next/server";

export async function GET(req: NextRequest, res: NextResponse) {
  return prisma.blog.findMany({});
}

export async function POST(req: NextRequest, res: NextResponse) {}
