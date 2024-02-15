import { readFileSync } from "node:fs";
const wasmBuffer = readFileSync("call_ref.wasm");
const wasmModule = await WebAssembly.instantiate(wasmBuffer);
const { plus } = wasmModule.instance.exports;
const o = plus(1, 1);
console.log(o);
