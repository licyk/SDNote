---
title: 使用导入工作流
---

## ComfyUI管理器
[ComfyUI 管理器](https://github.com/ltdrdata/ComfyUI-Manager)是一个自定义节点，允许您通过 ComfyUI 界面安装和更新其他自定义节点。

单击它会显示一个 GUI，可让您 安装/卸载自定义节点。

在当前工作流中安装缺少的节点。

安装检查点模型、AI 升频器、VAE、LoRA、ControlNet 模型等模型。
更新 ComfyUI UI。

阅读社区手册。


## 如何安装缺少的自定义节点
您可能尚未安装工作流中所需的所有自定义节点。加载工作流文件后，执行以下步骤以安装缺少的自定义节点。

单击菜单中的管理器。

单击“安装缺少的自定义节点”。

完全重启 ComfyUI。

## 导入工作流
常用工作流网站

[OpenArt](https://openart.ai/home)

OpenArt OpenArt作为一款集云端运行ComfyUI工作流和AI图像创作于一体的平台，OpenArt提供了强大的AI图像创作功能，还提供了云端运行和可免费下载ComfyUI工作流，但国内的网不什么好访问。


[Comfy Workflows](https://comfyworkflows.com/workflows)

Comfy Workflows 上也有很多免费的可用的工作流提供下载，可能没有OpenArt多，但好在国内可以访问到

[Civitai](https://civitai.com/models)

Civitai 不仅提供了各种模型的下载，还提供了工作流的下载，只要在过滤器里选择工作流选项，就可以看到很多可免费下载的工作流。

## 导入工作流报错
加载工作流时，有的会出现节点变成红色，则代表这些节点出现了问题：

第一种方法：
打开管理器—>安装缺失节点：

然后全部选择，点安装，等待安装完成之后重启ComfyUI。

第二种方法：

有些节点使用第一种方法并不能安装成功，这时可以使用源码对其进行安装，还是先打开管理器—>安装缺失节点，到安装节点的界面不点安装或者者更新，点名称里面的网址，这时会跳到一个git的源码界面：

跳到源码界面，点下载源码，这时候你可以下载压缩包或者使用git clone进行下载。

下载后解压放到到ConfyUI/custom_nodes目录下,重启ConfyUI。