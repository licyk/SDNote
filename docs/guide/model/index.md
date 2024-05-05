---
title: 模型种类
---
# 模型种类
在学习使用 AI 绘画时，会遇到不同种类的模型，这里简单介绍几种模型。


## Stable Diffusion 模型
Stable Diffusion 是一种文本到图像的潜在扩散模型（Latent Diffusion Model），能够在给定任何文本输入的情况下生成逼真的图像，出品于 [CompVis](https://github.com/CompVis)，[Stability AI](https://stability.ai) 和 [LAION](https://laion.ai/)。Stable Diffusion 可以通过在较低维的 latent space 上应用扩散过程，而非使用实际的像素空间，这样可以减少内存和计算复杂度。

Stable Diffusion 模型也称为底模或大模型，常见的版本有 1.5 和 XL。1.5 版本的生态比较丰富，如 ControlNet 等工具，而 XL 版本生图的质量会比较高，但生态没有 1.5 版本的那么丰富。

论文：[[2112.10752] High-Resolution Image Synthesis with Latent Diffusion Models](https://arxiv.org/abs/2112.10752)


## VAE 模型
>这是 Stable Diffusion 模型的其中一个组件

VAE模型有两个部分，一个编码器和一个解码器。编码器用于将图像转换为低维潜在表示，这将作为U-Net模型的输入。相反，解码器将潜在的表征转换回图像。在潜扩散训练过程中，利用编码器得到图像的潜表示（latents），用于前向扩散过程，每一步都会施加越来越多的噪声。在推理过程中，将反向扩散过程产生的去噪后的潜波利用VAE解码转换回图像。


## Embedding 模型
Embedding 是指将高维度的数据（例如文字、图片、音频）映射到向量空间的方法，即用数字表示的过程，这些数字通常为向量形式。当然，这个映射的结果也可以叫 Embeddings 或 Embedding 向量，它是一种模型。在 Stable Diffusion 中，Embedding 是 Textual Inversion（TI）训练的结果。

Embedding 模型常用于负面提示词中，用于提升生图的质量。

论文：[[2208.01618] An Image is Worth One Word: Personalizing Text-to-Image Generation using Textual Inversion](https://arxiv.org/abs/2208.01618)


## LoRA 模型
LoRA 模型全称 Low-Rank Adaptation of Large Language Models，是一种用于微调大型模型的轻量级技术。它的主要特点是使用低秩矩阵进行参数更新，这样只需训练较小体积的模型，然后将这些参数注入到 Stable Diffusion 模型中，以快速实现风格的调整或添加新的人物 / IP。

通过 LoRA 模型，可以实现一些 Stable Diffusion 模型原本很难出来的效果，如人物的某种动作等。

论文：[[2106.09685] LoRA: Low-Rank Adaptation of Large Language Models](https://arxiv.org/abs/2106.09685)


## Lycoris 模型
LyCORIS 模型全称 LoRA beyond Conventional methods, Other Rank adaptation Implementations for Stable diffusion。可以说 LyCORIS 是 LoRA 的思路的进一步扩展，是升级换代的 LoRA，通常比 LoRA 更有表现力，可以捕捉更多的训练图像的细节。LyCORIS 属于一系列类 LoRA 方法的总称，目前至少分为以下几种：Standard、LyCROIS/LoKr、LyCROIS/LoHa、LyCROIS/LoCon、LyCROIS/iA3、LyCROIS/DyLoRA、LoRA-FA。

论文：[[2309.14859] Navigating Text-To-Image Customization: From LyCORIS Fine-Tuning to Model Evaluation](https://arxiv.org/abs/2309.14859)


## Hypernetwork 模型
Hypernetwork 是一种模型微调技术。它是一个附属于 Stable Diffusion 稳定扩散模型的小型神经网络，是一种额外训练出来的辅助模型。Hypernetwork 可以在不修改主模型权重的情况下，通过在 U-Net 噪声预测器中的交叉注意层之前插入一个小的附属网络来拦截并修改信息，以达到微调模型输出的效果。

Hypernetwork 模型一般很少用到，更多用到的是 LoRA 模型。


## ControlNet 模型
ControlNet 是一个旨在控制预训练的大型扩散模型的模型。ControlNet能够接受不同的输入类型，如边缘图、分割图、关键点等，并增强 Stable Diffusion 这样的大型扩散模型，实现对这些条件输入的控制。

ControlNet 让生图更加的可控，更加容易地实现想要的效果。

论文：[[2302.05543] Adding Conditional Control to Text-to-Image Diffusion Models](https://arxiv.org/abs/2302.05543)

!!!note
    Stable Diffusion 模型科普：[模型理论科普第一辑](https://docs.qq.com/doc/p/a36aa471709d1cf5758151d68ef5b59397421b2e)

    详细了解模型的原理可以观看[秋葉aaaki](https://space.bilibili.com/12566101)制作的视频：[【AI绘画】深入理解Stable Diffusion！站内首个深入教程，30分钟从原理到模型训练 买不到的课程_哔哩哔哩_bilibili](https://www.bilibili.com/video/BV1x8411m76H)，也可以观看[琥珀青葉](https://space.bilibili.com/507303431)的视频。


## 模型精度
FP32，FP16，BF16，FP8，这些都是模型的精度。FP32 为全精度，可以携带的信息更多，但是文件体积更大，在运行的时候占用的显存更多，运算速度更慢。而 FP16，BF16 为半精度，相应的占用与 FP32 相比会更小，而 FP8 为微精度（暂译），占用会更小。

在 SD WebUI / ComfyUI / ... 中，默认使用的精度为 FP16，所以如果加载的模型的精度为 FP32，则会转换成 FP16 再使用，所以没必要去下载 FP32 精度的模型，只需要下载 FP16 精度的模型。

FP32 和 FP16 精度出图的效果完全一致，FP16 和 FP8 精度出图的效果仅有细微的差别，并不会对出图的效果有明显的影响。

在半精度中，BF16 比 FP16 出现精度不足的概率更小，但是 BF16 需要显卡的支持。对于 CPU 来说，支持的精度只有 FP32，而 FP16 之类的精度是不支持的。
