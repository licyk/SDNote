---
title: 杂项
---
# 杂项
这里列出其他在 SD WebUI 里用的功能

## 图片信息查看
如果想要查看一张由 SD WebUI 生成的图片的参数，可以在 SD WebUI 的 PNG 图片信息里，导入图片后即可查看生图参数。

![png_info_view](../../assets/images/guide/extra
/png_info_view.jpg)

!!!note
    ComfyUI、InvokeAI、NovelAI 等生成的图片也可以查看生图信息，但是要保证图片未被压缩或者被其他图像工具处理过。


## 图片提示词反推
想知道一张图片的提示词怎么写，可以通过 sd-webui-wd14-tagger 扩展将提示词反推出来。将图片导入后扩展将自动反推提示词，反推完成后最好点一下卸载所有反推模型来释放显存。

![wd14_tagger](../../assets/images/guide/extra
/wd14_tagger.jpg)

!!!note
    sd-webui-wd14-tagger 扩展：https://github.com/Akegarasu/sd-webui-wd14-tagger


## 移除背景
想要人物的背景移除，可以使用 stable-diffusion-webui-rembg 扩展。在 SD WebUI 的后期处理中，在下方启用移除背景，移除背景选择其中一个算法，再点击生成就可以把图片的背景移除。

![remove_background](../../assets/images/guide/extra
/remove_background.jpg)

!!!note
    stable-diffusion-webui-rembg 扩展下载：https://github.com/AUTOMATIC1111/stable-diffusion-webui-rembg

如果有生成蒙版的需求，可以使用 PBRemTools 扩展。在精准背景移除工具选项卡中，导入要移除背景的图片，在后期处理的选项中点击启用，再点提交，这样就可以生成一张移除背景的图片和蒙版。

![rm_background_and_make_mask](../../assets/images/guide/extra
/rm_background_and_make_mask.jpg)

!!!note
    PBRemTools 扩展下载：https://github.com/mattyamonaca/PBRemTools


## 图片处理
a1111-sd-webui-haku-img 扩展可对图像进行一些处理，如提取图片线稿，图片像素化等。

![haku_img](../../assets/images/guide/extra
/haku_img.jpg)

!!!note
    a1111-sd-webui-haku-img 扩展下载：https://github.com/KohakuBlueleaf/a1111-sd-webui-haku-img


## 面部修复
在 SD WebUI 1.6 之后，官方将自带的面部修复移除了，因为效果过差，而 adetailer 扩展可作为替代品。在文生图或者图生图左下角中可以看到该扩展的选项卡，勾选后即可启用面部修复。

![adetailer](../../assets/images/guide/extra
/adetailer.jpg)

注意，在局部重绘中该插件并不会生效，因为这个插件的本质是自动检测面部位置并进行局部重绘。

!!!note
    adetailer 扩展下载：https://github.com/Bing-su/adetailer


## 恢复保存预设的按钮
SD WebUI 1.6 移除了保存提示词预设按钮，所以只能在生成按钮旁边的画笔按钮来保存预设。可以通过 sd-webui-boomer 扩展来恢复这个按钮。

!!!note
    sd-webui-boomer 扩展下载：https://github.com/Haoming02/sd-webui-boomer


## 图片浏览
sd-webui-infinite-image-browsing 扩展作为图片浏览器非常方便。

![infinite_image_browsing](../../assets/images/guide/extra
/infinite_image_browsing.jpg)

!!!note
    sd-webui-infinite-image-browsing 扩展下载：https://github.com/zanllp/sd-webui-infinite-image-browsing


## 分区绘制
multidiffusion-upscaler-for-automatic1111 扩展除了提供 Tiled VAE，也提供了分区绘制功能，不过要画有多人互动的图片就不太行，可以尝试使用 sd-webui-regional-prompter 扩展或者 stable-diffusion-webui-two-shot 扩展来绘制有多人互动的图片。
!!!note
    sd-webui-regional-prompter 扩展下载：https://github.com/hako-mikan/sd-webui-regional-prompter  
    stable-diffusion-webui-two-shot 扩展下载：https://github.com/ashen-sensored/stable-diffusion-webui-two-shot


## 查找并删除模型里的垃圾数据
SD 1.5 的模型用于生图时只有 2 GB 是有效的数据，但是有许多 SD 1.5 的模型的大小超过了 2 GB。可以通过 stable-diffusion-webui-model-toolkit 扩展查看模型是否有垃圾数据存在。

![search_model_junk_data](../../assets/images/guide/extra
/search_model_junk_data.jpg)

如果模型里有垃圾数据，可以通过 sd-webui-model-converter 扩展删除垃圾数据。在模型转换选项卡中，选择要删除垃圾数据的模型，选择删除 EMA 权重，勾选删除已知垃圾数据，点击运行即可删除模型垃圾数据。

![remove_model_junk_data](../../assets/images/guide/extra
/remove_model_junk_data.jpg)

