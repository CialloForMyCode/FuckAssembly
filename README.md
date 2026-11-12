<div align="center">

<a id="top"></a>

# Fuck Assembly

<sub>A programming language suite born out of being tormented by assembly</sub>

<br />

![languages](https://img.shields.io/badge/languages-ONC%20%7C%20fun-4B8BBE?style=flat-square)
![target](https://img.shields.io/badge/target-x86__16%20%C2%B7%20bare%20metal-2F9E44?style=flat-square)
![runtime](https://img.shields.io/badge/runtime-Ts--UFO%20%7C%20Hs--UFO-7048E8?style=flat-square)

<br />

<sub>
  <a href="README_zh.md">简体中文</a> ·
  <b>English</b> ·
  <a href="README_ru.md">Русский</a> ·
  <a href="README_ko.md">한국어</a> ·
  <a href="README_jp.md">日本語</a> ·
  <a href="README_es.md">Español</a> ·
  <a href="README_fr.md">Français</a> ·
  <a href="README_de.md">Deutsch</a>
</sub>

</div>

---

<a id="toc"></a>

## Table of Contents

- [**What is Fuck Assembly**](#what-is-fa)
- [**What is ONC**](#what-is-onc)
    - [ONC communication](#onc-comm)
    - [Where to find the ONC project](#onc-project)
- [**What is FUN**](#what-is-fun)
    - [fun communication](#fun-comm)
    - [Where to find the fun project](#fun-project)
- [**What is UFO**](#what-is-ufo)
    - [Ts-UFO](#ts-ufo)
    - [Hs-UFO](#hs-ufo)

---

<a id="what-is-fa"></a>

## What is Fuck Assembly

**Fuck Assembly**, abbreviated **FA**, is a programming language suite I started after being tormented by assembly for far too long; it contains [ONC](#what-is-onc) and [FUN](#what-is-fun).

The main goal of the FA project is to reduce the use of traditional assembly at the bare-metal level, and to provide lower-level programming languages that are easier to read and easier to write, along with some high-level syntax.

| Language | Paradigm | What you can write |
| :--- | :--- | :--- |
| **ONC** | Object-oriented (OOP) | Most C# syntax and a fair amount of Java syntax, for building x86_16 bare-metal projects |
| **fun** | Procedural | fun's native syntax, for writing pure bare-metal programs |

<div align="right"><sub><a href="#toc">↑ Back to contents</a></sub></div>

---

<a id="what-is-onc"></a>

## What is ONC

ONC is an object-oriented (OOP) programming language. Its goal is to bring C# syntax down closer to the system level without the need for the massive .NET runtime. This means it can outperform C# in compile speed, run speed, and breadth of application.

At the system level, ONC does not play the role of replacing assembly; it tries to shake C's dominance among lower-level high-level languages with more modern syntax.

> [!NOTE]
> In short, ONC is not a language worth learning.

<a id="onc-comm"></a>

### ONC communication

- ONC supports painless use of the **C# BCL**; conversely, C# cannot use the **ONC BCL** — the syntax of the two can only be largely compatible in one direction.
- ONC's semantics differ from C#'s in some cases.
- ONC can communicate with **fun** painlessly.

<a id="onc-project"></a>

### Where to find the ONC project

| Project | Description |
| :--- | :--- |
| [**OCC**](https://github.com/CialloForMyCode/ONCCompilerCollection) | ONC compiler |

<div align="right"><sub><a href="#toc">↑ Back to contents</a></sub></div>

---

<a id="what-is-fun"></a>

## What is FUN

**fun** is a procedural programming language. Its goal is to give programmers an option to write no assembly at all for bare-metal programming.

On bare metal, fun can replace assembly better than ONC: fun's bare-metal support is higher than ONC's, and it does not have ONC's massive target-side runtime (Ts-UFO) — it uses a leaner host-side runtime (Hs-UFO), and the machine code it compiles is extremely lightweight.

<a id="fun-comm"></a>

### fun communication

fun has extremely broad support and can accept:

- `ONC IL`
- `C LLVM IR`
- `Rust LLVM IR`
- `Zig LLVM IR`

> [!IMPORTANT]
> Note that **fun itself does not produce LLVM IR.**

<a id="fun-project"></a>

### Where to find the fun project

| Project | Description |
| :--- | :--- |
| [**FCS**](https://github.com/CialloForMyCode/FunCompilerService) | fun compiler |

<div align="right"><sub><a href="#toc">↑ Back to contents</a></sub></div>

---

<a id="what-is-ufo"></a>

## What is UFO

**UnFuckOverflow**, abbreviated **UFO**.

UFO does not refer to one specific thing; it is a design concept: instead of relying on the traditional stack and heap structure, it reconstructs the original stack and heap structure into a new kind.

- The original LIFO structure is changed to **extraction by pointer**.
- Data in both the stack and the heap is **use-and-discard**: once taken, the old value is thrown away immediately.
- Pushing onto a full stack **overwrites the data at the very bottom**, instead of overflowing.
- Heap allocations are **reclaimed automatically**; in most cases no manual free is needed.

<a id="ts-ufo"></a>

### Ts-UFO

The target-side runtime (Target-side UFO) is compiled into the target file together with the machine code.

<a id="hs-ufo"></a>

### Hs-UFO

The host-side runtime (Host-side UFO) determines the program's internal architecture at compile time; once determined, the stack/heap structure cannot be changed at runtime.

<div align="right"><sub><a href="#toc">↑ Back to contents</a></sub></div>

---

<div align="center">

<sub>Fuck Assembly project — so you lose less hair</sub>

<sub><a href="#top">↑ Back to top</a></sub>

</div>
