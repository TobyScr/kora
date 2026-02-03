import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "Kora",
  description: "Kora - Campaign Planning Tool",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body className="antialiased">
        {children}
      </body>
    </html>
  );
}
