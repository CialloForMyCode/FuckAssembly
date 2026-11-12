<div align="center">

<a id="top"></a>

# Fuck Assembly

<sub>Eine Programmiersprachen-Suite, entstanden nach langem Leiden unter Assembler</sub>

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
  <a href="README_jp.md">日本語</a> ·
  <a href="README_es.md">Español</a> ·
  <a href="README_fr.md">Français</a> ·
  <b>Deutsch</b>
</sub>

</div>

---

<a id="toc"></a>

## Inhaltsverzeichnis

- [**Was ist Fuck Assembly**](#what-is-fa)
- [**Was ist ONC**](#what-is-onc)
    - [Kommunikation von ONC](#onc-comm)
    - [Wo man das ONC-Projekt findet](#onc-project)
- [**Was ist FUN**](#what-is-fun)
    - [Kommunikation von fun](#fun-comm)
    - [Wo man das fun-Projekt findet](#fun-project)
- [**Was ist UFO**](#what-is-ufo)
    - [Ts-UFO](#ts-ufo)
    - [Hs-UFO](#hs-ufo)

---

<a id="what-is-fa"></a>

## Was ist Fuck Assembly

**Fuck Assembly**, kurz **FA**, ist ein Programmiersprachen-Suite-Projekt, das ich nach langem Leiden unter Assembler begonnen habe und das [ONC](#what-is-onc) und [FUN](#what-is-fun) enthält.

Das Hauptziel des FA-Projekts ist es, auf Bare-Metal-Ebene den Einsatz von traditionellem Assembler zu verringern und besser lesbare, besser schreibbare Low-Level-Programmiersprachen samt einem Teil an High-Level-Syntax bereitzustellen.

| Sprache | Paradigma | Was du schreiben kannst |
| :--- | :--- | :--- |
| **ONC** | Objektorientiert (OOP) | Ein Großteil der C#-Syntax und viel Java-Syntax, für x86_16-Bare-Metal-Projekte |
| **fun** | Prozedural | native fun-Syntax, für reine Bare-Metal-Programme |

<div align="right"><sub><a href="#toc">↑ Zurück zum Inhalt</a></sub></div>

---

<a id="what-is-onc"></a>

## Was ist ONC

ONC ist eine objektorientierte (OOP) Programmiersprache; ihr Ziel ist es, C#-Syntax tiefer in die Systemebene zu bringen, ohne eine riesige .NET-Laufzeit. Das heißt: Bei Kompiliergeschwindigkeit, Laufzeitgeschwindigkeit und Anwendungsbreite kann sie besser als C# sein.

Auf der Systemebene spielt ONC nicht die Rolle eines Assembler-Ersatzes; es versucht, mit modernerer Syntax die Vorherrschaft von C unter den tiefer liegenden High-Level-Sprachen zu erschüttern.

> [!NOTE]
> Kurz gesagt: ONC ist keine Programmiersprache, die es zu lernen lohnt.

<a id="onc-comm"></a>

### Kommunikation von ONC

- ONC unterstützt die schmerzfreie Nutzung der **C# BCL**; umgekehrt kann C# die **ONC BCL** nicht nutzen — die Syntax der beiden ist nur in eine Richtung weitgehend kompatibel.
- Die Semantik von ONC ist in manchen Fällen nicht dieselbe wie die von C#.
- ONC kann schmerzfrei mit **fun** kommunizieren.

<a id="onc-project"></a>

### Wo man das ONC-Projekt findet

| Projekt | Beschreibung |
| :--- | :--- |
| [**OCC**](https://github.com/CialloForMyCode/ONCCompilerCollection) | ONC-Compiler |

<div align="right"><sub><a href="#toc">↑ Zurück zum Inhalt</a></sub></div>

---

<a id="what-is-fun"></a>

## Was ist FUN

**fun** ist eine prozedurale Programmiersprache; ihr Ziel ist es, Programmierern beim Bare-Metal-Programmieren eine Option zu bieten, bei der man überhaupt keinen Assembler schreiben muss.

In der Bare-Metal-Umgebung kann fun Assembler besser ersetzen als ONC: fun hat eine höhere Bare-Metal-Unterstützung als ONC und besitzt nicht die riesige zielseitige Laufzeit von ONC (Ts-UFO) — es verwendet eine schlankere hostseitige Laufzeit (Hs-UFO), und der erzeugte Maschinencode ist extrem leichtgewichtig.

<a id="fun-comm"></a>

### Kommunikation von fun

fun ist extrem vielseitig und unterstützt:

- `ONC IL`
- `C LLVM IR`
- `Rust LLVM IR`
- `Zig LLVM IR`

> [!IMPORTANT]
> Zu beachten: **fun selbst erzeugt kein LLVM IR.**

<a id="fun-project"></a>

### Wo man das fun-Projekt findet

| Projekt | Beschreibung |
| :--- | :--- |
| [**FCS**](https://github.com/CialloForMyCode/FunCompilerService) | fun-Compiler |

<div align="right"><sub><a href="#toc">↑ Zurück zum Inhalt</a></sub></div>

---

<a id="what-is-ufo"></a>

## Was ist UFO

**UnFuckOverflow**, kurz **UFO**.

UFO bezeichnet nicht ein bestimmtes Ding, sondern ein Designkonzept: Es verlässt sich nicht auf die traditionelle Stack-Heap-Struktur, sondern baut die ursprüngliche Stack-Heap-Struktur zu einer neuartigen Stack-Heap-Struktur um.

- Die ursprüngliche LIFO-Struktur wird zu **zeigerbasiertem Herausziehen** geändert.
- Daten in Stack und Heap werden **nach Gebrauch weggeworfen**: nach einer einmaligen Benutzung wird der alte Wert sofort verworfen.
- Wer nach Erreichen der Stack-Oberkante weiter pusht, **verdrängt die untersten Daten** statt einen Stacküberlauf auszulösen.
- Heap-Speicher wird **automatisch zurückgewonnen**; in den meisten Fällen ist kein manuelles Freigeben nötig.

<a id="ts-ufo"></a>

### Ts-UFO

Die zielseitige Laufzeit (Target-side UFO) wird zusammen mit dem Maschinencode in die Zieldatei kompiliert.

<a id="hs-ufo"></a>

### Hs-UFO

Die hostseitige Laufzeit (Host-side UFO) legt zur Kompilierzeit die interne Architektur des Programms fest; ist diese einmal festgelegt, lassen sich Stack-/Heap-Struktur zur Laufzeit nicht mehr ändern.

<div align="right"><sub><a href="#toc">↑ Zurück zum Inhalt</a></sub></div>

---

<div align="center">

<sub>Das Fuck Assembly Projekt – damit weniger Haare ausfallen</sub>

<sub><a href="#top">↑ Nach oben</a></sub>

</div>
