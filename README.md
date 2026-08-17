# NTU Minimal Thesis

一個使用 XeLaTeX 的極簡[國立臺灣大學碩士論文](https://www.lib.ntu.edu.tw/doc/cl/NTUTDR_Guide.pdf)模板。

## 檔案目錄

```text
ntu-minimal-thesis/
├── main.tex                    # 論文資料與全文
├── main.pdf                    # 編譯完成的範例
├── ntu-minimal-thesis.cls      # 固定版面設定
├── references.bib              # BibTeX 參考文獻
├── assets/
│   └── watermark_faint.pdf     # 頁面浮水印
├── .gitignore                  # 忽略編譯產物
└── README.md                   # 使用說明
```

## 使用方式

### 1. 填寫論文資料

以下是 `main.tex` 目前使用的完整設定。使用模板時，請直接修改各欄位的值：

```latex
\ThesisSetup{
  % 中文字體；請填入 XeLaTeX 可辨識的字體族名稱
  font-main     = {Songti TC},       % 正文字體
  font-sans     = {Heiti TC},        % 無襯線與等寬字體
  font-kai      = {Kaiti TC},        % 楷體

  % 學院與系所；中英文四個欄位皆無預設值
  college-zh    = {社會科學院},       % 學院中文名稱
  college-en    = {College of Social Sciences}, % 學院英文名稱
  department-zh = {經濟學系},         % 系所中文名稱
  department-en = {Department of Economics},   % 系所英文名稱

  % 論文題目
  title-zh      = {從三千公里到黃泉：大雄與鄭莊公的尋母方法},
  title-en      = {From Three Thousand Kilometers to the Yellow Springs: How Nobita and Duke Zhuang Found Their Mothers},

  % 作者、學號與指導教授
  author-zh     = {範例學生},         % 作者中文姓名
  author-en     = {Example Student}, % 作者英文姓名
  student-id    = {R00000000},       % 學號
  advisor-zh    = {派大星教授加},      % 指導教授中文欄位
  advisor-en    = {Professor Patrick Star}, % 指導教授英文欄位

  % 日期與 DOI
  thesis-date   = {2026-06},         % 論文年月：YYYY-MM
  defense-date  = {2026-05-15},      % 口試日期：YYYY-MM-DD
  doi           = {10.1234/ntu.thesis}, % 尚無 DOI 時填 {}
}
```

學院與系所沒有預設值，四個中英文欄位都必須填寫。
字體也不會自動偵測或替換；請填入編譯環境可用的字體族名稱。

### 2. 填寫論文內容

繼續在同一個 `main.tex` 中替換以下內容：

- `acknowledgements`：誌謝。
- `abstracten`：英文摘要與 `\keywords{...}`。
- `abstractzh`：中文摘要與 `\keywords{...}`。
- `\thesismainmatter` 之後：論文正文，直接使用 `\section{...}` 分節。

模板會自動產生封面、口試委員會審定書、目錄及頁碼。論文較長時可以
自行使用 `\input{...}` 拆檔，但不是必要步驟。

### 3. 填寫參考文獻

將 BibTeX 書目放入 `references.bib`，並在正文使用 `\citep{key}` 引用。
`\printthesisbibliography` 會產生參考文獻並加入目錄。

## 編譯方式

### 本機編譯

系統需要 XeLaTeX、BibTeX、`latexmk`，以及 `\ThesisSetup` 中指定的字體。
在專案目錄執行：

```sh
latexmk -xelatex main.tex
```

完成後會產生 `main.pdf`。清除輔助檔案時執行：

```sh
latexmk -c
```

若沒有 `latexmk`，可以依序執行：

```sh
xelatex main.tex
bibtex main
xelatex main.tex
xelatex main.tex
```

### Overleaf

1. 上傳整個專案，並保留 `assets/` 目錄。
2. 將主文件設為 `main.tex`。
3. 將 Compiler 設為 **XeLaTeX**。
4. 按下 Recompile。
