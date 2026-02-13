import { NextResponse } from "next/server";
import { cookies } from "next/headers";
import { xanoGet } from "@/lib/xano";

export async function GET() {
  const cookieStore = await cookies();
  const token = cookieStore.get("kora_token")?.value;

  if (!token) {
    return NextResponse.json(
      { error: "Not authenticated" },
      { status: 401 }
    );
  }

  try {
    const user = await xanoGet("/api:cAgnR007/auth/me", token);
    return NextResponse.json(user);
  } catch {
    // Token is invalid or expired — clear the cookie
    const response = NextResponse.json(
      { error: "Session expired" },
      { status: 401 }
    );

    response.cookies.set("kora_token", "", {
      httpOnly: true,
      sameSite: "lax",
      path: "/",
      maxAge: 0,
      secure: process.env.NODE_ENV === "production",
    });

    return response;
  }
}
