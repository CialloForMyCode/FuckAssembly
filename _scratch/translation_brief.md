# README 翻译规范（内部任务书）

目标：把 `README_zh.md` 翻成目标语言，输出一份**结构完全一致**的 README。
这是一次“只换文字、不动骨架”的翻译：排版已经在 `README_zh.md` 里定稿。

## 硬性结构规则

以下内容必须与源文件逐字一致（不要翻译、不要重排、不要增删）：

1. 所有 HTML 标签与属性：`<div align="center">`、`<div align="right">`、`<sub>`、`<b>`、`<br />`、`<a href="...">`。
2. 全部 `<a id="..."></a>` 锚点，id 原样保留（共 12 个：top、toc、what-is-fa、what-is-onc、onc-comm、onc-project、what-is-fun、fun-comm、fun-project、what-is-ufo、ts-ufo、hs-ufo）。
3. 所有链接 URL 与徽章图片 URL 原样保留。
4. 标题层级：1 个 `#`，5 个 `##`，6 个 `###`；标题文字翻译，`#` 数量不变。
5. 表格：3 个表，竖线与 `| :--- |` 对齐行保持原样，只翻译表头和数据单元格的文字；列数不变。
6. 列表：缩进、`-` 标记、列表项数量不变。
7. 提示块：`> [!NOTE]` 与 `> [!IMPORTANT]` 标记行原样保留，只翻译下一行的正文。
8. 6 条 `---` 分隔线原样保留。
9. 每处 `<div align="right"><sub><a href="#toc">↑ ...</a></sub></div>` 保留，只翻译 `↑ ...` 这句。
10. 原文“一个段落 / 一个列表项 / 一个表格行”在译文中仍然各自独占一行；不要合并、不要拆行。

## 语言切换行

源文件：

```
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
```

规则：把 `简体中文` 从 `<b>` 改成指向 `README_zh.md` 的链接（`<a href="README_zh.md">简体中文</a>`），
并把**目标语言自己**那一项改成 `<b>...</b>`，其余各项保持原链接与原文。

| 输出文件 | 加粗项 |
| :--- | :--- |
| `README_ru.md` | `Русский` |
| `README_ko.md` | `한국어` |
| `README_jp.md` | `日本語` |
| `README_es.md` | `Español` |
| `README_fr.md` | `Français` |
| `README_de.md` | `Deutsch` |

## 不翻译的词

Fuck Assembly、FA、ONC、fun（小写）、FUN（大写处）、UFO、UnFuckOverflow、Ts-UFO、Hs-UFO、
OCC、FCS、C#、Java、.NET、OOP、BCL、IL、LLVM IR、LIFO、x86_16、GitHub、README。
代码块/行内代码（`ONC IL`、`C LLVM IR` 等）保持原样。

`**草死汇编**` 这一行在所有语言版本里原样保留（项目的中文名）。

## 语气

原文口吻随意、自嘲、略带粗口幽默（例如“让头发掉的更少”）。译文保持同样的轻松口吻，
不要翻成严肃的官方文档腔。术语（栈堆、裸机、目标侧/宿主侧、按指针抽取、随用随抛）
在整篇里用词统一。

## 自检

写完后重新读一遍文件，确认：12 个锚点、6 条 `---`、3 个表、2 个提示块、5 个 `##`、6 个 `###`、
语言切换行顺序与链接正确、没有残留中文句子（`草死汇编` 与语言名除外）。