有关模型垃圾数据的哔哩哔哩专栏：[【AI绘画】模型修剪教程：8G模型顶级精细？全是垃圾！嘲笑他人命运，尊重他人命运 - 哔哩哔哩](https://www.bilibili.com/read/cv26279169)

!!!note
    stable-diffusion-webui-model-toolkit 扩展下载：https://github.com/arenasys/stable-diffusion-webui-model-toolkit  
    sd-webui-model-converter 扩展下载：https://github.com/Akegarasu/sd-webui-model-converter


## 模型融合
想要模型融合，就用 sd-webui-supermerger 扩展，不过融模虽然容易，但是要融出一个好模并不简单。

!!!note
    sd-webui-supermerger 扩展下载：https://github.com/hako-mikan/sd-webui-supermerger


## 随机抽卡
如果对提示词不熟悉，但又想抽出比较好的图，可以试试 z-a1111-sd-webui-dtg 扩展，启用后就可以快乐的抽卡了。

![dtg](../../assets/images/guide/extra
/dtg.jpg)

!!!note
    z-a1111-sd-webui-dtg 扩展下载：https://github.com/KohakuBlueleaf/z-a1111-sd-webui-dtg


## 视频生成
用 AI 来生成视频大致分为两类，一种是视频转绘，另一种是直接生成视频，推荐 ebsynth_utility 扩展和 sd-webui-animatediff 扩展。

!!!note
    ebsynth_utility 扩展下载：https://github.com/s9roll7/ebsynth_utility  
    sd-webui-animatediff 扩展下载：https://github.com/continue-revolution/sd-webui-animatediff


## 低显存跑 SDXL 模型
在 SD WebUI 1.8 中支持了 FP8 权重，可以大大降低 SDXL 模型对显存的占用，最低 6 GB显存即可运行 SDXL 模型。  
启用 FP8 前需要 PyTorch 版本大于 2.1，SD WebUI 版本大于或等于 1.8。  
在 SD WebUI 的`设置`->`优化设置`->`FP8 权重`，选择对 SDXL 模型启用，保存设置后即可启用。


## 无限生成图片
右键 SD WebUI 的生成按钮即可看到无限生成 / 停止无限生成的按钮，

![infinite_generate](../../assets/images/guide/extra
/infinite_generate.jpg)


## 使用 SDXL 模型时特定的提示词组会出现鬼图
这个可能和提示词权重有关，在 SD WebUI 的`设置`->`SD`->`强调模式`，选择 No norm 后保存设置。


## SD WebUI 的 LoRA / Embedding 模型展示的规则
在 SD WebUI 1.8 后，引入了模型的防呆机制，防止用户错误地使用不对应版本的 LoRA / Embedding 模型，导致报错或者出鬼图。防呆机制的规则如下：

1. 当加载了 SD 1.5 的大模型时，只显示适用于 SD 1.5 的 LoRA / Embedding 模型
2. 当加载了 SDXL 的大模型：只显示适用于 SDXL 的 LoRA / Embedding 模型

如果要使用适用于 SD 1.5 的 LoRA / Embedding 模型，只需要将大模型切换成 SD 1.5 的，这时候在 SD WebUI 的模型列表中就可以看到 SD 1.5 的 LoRA / Embedding 模型了，要使用 SDXL 的也同理。

如果要关闭这个防呆机制，可以在 SD WebUI 的`设置`->`扩展模型`，将`在 Lora 页面保持显示所有模型 (否则, 将隐藏不兼容当前加载的 Stable Diffusion 模型版本的模型)`选项勾上，并保存 SD WebUI 的设置。


## SD WebUI 不同路径 / 文件的作用
这是 SD WebUI 中不同路径 / 文件的作用。

|路径 / 文件|作用|
|---|---|
|stable-diffusion-webui/models|大部分模型的保存路径|
|stable-diffusion-webui/extensions|扩展路径|
|stable-diffusion-webui/extensions-builtin|SD WebUI 内置扩展路径|
|stable-diffusion-webui/outputs|生成图片的保存路径|
|stable-diffusion-webui/repositories|SD WebUI 内部组件|
|stable-diffusion-webui/cache.json|模型哈希记录文件|
|stable-diffusion-webui/config.json|保存 SD WebUI 设置的文件|
|stable-diffusion-webui/params.txt|保存上一次生图的参数|
|stable-diffusion-webui/styles.csv|提示词预设文件|
|stable-diffusion-webui/ui-config.json|SD WebUI 界面预设文件|

SD WebUI 在使用的时候会把部分模型放置在缓存路径中，路径如下。

|不同启动方式的用户|缓存路径|
|---|---|
|绘世启动器用户|stable-diffusion-webui/.cache|
|使用原生 SD WebUI 启动方式用户|C:/Users/%USERNAME%/.cache|

.cache 为隐藏路径，需要将文件管理器显示隐藏隐藏文件的功能打开，参看：[杂项 - 显示隐藏的文件和文件后缀名 - SDNote](../../help/other.md#_4)


## SD WebUI 中不同模型的放置路径

|模型种类|放置路径|
|---|---|
|Stable Diffusion 模型（大模型）|stable-diffusion-webui/models/Stable-diffusion|
|VAE 模型|stable-diffusion-webui/models/VAE|
|VAE-approx 模型|stable-diffusion-webui/models/VAE-approx|
|LoRA / Lycoris 模型|stable-diffusion-webui/models/Lora|
|Embedding 模型|stable-diffusion-webui/embeddings|
|Hypernetwork 模型|stable-diffusion-webui/models/hypernetworks|
|高清修复模型|stable-diffusion-webui/models/ESRGAN </p> stable-diffusion-webui/models/RealESRGAN </p> stable-diffusion-webui/models/SwinIR </p> stable-diffusion-webui/models/DAT|
|ControlNet 模型|stable-diffusion-webui/models/ControlNet </p> stable-diffusion-webui/extensions/sd-webui-controlnet/models|
|ControlNet 预处理器模型|stable-diffusion-webui/extensions/sd-webui-controlnet/annotator/downloads|
|AnimateDiff 模型|stable-diffusion-webui/extensions/sd-webui-animatediff/model|
|DanTagGen 模型|stable-diffusion-webui/extensions/z-a1111-sd-webui-dtg/models|