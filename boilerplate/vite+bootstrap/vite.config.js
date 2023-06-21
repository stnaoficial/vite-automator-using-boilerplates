import { defineConfig } from "vite";
import path from "path";

export default defineConfig({
    server: {
        open: true
    },
    resolve: {
        alias: {
            "~bootstrap": path.resolve(__dirname, "node_modules/bootstrap")
        }
    }
});