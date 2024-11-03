---
title: 内置扩展使用
---
# 概述
SD WebUI Forge 内置了一些扩展可供使用，下面就简单介绍内置扩展的使用。


## Spaces
这是 SD WebUI Forge 其中一个扩展系统，功能类似 HuggingFace Spaces，提供了少量比较有用的扩展。

![sd_webui_forge_spaces_interface](../../assets/images/guide/sd_webui_forge/sd_webui_forge_spaces_interface.png)

如果需要其中的某个扩展，点击该扩展右边的安装按钮即可进行安装，在控制台可以看到安装过程，安装完成后 Launch 按钮将可用。

点击 Launch 启动扩展，启动完成后将自动调用浏览器打开扩展的页面，在控制台也能看到扩展对应的页面地址。

如果需要关闭该扩展，点击 Terminate 将关闭该扩展的进程。

如果不再需要该扩展，可以点击 Uninstall 卸载该扩展。

!!!note
    SD WebUI Forge 的 Spaces 功能中的扩展因为需要手动安装，不完全算 SD WebUI Forge 的内置扩展，所以不多介绍 Spaces 扩展的功能。


## ControlNet Integrated
使用图片作为控制图片生成的条件，在前面的章节中讲过如何使用，所以本章将不再进行介绍。

![controlnet_integrated_interface](../../assets/images/guide/sd_webui_forge/controlnet_integrated_interface.png)

具体介绍请阅读。

<!-- TODO: 引用前面关于 ControlNet 的说明 -->


## FreeU Integrated
该扩展可以调节出图的效果，提高图片的对比度，改善出图的细节。

![freeu_interface](../../assets/images/guide/sd_webui_forge/freeu_interface.png)

启用后，B1，B2，S1，S2 可以调节 FreeU 的作用效果，Start step 和 End step 分别条件 FreeU 起作用的起始时机和结束时机。

在左下角的 (presets) 中可以选择一些参数预设，根据自己使用的模型进行选择。

使用 FreeU 后，可以看到图片的对比度有了提高，在某些细节上效果更好。

|使用 FreeU 前|使用 FreeU 后（使用 SDXL 预设）|
|---|---|
|![generate_image_before_use_freeu](../../assets/images/guide/sd_webui_forge/generate_image_before_use_freeu.png)|![generate_image_with_free](../../assets/images/guide/sd_webui_forge/generate_image_with_free.png)|

