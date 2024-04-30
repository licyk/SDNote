---
title: 环境维护
---
# 环境维护
这里是有关环境维护的选项，用于解决一些环境问题。

![environment_maintenance](../../assets/images/sd_launcher/env/environment_maintenance.jpg)

!!!note
    以下选项在绘世启动器的默认配置模式中有部分不会显示，需要在绘世启动器的`设置`->`配置模式`将新手改为专家。

## 安装 PyTorch
用于安装 PyTorch 或者重新安装 PyTorch。

![install_pytorch](../../assets/images/sd_launcher/env/install_pytorch.jpg)

当 PyTorch 未正确安装或者需要切换 PyTorch 版本时，就可以使用这个功能。

PyTorch 版本需要和显卡的型号相对应，以保证 SD WebUI，ComfyUI等 WebUI 能够正常运行 Stable Diffusion。

查看显卡型号可在使用任务管理器，按下`Ctrl + Shift + ESC`启动任务管理器，点击`性能`->`GPU`，右上角就是显卡的型号。

![task_manager](../../assets/images/sd_launcher/install/task_manager.jpg)

以下为不同显卡对应可选的 PyTorch 版本：

- Nvidia 显卡：
    - Torch 2.1.2 (CUDA 11.8) + xFormers 0.0.23.post1
    - Torch 2.1.2 (CUDA 12.1) + xFormers 0.0.23.post1
    - Torch 2.2.0 (CUDA 11.8) + xFormers 0.0.24
    - Torch 2.2.0 (CUDA 12.1) + xFormers 0.0.24
    - Torch 2.2.1 (CUDA 11.8) + xFormers 0.0.25
    - Torch 2.2.1 (CUDA 12.1) + xFormers 0.0.25
- AMD 显卡：
    - 支持 ZLUDA 的：
        - Torch 2.1.2 (CUDA 11.8) + xFormers 0.0.23.post1
        - Torch 2.2.0 (CUDA 11.8) + xFormers 0.0.24
        - Torch 2.2.1 (CUDA 11.8) + xFormers 0.0.25
    - 不支持 ZLUDA 的：
        - Torch 2.0.0 (DirectML)
- Intel 显卡：
    - 独显：
        - Torch 2.0.0 (IPEX AOT, Arc)
        - Torch 2.1.0 (IPEX AOT, Arc)
    - 核显：
        - Torch 2.1.0 (IPEX AOT, Core Ultra)

!!!note
    建议将显卡驱动更到最新以保证 PyTorch 能够正常工作。  
    Nvidia 显卡驱动下载：https://www.nvidia.cn/geforce/drivers  
    AMD 显卡驱动下载：https://www.amd.com/zh-hans/support  
    Intel 显卡驱动下载：https://www.intel.cn/content/www/cn/zh/download-center/home.html

    AMD 780M（核显），RX 5000 系（独显）以上的 AMD 显卡支持 ZLUDA，而其他不支持的系列请使用 DirectML。

    AMD 780M 核显无法直接使用 ZLUDA，需要手动添加文件：[适用于绘世启动器的 AMD Radeon 780M 的 ZLUDA 教程 - 哔哩哔哩](https://www.bilibili.com/read/cv33327387)。

如果是 Nvidia 显卡，需要注意显卡驱动支持最高的 CUDA 版本是否大于或等于 PyTorch 中所带的 CUDA 版本。

!!!note
    查看显卡驱动支持的 CUDA 的版本：  
    在绘世启动器的高级选项中点击右上角的启动命令提示符，输入`nvidia-smi`并回车，此时看到 CUDA Version 后面的数字为 Nvidia 显卡驱动最高支持的 CUDA 版本，当然 CUDA 支持向下兼容，低于这个版本的 CUDA 也能使用。

## 环境修复
用于修复环境问题导致无法正常运行的功能。

!!!note
    该功能仅存在于 ComfyUI / Fooocus 中。

![fix_environment](../../assets/images/sd_launcher/env/fix_environment.jpg)

默认勾选 修复内核相关组件 和 修复扩展相关组件 即可，然后点击修复按钮来修复出问题的环境。

!!!note
    因为 ComfyUI / Fooocus 自身并没有像 SD WebUI 那样的自动环境检查和修复功能，所以绘世启动器提供了这个功能来解决这个问题。

## 原生组件管理
管理绘世启动器安装的原生组件。

![native_omponent_manager](../../assets/images/sd_launcher/env/native_omponent_manager.jpg)

该功能支持管理三种组件。

- Python
- Git
- Ffmpeg

如果您使用的是整合包，就不需要安装 Python 和 Git，这可能会导致新的问题，如 PyTorch 缺失导致无法正常启动。

!!!warning
    除非你要删除整合包内的 Python 和 Git，使用绘世启动器的原生组件管理重建新的 Python 和 Git，否则不要安装原生组件管理里的 Python 和 GIt。

## 重装单个 Python 组件
用于重新安装单个 Pip 软件包。

![reinstall_python_package](../../assets/images/sd_launcher/env/reinstall_python_package.jpg)

如果某个软件包出现了问题，则将输入该软件包的名称，并点击重新安装按钮。