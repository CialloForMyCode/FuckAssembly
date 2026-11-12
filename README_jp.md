<div align="center">

<a id="top"></a>

# Fuck Assembly

<sub>アセンブリに散々苦しめられた末に始めたプログラミング言語スイート</sub>

<br />

![languages](https://img.shields.io/badge/languages-ONC%20%7C%20fun-4B8BBE?style=flat-square)
![target](https://img.shields.io/badge/target-x86__16%20%C2%B7%20bare%20metal-2F9E44?style=flat-square)
![runtime](https://img.shields.io/badge/runtime-Ts--UFO%20%7C%20Hs--UFO-7048E8?style=flat-square)

<br />

<sub>
  <a href="README_zh.md">简体中文</a> ·
  <a href="README.md">English</a> ·
  <a href="README_ru.md">Русский</a> ·
  <a href="README_ko.md">한국어</a> ·
  <b>日本語</b> ·
  <a href="README_es.md">Español</a> ·
  <a href="README_fr.md">Français</a> ·
  <a href="README_de.md">Deutsch</a>
</sub>

</div>

---

<a id="toc"></a>

## 目次

- [**Fuck Assembly とは**](#what-is-fa)
- [**ONC とは**](#what-is-onc)
    - [ONC の通信](#onc-comm)
    - [ONC プロジェクトはどこにある](#onc-project)
- [**FUN とは**](#what-is-fun)
    - [fun の通信](#fun-comm)
    - [fun プロジェクトはどこにある](#fun-project)
- [**UFO とは**](#what-is-ufo)
    - [Ts-UFO](#ts-ufo)
    - [Hs-UFO](#hs-ufo)

---

<a id="what-is-fa"></a>

## Fuck Assembly とは

**Fuck Assembly**（略称 **FA**）は、アセンブリに散々苦しめられた末に始めたプログラミング言語スイートのプロジェクトで、[ONC](#what-is-onc) と [FUN](#what-is-fun) を含みます。

FA プロジェクトの主な目的は、ベアメタル層で従来のアセンブリの使用を減らし、より読みやすく書きやすい低レベルプログラミング言語と、一部の高級構文を提供することです。

| 言語 | パラダイム | 書けるもの |
| :--- | :--- | :--- |
| **ONC** | オブジェクト指向（OOP） | C# 構文の大部分と Java 構文のかなりの部分。x86_16 ベアメタルプログラミングプロジェクトを構築 |
| **fun** | 手続き型 | fun ネイティブ構文。純粋なベアメタルプログラムを書く |

<div align="right"><sub><a href="#toc">↑ 目次へ戻る</a></sub></div>

---

<a id="what-is-onc"></a>

## ONC とは

ONC はオブジェクト指向（OOP）プログラミング言語で、その目的は C# 構文をシステムのより低い層へ持ち込むことです。巨大な .NET ランタイムは必要ありません。つまりコンパイル速度、実行速度、応用の広さにおいて C# を上回れるということです。

ONC はシステム低層でアセンブリを置き換える役割ではありません。より現代的な構文で、より低層の高級言語における C 言語の支配的地位を揺るがそうとしています。

> [!NOTE]
> 結論から言うと、ONC は学ぶ価値のあるプログラミング言語ではありません。

<a id="onc-comm"></a>

### ONC の通信

- ONC は **C# BCL** を苦もなく使えます。逆に C# は **ONC BCL** を使えません —— 両者の構文は一方向にのみ、大部分の互換性を実現できます。
- ONC のセマンティクスは、場合によっては C# と同じではありません。
- ONC は **fun** と苦もなく通信できます。

<a id="onc-project"></a>

### ONC プロジェクトはどこにある

| プロジェクト | 説明 |
| :--- | :--- |
| [**OCC**](https://github.com/CialloForMyCode/ONCCompilerCollection) | ONC コンパイラ |

<div align="right"><sub><a href="#toc">↑ 目次へ戻る</a></sub></div>

---

<a id="what-is-fun"></a>

## FUN とは

**fun** は手続き型のプログラミング言語で、ベアメタルプログラミングにおいて、プログラマーにアセンブリを一切書かなくて済む選択肢を提供することを目的としています。

ベアメタル環境では、fun は ONC よりもアセンブリの代替になります：fun のベアメタル対応は ONC より進んでいて、ONC のような巨大なターゲット側ランタイム（Ts-UFO）もありません —— より簡素なホスト側ランタイム（Hs-UFO）を採用しており、コンパイルされるマシンコードは極めて軽量です。

<a id="fun-comm"></a>

### fun の通信

fun の対応範囲は非常に広く、以下をサポートします：

- `ONC IL`
- `C LLVM IR`
- `Rust LLVM IR`
- `Zig LLVM IR`

> [!IMPORTANT]
> 注意が必要です：**fun 自体は LLVM IR を出力しません。**

<a id="fun-project"></a>

### fun プロジェクトはどこにある

| プロジェクト | 説明 |
| :--- | :--- |
| [**FCS**](https://github.com/CialloForMyCode/FunCompilerService) | fun コンパイラ |

<div align="right"><sub><a href="#toc">↑ 目次へ戻る</a></sub></div>

---

<a id="what-is-ufo"></a>

## UFO とは

**UnFuckOverflow**、略称 **UFO**。

UFO は特定の何かを指すものではなく、一つの設計概念です：従来のスタック／ヒープ構造に依存せず、元のスタック／ヒープ構造を新式のスタック／ヒープ構造へと作り替えます。

- 元の LIFO 構造を**ポインタによる取り出し**に変更。
- スタックとヒープ内のデータはすべて**使い捨て**：一度取り出したらすぐに古い値を捨てます。
- スタックトップに達した後もさらにプッシュすると、スタックオーバーフローではなく**一番下のデータを押し出す**。
- ヒープ確保領域は**自動回収**され、ほとんどの場合で手動解放は不要。

<a id="ts-ufo"></a>

### Ts-UFO

ターゲット側ランタイム（Target-side UFO）で、マシンコードと一緒に対象ファイル内へコンパイルされます。

<a id="hs-ufo"></a>

### Hs-UFO

ホスト側ランタイム（Host-side UFO）で、コンパイル時にプログラム内部のアーキテクチャを確定します。一度確定すると、実行時にスタック／ヒープ構造を変更することはできません。

<div align="right"><sub><a href="#toc">↑ 目次へ戻る</a></sub></div>

---

<div align="center">

<sub>Fuck Assembly プロジェクト、抜け毛が少し減ります</sub>

<sub><a href="#top">↑ トップへ戻る</a></sub>

</div>
