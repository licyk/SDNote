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
如果 AMD 显卡为 AMD 780m，需要手动下载 ZLUDA 文件，点击此处下载 [780m_20240321_163205.7z](https://modelscope.cn/models/licyks/sdnote/resolve/master/other/780m_20240321_163205.7z)，下载该文件完成后，使用 [Bandizip](https://www.bandisoft.com/bandizip) / [7zip](https://7-zip.org/) / 其他解压缩软件 将该压缩包内的所有文件解压到绘世启动器所在目录。

如果是其他 AMD 显卡，无需手动下载 ZLUDA 文件，绘世启动器的自我更新模块将自动下载所需的 ZLUDA 文件。

## 启用 ZLUDA
进入绘世启动器的高级选项，在生成引擎可以选择 ZLUDA 开头的生成引擎，选择后即可使用。

在初次使用 ZLUDA 引擎进行生图时，需要编译 ZLUDA 所需的文件，此时在绘世启动器控制台将显示编译进度。ZLUDA 编译时间较长，需要等待 30 分钟左右，编译完成后将开始进行生图。