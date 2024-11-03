---
title: 显存优化
---
# 概述
SD WebUI Forge 拥有很强的显存优化功能，可以降低 Stable Diffusion 模型对显存大小的要求，在显存较小的情况也能够正常加载模型并运行。

在 SD WebUI Forge 的顶部就包含了关于显存优化的选项，在左上角的 UI 选项选择全部就可以将这些选项全部显示出来。

![video_momory_optimization_option_on_top_bar](../../assets/images/guide/sd_webui_forge/video_momory_optimization_option_on_top_bar.png)

在 SD WebUI Forge 的左下角的选项中也有 Never OOM Integrated 功能用于优化显存占用的功能。

合理使用这些功能可以有效的降低显存的占用，减少显存不足的问题的发生。


## Diffusion in Low Bits
该功能用于转换模型的精度，更低的精度占用更低的显存。虽然不同精度下模型出图的效果不同，但是对出图质量的影响不大。

目前 SD WebUI Forge 中该选项可选的精度如下。

|选项|作用|
|---|---|
|Automatic|使用 Stable Diffusion 模型原有的精度
|Automatic (fp16 LoRA)|使用 Stable Diffusion 模型原有的精度，但 LoRA 模型精度保持在 fp16|
|bnb-nf4|将 Stable Diffusion 模型精度转换为 nf4 精度|
|bnb-nf4 (fp16 LoRA)|将 Stable Diffusion 模型精度转换为 nf4 精度，但 LoRA 模型精度保持在 fp16|
|float8-e4m3fn|将 Stable Diffusion 模型精度转换为 fp8-e4m3fn 精度|
|float8-e4m3fn (fp16 LoRA)|将 Stable Diffusion 模型精度转换为 float8-e4m3fn 精度，但 LoRA 模型精度保持在 fp16|
|bnb-fp4|将 Stable Diffusion 模型精度转换为 fp4 精度|
|bnb-fp4 (fp16 LoRA)|将 Stable Diffusion 模型精度转换为 fp4 精度，但 LoRA 模型精度保持在 fp16|
|float8-e5m2|将 Stable Diffusion 模型精度转换为 fp8-e5m2 精度|
|float8-e5m2 (fp16 LoRA)|将 Stable Diffusion 模型精度转换为 fp8-e5m2 精度，但 LoRA 模型精度保持在 fp16|

不同精度对显存的需求大小：fp32 > fp16 > fp8-e4m3fn ≈ fp8-e5m2 > fp4 ≈ nf4

如果不将 LoRA 模型保持在 fp16 精度，这将会使 LoRA 模型和 Stable Diffusion 模型使用同样的精度进行计算，LoRA 将会合并进 Stable Diffusion 中。

如果将 LoRA 模型保持在 fp16 精度下，无论 Stable Diffusion 的精度是什么，LoRA 模型的精度都会保持在 fp16，在每次 Stable Diffusion 模型进行扩散时，LoRA 模型都需要动态计算，所以在使用多个 LoRA 时，将 LoRA 模型保持在 fp16 精度时会导致出图速度降低。

如果修改 LoRA 模型的权重后（或者新加了一个 LoRA 模型），需要重新为 LoRA 进行一次计算，这使修改权重后第一次出图的时间稍微长一点，在第二次出图后将恢复正常速度。

在模型进行一次精度转换时，可能会导致较高的显存占用。如 Stable Diffusion 模型的精度为 fp16，将模型精度设置为 float8-e4m3fn，第一次出图时将发生一次精度转换，这时候可以看到显存有较高的占用，但在出图几次后将恢复正常占用。

!!!note
    如果转换精度时出现显存不足的报错，这是正常的现象，重新进行转换将恢复正常。

!!!warning
    注意，不建议在低精度模型使用 Diffusion in Low Bits 功能将模型精度转换为另一个低精度。如使用 fp8 模型时将模型精度转换为 nf4，因为 fp8 精度无法直接转换为 nf4 精度，此时将会把模型的精度从 fp8 转换为 fp16，再将精度从 fp16 转换为 nf4，虽然能够正常生成图片，但是这会浪费更多的时间在精度转换上。


## Swap Method
这个功能用于设置进行模型权重交换时的工作模式，有两种工作模式可以选择。

|模式|工作方式|
|---|---|
|Queue|使用队列模式，将模型的某层权重加载到显存中，然后进行计算，再加载另一层权重，然后计算。就像一个队列一样。|
|ASYNC|使用异步模式，这将拥有两个线程去处理模型权重并计算，一个线程用于依次加载模型的某个权重，另一个线程用于计算加载好的模型权重。|

ASYNC 模式一般会比 Queue 模式快一点，但是在某些情况下，ASYNC 模式下一个线程可能会过多加载了模型权重到显存中，使另一个线程没有足够的显存进行计算，此时将导致速度突然变慢。


## Swap Location
这个功能用于设置进行模型权重交换的位置。

当一个模型的大小为 12GB，但是当前显卡的显存大小只有 8GB，此时模型是无法载入显存中的。这时候可以通过把模型拆分成两部分进行存储，一部分储存在显存中，另一部存储在交换位置中。如果该选项选择 CPU，则模型将分别加载到专用显存和 CPU 中，如果该选项选择 Shared，则模型将分别加载到专用显存和共享显存中。

在一些新的硬件上，使用 Shared 选项会比 CPU 选项更快一点，但是在某些硬件上使用可能会造成崩溃问题。

!!!note
    在 Windows 系统中，存在共享显存这个功能，可以使用内存作为显存使用，但是内存的速度通常比显存的速度要慢很多，所以 Windows 系统将优先使用专用显存，当显存不足时再使用共享显存，  
    共享显存虽然使用了内存当做显存，但是和内存有些差别。共享显存由显卡进行管理，内存由 CPU 进行管理。


## GPU Weights
这个功能用于设置存储在显存中模型的大小。

设置为更大的值可以获得更快的速度，因为这将减少使用内存临时交换模型权重的次数，但是过大的值将会导致显存不足使计算的速度变得很慢，出图所需的时间更多。

设置为更小的值将更积极的使用内存临时交换模型权重，虽然会使出图的时间变慢，但是这将拥有更多空间的显存，可以生成更大的图片。


## Never OOM Integrated
这个功能用于减少显存的占用，降低出现显存不足问题的概率，该功能有以下选项。

|选项|功能|
|---|---|
|Enabled for UNet (always maximize offload)|为 Stable Diffusion 模型的 UNet 模块尽可能将模型权重卸载到内存中，这会最积极的使用内存临时交换模型权重，相当于将 GPU Weights 这个值设置为最低值。|
|Enabled for VAE (always tiled)|在 VAE 编 / 解码阶段强制使用分块功能江都显存占用。在 SD WebUI Forge 检测到 VAE 编 / 解码阶段发生显存不足时，将使用分块 VAE 重试。启用该选项后将在 VAE 阶段一直使用分块 VAE 编 / 解码。|