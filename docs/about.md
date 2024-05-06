---
title: 关于
hide:
  - footer
  - navigation
---
# 关于
文档基于个人经验进行编写，可能存在一些不足之处。如果你有确认有误的内容或者需要补充的内容，可以发 Issue 或者提交 PR 到本仓库。


## 文档地址
- https://licyk.github.io/SDNote
- https://sdnote.netlify.app
- https://sdnote.vercel.app （国内访问受限）


## 将仓库克隆到本地
```
git clone https://github.com/licyk/SDNote
```


## 配置文档运行环境
```
cd SDNote
python -m venv venv
.\venv\Scripts\Activate.ps1
pip install -r requirements.txt
```


## 在本地构建文档
```
mkdocs serve
```


## 声明
1. 如果本文档外链的内容中有不合适的内容，与本文档无关。
2. 引用或复制内容需要注明链接。
3. 文档基于公开材料和经验编写，不对内容准确性负责。
4. 文档使用 [GFDL](https://github.com/licyk/SDNote?tab=GFDL-1.3-1-ov-file#readme) 许可，如果需要使用本文档的内容，您必须遵守 [GFDL](https://github.com/licyk/SDNote?tab=GFDL-1.3-1-ov-file#readme)。


***


<!--Giscus-->
<script src="https://giscus.app/client.js"
        data-repo="licyk/SDNote"
        data-repo-id="R_kgDOL0EOiA"
        data-category="Comment"
        data-category-id="DIC_kwDOL0EOiM4Ce_qH"
        data-mapping="pathname"
        data-strict="0"
        data-reactions-enabled="1"
        data-emit-metadata="0"
        data-input-position="top"
        data-theme="preferred_color_scheme"
        data-lang="zh-CN"
        crossorigin="anonymous"
        async>
</script>

<canvas
    id="fireworks"
    style="position: fixed; top: 0; left: 0; width: 100vw; height: 100vh; pointer-events: none; z-index: 32767" >
</canvas>
<script src="https://cdn.staticfile.org/animejs/3.2.1/anime.min.js"></script>
<script src="../assets/js/fireworks.min.js"></script>

<canvas
    id="background"
    style="position: fixed; top: 0; left: 0; width: 100vw; height: 100vh; pointer-events: none; z-index: -1">
</canvas>

<!--
<script src="../assets/js/background.min.js"></script>
-->