import { defineConfig } from "rollup";
import typescriptPlugin from "@rollup/plugin-typescript";
import path from "path";

const packageName = process.env["npm_package_name"]?.split("/")[1] ?? "";
const outputDir = path.resolve(__dirname, "packages", packageName, "dist");
const tsconfig = path.resolve(__dirname, "tsconfig.json");

export default defineConfig({
  plugins: [
    typescriptPlugin({
      tsconfig,
    }),
  ],
  output: {
    dir: outputDir,
    format: "cjs",
  },
});
