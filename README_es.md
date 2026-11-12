<div align="center">

<a id="top"></a>

# Fuck Assembly

<sub>Un conjunto de lenguajes de programación nacido tras mucho sufrir con el ensamblador</sub>

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
  <b>Español</b> ·
  <a href="README_fr.md">Français</a> ·
  <a href="README_de.md">Deutsch</a>
</sub>

</div>

---

<a id="toc"></a>

## Índice

- [**Qué es Fuck Assembly**](#what-is-fa)
- [**Qué es ONC**](#what-is-onc)
    - [La comunicación de ONC](#onc-comm)
    - [Dónde encontrar el proyecto ONC](#onc-project)
- [**Qué es FUN**](#what-is-fun)
    - [La comunicación de fun](#fun-comm)
    - [Dónde encontrar el proyecto fun](#fun-project)
- [**Qué es UFO**](#what-is-ufo)
    - [Ts-UFO](#ts-ufo)
    - [Hs-UFO](#hs-ufo)

---

<a id="what-is-fa"></a>

## Qué es Fuck Assembly

**Fuck Assembly**, abreviado **FA**, es un proyecto de conjunto de lenguajes de programación que empecé tras mucho sufrir con el ensamblador, y que incluye [ONC](#what-is-onc) y [FUN](#what-is-fun).

El objetivo principal del proyecto FA es reducir el uso del ensamblador tradicional en el nivel del metal desnudo, y ofrecer un lenguaje de bajo nivel más legible y más escribible, junto con parte de la sintaxis de alto nivel.

| Lenguaje | Paradigma | Qué puedes escribir |
| :--- | :--- | :--- |
| **ONC** | Orientado a objetos (OOP) | La mayor parte de la sintaxis de C# y buena parte de la de Java, para construir proyectos de programación de metal desnudo x86_16 |
| **fun** | Orientado a procedimientos | La sintaxis nativa de fun, para escribir programas puros de metal desnudo |

<div align="right"><sub><a href="#toc">↑ Volver al índice</a></sub></div>

---

<a id="what-is-onc"></a>

## Qué es ONC

ONC es un lenguaje de programación orientado a objetos (OOP) cuyo propósito es llevar la sintaxis de C# a las capas más bajas del sistema sin necesidad del enorme runtime de .NET. Eso significa que puede superar a C# tanto en velocidad de compilación y de ejecución como en amplitud de aplicación.

En las capas bajas del sistema, ONC no juega el papel de sustituir al ensamblador: intenta sacudir, con una sintaxis más moderna, el dominio del lenguaje C entre los lenguajes de alto nivel más cercanos al hardware.

> [!NOTE]
> En resumen, ONC no es un lenguaje de programación que valga la pena aprender.

<a id="onc-comm"></a>

### La comunicación de ONC

- ONC permite usar **C# BCL** sin dolor; a la inversa, C# no puede usar **ONC BCL** — la sintaxis de ambos solo alcanza una compatibilidad mayoritaria en un único sentido.
- La semántica de ONC no es idéntica a la de C# en algunos casos.
- ONC puede comunicarse con **fun** sin dolor.

<a id="onc-project"></a>

### Dónde encontrar el proyecto ONC

| Proyecto | Descripción |
| :--- | :--- |
| [**OCC**](https://github.com/CialloForMyCode/ONCCompilerCollection) | El compilador de ONC |

<div align="right"><sub><a href="#toc">↑ Volver al índice</a></sub></div>

---

<a id="what-is-fun"></a>

## Qué es FUN

**fun** es un lenguaje de programación orientado a procedimientos cuyo propósito es ofrecer al programador, en la programación de metal desnudo, la opción de no escribir ni una línea de ensamblador.

En un entorno de metal desnudo, fun sustituye al ensamblador mejor que ONC: fun tiene un soporte de metal desnudo mayor que el de ONC y no arrastra el enorme runtime del lado del objetivo (Ts-UFO) de ONC —usa un runtime del lado del anfitrión (Hs-UFO) mucho más ligero—, y el código máquina que genera es extremadamente liviano.

<a id="fun-comm"></a>

### La comunicación de fun

El soporte de fun es amplísimo, puede usar:

- `ONC IL`
- `C LLVM IR`
- `Rust LLVM IR`
- `Zig LLVM IR`

> [!IMPORTANT]
> Hay que tener en cuenta que **fun por sí mismo no genera LLVM IR.**

<a id="fun-project"></a>

### Dónde encontrar el proyecto fun

| Proyecto | Descripción |
| :--- | :--- |
| [**FCS**](https://github.com/CialloForMyCode/FunCompilerService) | El compilador de fun |

<div align="right"><sub><a href="#toc">↑ Volver al índice</a></sub></div>

---

<a id="what-is-ufo"></a>

## Qué es UFO

**UnFuckOverflow**, abreviado **UFO**.

UFO no designa algo concreto, sino un concepto de diseño: no depende de la estructura de pila-montón tradicional, sino que reconstruye la estructura de pila-montón original en una estructura de pila-montón de nuevo tipo.

- Cambia la estructura LIFO original por una **extracción por puntero**.
- Los datos dentro de la pila y del montón son **de usar y tirar**: tras un solo uso, el valor viejo se descarta de inmediato.
- Seguir apilando después de llegar a la cima de la pila **desplaza los datos del fondo**, en lugar de desbordar la pila.
- El espacio asignado en el montón se **recupera automáticamente**; en la mayoría de los casos no hace falta liberarlo a mano.

<a id="ts-ufo"></a>

### Ts-UFO

Runtime del lado del objetivo (Target-side UFO), se compila junto con el código máquina dentro del archivo objeto.

<a id="hs-ufo"></a>

### Hs-UFO

Runtime del lado del anfitrión (Host-side UFO), fija la arquitectura interna del programa en tiempo de compilación; una vez fijada, no es posible cambiar en tiempo de ejecución la estructura de pila/montón.

<div align="right"><sub><a href="#toc">↑ Volver al índice</a></sub></div>

---

<div align="center">

<sub>El proyecto Fuck Assembly, para perder menos pelo</sub>

<sub><a href="#top">↑ Volver arriba</a></sub>

</div>
