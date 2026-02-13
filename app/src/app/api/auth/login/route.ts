import { NextRequest, NextResponse } from "next/server";
import { xanoPost } from "@/lib/xano";

export async function POST(request: NextRequest) {
  try {
    const { email, password } = await request.json();

    if (!email || !password) {
      return NextResponse.json(
        { error: "Email and password are required" },
        { status: 400 }
      );
    }

    const data = await xanoPost("/api:cAgnR007/auth/login", {
      email,
      password,
    });

    const authToken = data.authToken as string | undefined;

    if (!authToken) {
      return NextResponse.json(
        { error: "Login failed — no token received" },
        { status: 401 }
      );
    }

    const response = NextResponse.json({ success: true });

    response.cookies.set("kora_token", authToken, {
      httpOnly: true,
      sameSite: "lax",
      path: "/",
      maxAge: 86400,
      secure: process.env.NODE_ENV === "production",
    });

    return response;
  } catch (error) {
    const message =
      error instanceof Error ? error.message : "Login failed";
    return NextResponse.json({ error: message }, { status: 401 });
  }
}
