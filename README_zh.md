<div align="center">

<a id="top"></a>

# Fuck Assembly

<sub>被汇编折磨许久之后开始的一个编程语言套件</sub>

<br />

![languages](https://img.shields.io/badge/languages-ONC%20%7C%20fun-4B8BBE?style=flat-square)
![target](https://img.shields.io/badge/target-x86__16%20%C2%B7%20bare%20metal-2F9E44?style=flat-square)
![runtime](https://img.shields.io/badge/runtime-Ts--UFO%20%7C%20Hs--UFO-7048E8?style=flat-square)

<br />

<sub>
  <b>简体中文</b> ·
  <a href="README.md">English</a> ·
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

## 目录

- [**什么是 Fuck Assembly**](#what-is-fa)
- [**什么是 ONC**](#what-is-onc)
    - [ONC 的通信](#onc-comm)
    - [在哪能找到 ONC 项目](#onc-project)
- [**什么是 FUN**](#what-is-fun)
    - [fun 的通信](#fun-comm)
    - [在哪能找到 fun 项目](#fun-project)
- [**什么是 UFO**](#what-is-ufo)
    - [Ts-UFO](#ts-ufo)
    - [Hs-UFO](#hs-ufo)

---

<a id="what-is-fa"></a>

## 什么是 Fuck Assembly

**Fuck Assembly**，简称 **FA**，是我在被汇编折磨许久后开始的一个编程语言套件项目，其中包含 [ONC](#what-is-onc) 与 [FUN](#what-is-fun)。

FA 工程的主要目的，是在裸机层面减少传统汇编的使用，并提供更可读、更可写的底层编程语言与部分高级语法。

| 语言 | 范式 | 你可以写 |
| :--- | :--- | :--- |
| **ONC** | 面向对象（OOP） | 大部分 C# 语法与较多 Java 语法，构建 x86_16 裸机编程项目 |
| **fun** | 面向过程 | fun 原生语法，编写纯粹的裸机程序 |

<div align="right"><sub><a href="#toc">↑ 返回目录</a></sub></div>

---

<a id="what-is-onc"></a>

## 什么是 ONC

ONC 是一种面向对象（OOP）编程语言，它的目的是把 C# 语法带入系统更底层，而无需庞大的 .NET 运行时。这意味着它在编译速度、运行速度与应用广泛程度上都可以比 C# 更出色。

ONC 在系统底层扮演的并非代替汇编的角色，它试图以更现代化的语法撼动 C 语言在更底层的高级语言中的统治地位。

> [!NOTE]
> 总而言之，ONC 不是一门值得学习的编程语言。

<a id="onc-comm"></a>

### ONC 的通信

- ONC 支持无痛使用 **C# BCL**；反过来，C# 不能使用 **ONC BCL** —— 两者的语法只能做到单向的大部分兼容。
- ONC 的语义在某些情况下与 C# 并不相同。
- ONC 可以无痛与 **fun** 进行通信。

<a id="onc-project"></a>

### 在哪能找到 ONC 项目

| 项目 | 说明 |
| :--- | :--- |
| [**OCC**](https://github.com/CialloForMyCode/ONCCompilerCollection) | ONC 编译器 |

<div align="right"><sub><a href="#toc">↑ 返回目录</a></sub></div>

---

<a id="what-is-fun"></a>

## 什么是 FUN

**fun** 是一种面向过程的编程语言，它的目的是在裸机编程下，为程序员提供一个可以完全不写汇编的选择。

在裸机环境下，fun 比 ONC 更能代替汇编：fun 对裸机的支持比 ONC 更高，且没有 ONC 的庞大目标侧运行时（Ts-UFO）——它采用的是更加精简的宿主侧运行时（Hs-UFO），所编译出的机器码极其轻便。

<a id="fun-comm"></a>

### fun 的通信

fun 的支持性极广，可支持：

- `ONC IL`
- `C LLVM IR`
- `Rust LLVM IR`
- `Zig LLVM IR`

> [!IMPORTANT]
> 需要注意的是：**fun 本身不产出 LLVM IR。**

<a id="fun-project"></a>

### 在哪能找到 fun 项目

| 项目 | 说明 |
| :--- | :--- |
| [**FCS**](https://github.com/CialloForMyCode/FunCompilerService) | fun 编译器 |

<div align="right"><sub><a href="#toc">↑ 返回目录</a></sub></div>

---

<a id="what-is-ufo"></a>

## 什么是 UFO

**UnFuckOverflow**，简称 **UFO**。

UFO 并不是特指某一个东西，而是一个设计概念：它不依赖传统栈堆结构，而是把原本的栈堆结构重构成新式栈堆结构。

- 将原本的 LIFO 结构改为**按指针抽取**。
- 栈与堆内的数据都是**随用随抛**：一次取用后立马抛弃旧值。
- 在到达栈顶后继续压栈，会**顶掉最底下的数据**，而非栈溢出。
- 堆分配空间会**自动回收**，多数情况下无需手动释放。

<a id="ts-ufo"></a>

### Ts-UFO

目标侧运行时（Target-side UFO），会随着机器码一起被编译到目标文件内。

<a id="hs-ufo"></a>

### Hs-UFO

宿主侧运行时（Host-side UFO），在编译时确定程序内部架构；一旦确定，无法在运行时更改栈／堆结构。

<div align="right"><sub><a href="#toc">↑ 返回目录</a></sub></div>

---

<div align="center">

<sub>Fuck Assembly 项目，让头发掉的更少</sub>

<sub><a href="#top">↑ 回到顶部</a></sub>

</div>
