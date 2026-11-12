<div align="center">

<a id="top"></a>

# Fuck Assembly

<sub>어셈블리에 한참 시달린 끝에 시작한 프로그래밍 언어 제품군</sub>

<br />

![languages](https://img.shields.io/badge/languages-ONC%20%7C%20fun-4B8BBE?style=flat-square)
![target](https://img.shields.io/badge/target-x86__16%20%C2%B7%20bare%20metal-2F9E44?style=flat-square)
![runtime](https://img.shields.io/badge/runtime-Ts--UFO%20%7C%20Hs--UFO-7048E8?style=flat-square)

<br />

<sub>
  <a href="README_zh.md">简体中文</a> ·
  <a href="README.md">English</a> ·
  <a href="README_ru.md">Русский</a> ·
  <b>한국어</b> ·
  <a href="README_jp.md">日本語</a> ·
  <a href="README_es.md">Español</a> ·
  <a href="README_fr.md">Français</a> ·
  <a href="README_de.md">Deutsch</a>
</sub>

</div>

---

<a id="toc"></a>

## 목차

- [**Fuck Assembly란 무엇인가**](#what-is-fa)
- [**ONC란 무엇인가**](#what-is-onc)
    - [ONC의 통신](#onc-comm)
    - [ONC 프로젝트는 어디서 찾을 수 있나](#onc-project)
- [**FUN이란 무엇인가**](#what-is-fun)
    - [fun의 통신](#fun-comm)
    - [fun 프로젝트는 어디서 찾을 수 있나](#fun-project)
- [**UFO란 무엇인가**](#what-is-ufo)
    - [Ts-UFO](#ts-ufo)
    - [Hs-UFO](#hs-ufo)

---

<a id="what-is-fa"></a>

## Fuck Assembly란 무엇인가

**Fuck Assembly**, 약칭 **FA**는 내가 어셈블리에 한참 시달린 끝에 시작한 프로그래밍 언어 제품군 프로젝트이며, [ONC](#what-is-onc)와 [FUN](#what-is-fun)을 포함한다.

FA 프로젝트의 주된 목적은 베어메탈 수준에서 전통적인 어셈블리의 사용을 줄이고, 더 읽기 쉽고 쓰기 쉬운 저수준 프로그래밍 언어와 일부 고급 문법을 제공하는 것이다.

| 언어 | 패러다임 | 무엇을 쓸 수 있나 |
| :--- | :--- | :--- |
| **ONC** | 객체 지향(OOP) | 대부분의 C# 문법과 상당량의 Java 문법, x86_16 베어메탈 프로그래밍 프로젝트 구축 |
| **fun** | 절차 지향 | fun 고유 문법, 순수한 베어메탈 프로그램 작성 |

<div align="right"><sub><a href="#toc">↑ 목차로 돌아가기</a></sub></div>

---

<a id="what-is-onc"></a>

## ONC란 무엇인가

ONC는 객체 지향(OOP) 프로그래밍 언어로, 거대한 .NET 런타임 없이 C# 문법을 시스템의 더 낮은 층으로 끌어내리는 것을 목표로 한다. 즉 컴파일 속도, 실행 속도, 그리고 적용 범위에서 C#보다 더 뛰어날 수 있다.

ONC는 시스템 저수준에서 어셈블리를 대체하는 역할을 맡지는 않는다. 그것은 더 현대적인 문법으로 더 낮은 층의 고급 언어들 사이에서 C 언어가 누리는 지배적 지위를 흔들어 보려 한다.

> [!NOTE]
> 결론부터 말하면, ONC는 배울 가치가 있는 프로그래밍 언어가 아니다.

<a id="onc-comm"></a>

### ONC의 통신

- ONC는 **C# BCL**을 아무 불편 없이 사용할 수 있다. 반대로 C#은 **ONC BCL**을 사용할 수 없다 — 두 언어의 문법은 한 방향으로만 대부분 호환된다.
- ONC의 의미론은 어떤 경우에는 C#과 같지 않다.
- ONC는 **fun**과 아무 불편 없이 통신할 수 있다.

<a id="onc-project"></a>

### ONC 프로젝트는 어디서 찾을 수 있나

| 프로젝트 | 설명 |
| :--- | :--- |
| [**OCC**](https://github.com/CialloForMyCode/ONCCompilerCollection) | ONC 컴파일러 |

<div align="right"><sub><a href="#toc">↑ 목차로 돌아가기</a></sub></div>

---

<a id="what-is-fun"></a>

## FUN이란 무엇인가

**fun**은 절차 지향 프로그래밍 언어로, 베어메탈 프로그래밍에서 프로그래머에게 어셈블리를 전혀 쓰지 않아도 되는 선택지를 제공하는 것을 목표로 한다.

베어메탈 환경에서 fun은 ONC보다 어셈블리를 더 잘 대체한다. fun은 ONC보다 베어메탈 지원이 뛰어나고, ONC의 거대한 대상 측 런타임(Ts-UFO)도 없다 — 대신 더 간결한 호스트 측 런타임(Hs-UFO)을 채택하며, 그렇게 컴파일된 기계어는 극히 가볍다.

<a id="fun-comm"></a>

### fun의 통신

fun의 지원 범위는 매우 넓어 다음을 지원한다:

- `ONC IL`
- `C LLVM IR`
- `Rust LLVM IR`
- `Zig LLVM IR`

> [!IMPORTANT]
> 주의할 점: **fun 자체는 LLVM IR을 생성하지 않는다.**

<a id="fun-project"></a>

### fun 프로젝트는 어디서 찾을 수 있나

| 프로젝트 | 설명 |
| :--- | :--- |
| [**FCS**](https://github.com/CialloForMyCode/FunCompilerService) | fun 컴파일러 |

<div align="right"><sub><a href="#toc">↑ 목차로 돌아가기</a></sub></div>

---

<a id="what-is-ufo"></a>

## UFO란 무엇인가

**UnFuckOverflow**, 약칭 **UFO**.

UFO는 특정한 하나를 가리키는 것이 아니라 하나의 설계 개념이다. 전통적인 스택·힙 구조에 의존하지 않고, 원래의 스택·힙 구조를 새로운 방식의 스택·힙 구조로 재구성한다.

- 기존의 LIFO 구조를 **포인터 단위 추출** 방식으로 바꾼다.
- 스택과 힙 안의 데이터는 모두 **쓴 즉시 버림** 방식이다: 한 번 꺼내 쓰면 곧바로 이전 값을 버린다.
- 스택 꼭대기에 도달한 뒤 계속 푸시하면 스택 오버플로가 아니라 **가장 밑의 데이터를 밀어낸다**.
- 힙 할당 공간은 **자동으로 회수**되며, 대부분의 경우 수동으로 해제할 필요가 없다.

<a id="ts-ufo"></a>

### Ts-UFO

대상 측 런타임(Target-side UFO)으로, 기계어와 함께 대상 파일 안으로 컴파일된다.

<a id="hs-ufo"></a>

### Hs-UFO

호스트 측 런타임(Host-side UFO)으로, 컴파일 시점에 프로그램 내부 구조를 확정한다. 한 번 확정되면 런타임에 스택／힙 구조를 바꿀 수 없다.

<div align="right"><sub><a href="#toc">↑ 목차로 돌아가기</a></sub></div>

---

<div align="center">

<sub>Fuck Assembly 프로젝트, 머리카락이 덜 빠지도록</sub>

<sub><a href="#top">↑ 맨 위로</a></sub>

</div>
