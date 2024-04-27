---
title: 绘世启动器
---
# 绘世启动器
这里是有关绘世启动器的报错收集。

### You must install .NET Desktop Runtime to run this application
![net_runtime_not_found](../assets/images/help/sd_launcher
/net_runtime_not_found.jpg)

这是因为系统中未安装绘世启动器的依赖（.NET 6.0），点击弹窗提示的`是`可跳转到绘世启动器的依赖下载地址，下载并安装依赖后重新打开绘世启动器。


### 绘世启动器无法打开
这是因为 Intel 核显驱动的问题导致绘世启动器崩溃。可选择以下其中一种解决方法。

1. 将 Intel 核显驱动更新到3月27的版本(31.0.101.5382)
2. 将绘世启动器的文件名中的中文名删去
3. 开启独显直连
4. 禁用 Intel 核显驱动

参考：[记 Intel 的 31.0.101.5186 版本驱动带崩 WPF 程序](https://blog.lindexi.com/post/%E8%AE%B0-Intel-%E7%9A%84-31.0.101.5186-%E7%89%88%E6%9C%AC%E9%A9%B1%E5%8A%A8%E5%B8%A6%E5%B4%A9-WPF-%E7%A8%8B%E5%BA%8F.html)


### 打开绘世启动器时显示更新失败
![can_not_get_update](../assets/images/help/sd_launcher
/can_not_get_update_1.jpg)

![can_not_get_update](../assets/images/help/sd_launcher
/can_not_get_update_2.jpg)

网络问题，将绘世启动器的更新窗口关闭，并重新打开绘世启动器，可多尝试几次。或者尝试开启代理软件，再打开绘世启动器。


### 检测到无效配置，提示未安装任何版本的 PyTorch 软件包
![detect_invalid_pytorch](../assets/images/help/sd_launcher
/detect_invalid_pytorch.jpg)

前往绘世启动器的`高级选项`->`环境维护`->`安装 PyTorch`，安装对应版本的 PyTorch。参看[环境维护 - 安装 PyTorch - SD Notes](../sd_launcher/advance/env.md#pytorch)。


### 您的 Windows 未启用长路径支持
![enable_long_path_support](../assets/images/help/sd_launcher
/enable_long_path_support.jpg)

直接点`是`。


### 启动器已检测到内核文件，但无法找到与之对应的版本信息
![missing_git_file](../assets/images/help/sd_launcher
/missing_git_file.jpg)

整合包损坏了，请重新解压。


### 需要安装核心组件，提示无法找到启动所需的 Python 组件
![need_to_install_python](../assets/images/help/sd_launcher
/need_to_install_python.jpg)

这是因为缺少了 Python，点击下列其中一个选项安装 Python。


### 扩展安装失败
![need_to_install_python](../assets/images/help/sd_launcher
/need_to_install_python.jpg)

检查你的网络是否正常，如果正常，可尝试配置绘世启动器的代理。


### 配置绘世启动器的代理
参考该教程：[网络错误？下载失败？配置绘世启动器的代理服务器！ - 哔哩哔哩](https://www.bilibili.com/read/cv33230985)。

!!!note
    绘世启动器的代理设置需要和代理软件相互配合，所以当代理软件关闭后，需要将绘世启动器的代理设置关闭，否则将出现绘世启动器无法连接网络的问题。


### 当前 Python 环境被设置到了 PATH 环境变量中，这可能导致环境意外损坏
![python_has_been_add_to_path](../assets/images/help/sd_launcher
/python_has_been_add_to_path.jpg)

参考该教程：[用绘世启动器时提示Python被添加到PATH？如何解决？ - 哔哩哔哩](https://www.bilibili.com/read/cv33232734)。


### 使用绘世启动器修复损坏的 SD WebUI / ComfyUI / ... 环境
参考该教程：[SD-WebUI、ComfyUI环境坏了，启动不了，绘世启动器来帮你修复 - 哔哩哔哩](https://www.bilibili.com/read/cv32989957)


### 端口已被占用
![port_occupied](../assets/images/help/sd_launcher
/port_occupied.jpg)

可选择[前往高级选项更改监听端口](../sd_launcher/advance/index.md#_12)，或者尝试终止占用端口的进程。


### 由于找不到 zlib.dll，无法继续执行代码
![zlib_not_found](../assets/images/help/sd_launcher
/zlib_not_found.jpg)

如果您是整合包用户，请前往绘世启动器的`高级选项`->`环境维护`->`原生组件管理`，将 Python 卸载，并重启绘世启动器。

该弹窗也可以忽略，这并不会影响正常使用。

!!!note
    关于原生组件的介绍：[环境维护 - 原生组件管理 - SD Notes](../sd_launcher/advance/env.md#_3)。


### xFormers can't load C++/CUDA extensions
这是因为你安装了不匹配 PyTorch 版本 xFormers，前往绘世启动器的`高级选项`->`环境维护`->`安装 PyTorch`，安装对应版本的 PyTorch。参看[环境维护 - 安装 PyTorch - SD Notes](../sd_launcher/advance/env.md#pytorch)。