!!!note
    FreeU 相关的论文：[[2309.11497v2] FreeU: Free Lunch in Diffusion U-Net](https://arxiv.org/abs/2309.11497v2)


## DynamicThresholding (CFG-Fix) Integrated
该扩展用于设置动态提示词引导系数，可使在较高的提示词引导系数下颜色能够保持正常。

下面提供一个预设值可供参考。

|选项|值|
|---|---|
|Mimic Scale|5|
|Threshold Percentile|0.95|
|Mimic Mode|Half Cosine Up|
|Mimic Scale Min|4|
|Cfg Mode|Half Cosine Up|
|Cfg Scale Min|4|
|Sched Val|4|
|Separate Feature Channels|enable|
|Scaling Startpoint|MEAN|
|Variability Measure|AD|
|Interpolate Phi|1|

启用后，可以避免高提示词引导系数下颜色异常。

|提示词引导系数|5|30（启用 DynamicThresholding）|30|
|---|---|---|---|
|效果图|![use_cfg5_to_generate_image](../../assets/images/guide/sd_webui_forge/use_cfg5_to_generate_image.png)|![use_cfg30_with_dynamic_thresholding_to_generate_image](../../assets/images/guide/sd_webui_forge/use_cfg30_with_dynamic_thresholding_to_generate_image.png)|![use_cfg30_to_generate_image](../../assets/images/guide/sd_webui_forge/use_cfg30_to_generate_image.png)|

!!!note
    DynamicThresholding 相关的说明：[mcmonkeyprojects/sd-dynamic-thresholding Wiki](https://github.com/mcmonkeyprojects/sd-dynamic-thresholding/wiki)


## SelfAttentionGuidance Integrated (SD 1.x, SD 2.x, SDXL)
该扩展用于提升生成图片的细节，改善出图效果。

![_self_attention_guidance_interface](../../assets/images/guide/sd_webui_forge/_self_attention_guidance_interface.png)

启用后使用默认值可得到比较好的效果，也可以自己调整这些值，测试哪些参数更好。

|启用前|启用后|
|---|---|
|![generate_image_without_self_attention_guidance](../../assets/images/guide/sd_webui_forge/generate_image_without_self_attention_guidance.png)|![generate_image_with_self_attention_guidance](../../assets/images/guide/sd_webui_forge/generate_image_with_self_attention_guidance.png)|

!!!note
    Self-Attention Guidance 相关论文：[[2210.00939] Improving Sample Quality of Diffusion Models Using Self-Attention Guidance](https://arxiv.org/abs/2210.00939)


## PerturbedAttentionGuidance Integrated
该扩展用于优化图片细节，增加图片对比度，提高图片质量。

![perturbed_attention_guidance_interface](../../assets/images/guide/sd_webui_forge/perturbed_attention_guidance_interface.png)

通常使用默认值就有比较好的效果，当然可以尝试调整参数测试哪个参数效果较好。

|PerturbedAttentionGuidance|无|3|5|
|---|---|---|---|
|效果图|![generate_image_without_perturbed_attention_guidance](../../assets/images/guide/sd_webui_forge/generate_image_without_perturbed_attention_guidance.png)|![generate_image_with_perturbed_attention_guidance_3](../../assets/images/guide/sd_webui_forge/generate_image_with_perturbed_attention_guidance_3.png)|![generate_image_with_perturbed_attention_guidance_5](../../assets/images/guide/sd_webui_forge/generate_image_with_perturbed_attention_guidance_5.png)|

!!!note
    Perturbed Attention Guidance 相关论文：[[2403.17377] Self-Rectifying Diffusion Sampling with Perturbed-Attention Guidance](https://arxiv.org/abs/2403.17377)


## Kohya HRFix Integrated
当想要直出 1920x1080 这样的高分辨率，但是所使用的 SDXL 模型是在 1024x1024 分辨率下进行训练的，这可能会出现画面元素异常，此时可以通过该扩展修复该问题。

![kohya_hrfix_interface](../../assets/images/guide/sd_webui_forge/kohya_hrfix_interface.png)

使用默认值就可以得到比较好的效果，也可以尝试自己调整参数，有些参数组合可以提高画面的细节。

|禁用 Kohya HRFix|启用 Kohya HRFix|
|---|---|
|![generate_image_without_kohya_hrfix](../../assets/images/guide/sd_webui_forge/generate_image_without_kohya_hrfix.png)|![generate_image_with_kohya_hrfix](../../assets/images/guide/sd_webui_forge/generate_image_with_kohya_hrfix.png)|

!!!note
    Kohya HRFix 实现源码：[SDXLで高解像度での構図の破綻を軽減する](https://gist.github.com/kohya-ss/3f774da220df102548093a7abc8538ed)

## LatentModifier Integrated
该扩展可将滤镜应用于潜空间图像中，调整出图效果，可调节的效果有锐化等。

![latent_modifier_interface](../../assets/images/guide/sd_webui_forge/latent_modifier_interface.png)

使用时根据自己需求调整参数即可。

## StyleAlign Integrated
该扩展用于同时生成多张图片中，即单批数量大于 1 时能够起作用。

![style_align_interface](../../assets/images/guide/sd_webui_forge/style_align_interface.png)

启用该扩展后，如果设置单批数量同时生成多张图片，则该扩展将会在批次中分享注意力，使批次中每张图片的风格相似。

|禁用 StyleAlign|启用 StyleAlign|
|---|---|
|![generate_image_without_style_align](../../assets/images/guide/sd_webui_forge/generate_image_without_style_align.png)|![generate_image_with_style_align](../../assets/images/guide/sd_webui_forge/generate_image_with_style_align.png)|