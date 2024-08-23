---
title: 配置 ZLUDA
---
# 简述
绘世启动器支持 ZLUDA 作为 Stable Diffusion WebUI / ComfyUI / Fooocus 的生成引擎，相比于 DirectML 生成引擎，可以使 AMD 显卡的生成图片的速度大大提高，可以根据以下步骤使用 ZLUDA。

## 下载 HIP SDK
进入 [HIP SDK](https://www.amd.com/en/developer/resources/rocm-hub/hip-sdk.html) 下载页，在 Downloads 部分列出了不同系统和不同版本的下载地址。

这里找到 Windows 10 & 11 系统对应的 5.7.1 版本，点击右侧的 HIP SDK 进入该版本的 HIP SDK 下载页。进入下载页后可以看到 HIP SDK License，直接划到网页的下方可以看到 Accept 按钮，点击后就开始下载 HIP SDK 安装包。

HIP SDK 安装包下载好后，双击打开，等待一会后就可以看到安装选择界面，在界面中要确保 HIP SDK 核心显示的版本是 5.7，如果是其他版本则无法正常运行 ZLUDA。确认版本无误后点击右下角的安装，等待安装完成，安装完成后重启电脑。


## 下载 ZLUDA
如果 AMD 显卡型号为 AMD 780m / AMD 760m / AMD 680m，需要手动下载 ZLUDA 文件，点击此处下载 [780m_20240321_163205.7z](https://modelscope.cn/models/licyks/sdnote/resolve/master/other/780m_20240321_163205.7z)，下载该文件完成后，使用 [Bandizip](https://www.bandisoft.com/bandizip) / [7zip](https://7-zip.org/) / 其他解压缩软件 将该压缩包内的所有文件解压到绘世启动器所在目录。

![unzip_zluda_patch_to_sd_webui_path](../../assets/images/sd_launcher/other/unzip_zluda_patch_to_sd_webui_path.jpg)

如果是其他 AMD 显卡，无需手动下载 ZLUDA 文件，绘世启动器的自我更新模块将自动下载所需的 ZLUDA 文件。


## 检查 PyTorch 版本
在绘世启动器的高级选项里，点击右上角的启动命令提示符，在弹出的命令行窗口输入以下命令。

```
python -m pip show torch
```

运行后将输出以下信息。

```
Name: torch
Version: 2.3.1+cu118        <----- 这里显示的是 PyTorch 的版本信息，内置的 CUDA 版本为 11.8
Summary: Tensors and Dynamic neural networks in Python with strong GPU acceleration
Home-page: https://pytorch.org/
Author: PyTorch Team
Author-email: packages@pytorch.org
License: BSD-3
Location: e:\softwares\stable-diffusion-webui\venv\lib\site-packages
Requires: filelock, fsspec, jinja2, mkl, networkx, sympy, typing-extensions
Required-by: accelerate, clean-fid, depth_anything, depth_anything_v2, dsine, facexlib, geffnet, kornia, open-clip-torch, pytorch-lightning, segmentation-refinement, spandrel, spandrel_extra_arches, thop, timm, tipo-kgen, tomesd, torchaudio, torchdiffeq, torchmetrics, torchsde, torchvision, ultralytics, xformers
```

在 Version 部分可以看到 PyTorch 的版本信息，如果显示的是 cu118 就说明 PyTorch 中带的 CUDA 版本为 11.8，能够运行 ZLUDA，如果不是 cu118，需要在绘世启动器的高级选项 -> 环境维护 -> 安装 PyTorch，选择标记为 CUDA 11.8 的 PyTorch 版本进行重装。


## 启用 ZLUDA
进入绘世启动器的高级选项，在生成引擎可以选择 ZLUDA 开头的生成引擎，选择后即可使用。

在初次使用 ZLUDA 引擎进行生图时，需要编译 ZLUDA 所需的文件，此时在绘世启动器控制台将显示编译进度（编译时会显示`正在编译到 AMD 显卡架构`）。ZLUDA 编译时间较长，需要等待 30 分钟左右，编译完成后将开始进行生图。
