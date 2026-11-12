<div align="center">

<a id="top"></a>

# Fuck Assembly

<sub>Une suite de langages commencée après avoir été longuement torturé par l'assembleur</sub>

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
  <b>Français</b> ·
  <a href="README_de.md">Deutsch</a>
</sub>

</div>

---

<a id="toc"></a>

## Sommaire

- [**Qu'est-ce que Fuck Assembly**](#what-is-fa)
- [**Qu'est-ce que ONC**](#what-is-onc)
    - [La communication de ONC](#onc-comm)
    - [Où trouver le projet ONC](#onc-project)
- [**Qu'est-ce que FUN**](#what-is-fun)
    - [La communication de fun](#fun-comm)
    - [Où trouver le projet fun](#fun-project)
- [**Qu'est-ce que UFO**](#what-is-ufo)
    - [Ts-UFO](#ts-ufo)
    - [Hs-UFO](#hs-ufo)

---

<a id="what-is-fa"></a>

## Qu'est-ce que Fuck Assembly

**Fuck Assembly**, en abrégé **FA**, est un projet de suite de langages que j'ai commencé après avoir été longuement torturé par l'assembleur, et qui contient [ONC](#what-is-onc) et [FUN](#what-is-fun).

L'objectif principal du projet FA est de réduire l'usage de l'assembleur traditionnel au niveau du bare metal, et de fournir des langages de programmation bas niveau plus lisibles et plus faciles à écrire, avec une partie de la syntaxe de haut niveau.

| Langage | Paradigme | Ce que vous pouvez écrire |
| :--- | :--- | :--- |
| **ONC** | Orienté objet (OOP) | La plupart de la syntaxe C# et pas mal de syntaxe Java, pour construire des projets de programmation bare metal x86_16 |
| **fun** | Orienté procédural | La syntaxe native de fun, pour écrire des programmes bare metal purs |

<div align="right"><sub><a href="#toc">↑ Retour au sommaire</a></sub></div>

---

<a id="what-is-onc"></a>

## Qu'est-ce que ONC

ONC est un langage de programmation orienté objet (OOP), dont le but est d'amener la syntaxe C# plus près du bas niveau du système, sans l'encombrant runtime .NET. Cela signifie qu'il peut faire mieux que C# en vitesse de compilation, en vitesse d'exécution et en étendue d'application.

ONC ne joue pas, au plus bas du système, le rôle de remplacer l'assembleur : il cherche à ébranler, à coups d'une syntaxe plus moderne, la domination du langage C parmi les langages de haut niveau qui descendent le plus bas.

> [!NOTE]
> Bref, ONC n'est pas un langage qui vaut la peine d'être appris.

<a id="onc-comm"></a>

### La communication de ONC

- ONC permet d'utiliser sans douleur la **BCL C#** ; l'inverse n'est pas vrai : C# ne peut pas utiliser la **BCL ONC** — la compatibilité syntaxique entre les deux n'est que partielle et à sens unique.
- La sémantique de ONC n'est pas identique à celle de C# dans certains cas.
- ONC peut communiquer sans douleur avec **fun**.

<a id="onc-project"></a>

### Où trouver le projet ONC

| Projet | Description |
| :--- | :--- |
| [**OCC**](https://github.com/CialloForMyCode/ONCCompilerCollection) | Le compilateur ONC |

<div align="right"><sub><a href="#toc">↑ Retour au sommaire</a></sub></div>

---

<a id="what-is-fun"></a>

## Qu'est-ce que FUN

**fun** est un langage de programmation orienté procédural, dont le but est d'offrir au programmeur, en programmation bare metal, une option où il n'écrit pas du tout d'assembleur.

En environnement bare metal, fun remplace mieux l'assembleur que ONC : son support du bare metal est supérieur à celui de ONC, et il n'a pas l'encombrant runtime côté cible de ONC (Ts-UFO) — il utilise un runtime côté hôte plus léger (Hs-UFO), et le code machine produit est extrêmement léger.

<a id="fun-comm"></a>

### La communication de fun

Le support de fun est très large, il prend en charge :

- `ONC IL`
- `C LLVM IR`
- `Rust LLVM IR`
- `Zig LLVM IR`

> [!IMPORTANT]
> À noter : **fun ne produit pas lui-même de LLVM IR.**

<a id="fun-project"></a>

### Où trouver le projet fun

| Projet | Description |
| :--- | :--- |
| [**FCS**](https://github.com/CialloForMyCode/FunCompilerService) | Le compilateur fun |

<div align="right"><sub><a href="#toc">↑ Retour au sommaire</a></sub></div>

---

<a id="what-is-ufo"></a>

## Qu'est-ce que UFO

**UnFuckOverflow**, en abrégé **UFO**.

UFO ne désigne pas une chose précise, mais un concept de conception : il ne repose pas sur la structure pile/tas traditionnelle : il refond la structure pile/tas classique en une structure pile/tas d'un nouveau genre.

- Remplacer la structure LIFO d'origine par une **extraction par pointeur**.
- Les données dans la pile et dans le tas sont **jetées après usage** : une fois lues, l'ancienne valeur est immédiatement abandonnée.
- Continuer à empiler après avoir atteint le sommet de la pile **écrase la donnée tout en bas**, au lieu de provoquer un débordement de pile.
- L'espace alloué sur le tas est **récupéré automatiquement** ; dans la plupart des cas, pas besoin de libérer à la main.

<a id="ts-ufo"></a>

### Ts-UFO

Runtime côté cible (Target-side UFO), compilé dans le fichier cible avec le code machine.

<a id="hs-ufo"></a>

### Hs-UFO

Runtime côté hôte (Host-side UFO), qui fixe l'architecture interne du programme à la compilation ; une fois fixée, la structure de pile et du tas ne peut plus changer à l'exécution.

<div align="right"><sub><a href="#toc">↑ Retour au sommaire</a></sub></div>

---

<div align="center">

<sub>Le projet Fuck Assembly, pour faire tomber un peu moins de cheveux</sub>

<sub><a href="#top">↑ Retour en haut</a></sub>

</div>
