---
title: 提示词高级用法
---
# 提示词高级用法
在 SD WebUI 中，不仅可以用简单句子或者单词来写提示词，也可以用高级的提示词用法来写提示词，实现不同的效果。

## 提示词权重
下面为调节提示词权重的方法。

- `(提示词)`：将提示词的权重增加 1.1 倍
- `((提示词))`：将提示词的权重增加 1.1*1.1 倍（1.21 倍）
- `[提示词]`：将提示词的权重降低 1.1 倍

不过调节提示词的权重还有更简单的方法。
```
（提示词:权重）
```

这种调节提示词权重的方法更美观，也更直观。

## 特殊符号转义
这是一个例子：
```
1girl, klee \(genshin impact\), white background,
```
上述的提示词例子中可以看到`\`这个符号，这是将括号从功能符号转义为普通的符号，作为普通的提示词。

!!!note
    `klee \(genshin impact\)`这个提示词中，`genshin impact`是为了提示`klee`是属于`genshin impact`的

## 分步绘制
这是分步描绘的提示词写法。

- `[from:to:step]`
- `[from::step]`：to 为空
- `[:to:step]`：from 为空
- `[to:step]`：不推荐的写法

这种提示词写法的作用是让提示词在达到 step 前视为 from，达到后视为 to，留空则为无对应元素。step 为大于 1 的整数时表示步数，为小于 1 的正小数时表示总步数的百分比。

比如`a girl with [green hair:red hair flower:0.2]`会在前 20% 步数被视为`a girl with green hair`，在后 80% 步数被视为`a girl with red hair flower`。

## 融合描绘
融合描绘的提示词写法：`[A | B]`  
在 SD WebUI 中，这种写法的作用是在第一步的时候画 A，第二步的时候画 B，第三步的时候画 A，以此循环往复的进行。

!!!note
    更详细的提示词写法可阅读 [元素同典：确实不完全科学的魔导书](https://docs.qq.com/doc/DWFdSTHJtQWRzYk9k)。