---
title: 系统准备
---
# 系统准备
本章节将介绍部署 AI 绘图程序之前的准备工作。

!!! warning "读前须知"
    * 因为 AI 绘图程序生态的多样性，本章节内容实际 __并不能__ 完美的覆盖所有的情况。
    * 本章以使用 __绘世启动器__ 启动 __SD WebUI__ 为目标进行说明，其他情形请举一反三。
    * 使用 __整合包__ 的情况下准备的内容会有所不同。
    * 因为 绘世启动器 __仅__ 支持 Windows 系统，故本章节 __仅__ 讲解 Windows 系统下的准备流程。

## 系统需求
Windows 10 及以上，除 __家庭版__ 外主流桌面版本，仅限 64 位。

!!! warning "家庭版 的小烦恼"
    根据用户反馈，使用 家庭版 时会出现无法通过 绘世启动器 激活长路径支持的现象。

## 程序需求
### 显卡驱动程序
!!! Success "显卡驱动推荐使用最新公版驱动"
    相对于生产厂商发布的驱动，公版驱动更新的频率更高，维护的时间更长。

!!! warning "如果您的笔记本电脑在安装完显卡公版驱动后失去了一些重要功能，请换回笔记本电脑生产厂商发布的驱动"

<div class="grid" markdown> 
显卡公版驱动下载地址</br>
[Nvidia](https://www.nvidia.cn/Download/index.aspx?lang=zh-cn){ .md-button }
[AMD](https://www.amd.com/zh-cn/support/download/drivers.html){ .md-button }
[Intel](https://www.intel.cn/content/www/cn/zh/download-center/home.html){ .md-button }

!!! warning "显卡种类不同，驱动不同"
    例如 GeForce GRD / NVIDIA SD 驱动仅限 GeForce 显卡，请不要用于 Quadro / Data Center 系列。

*[GeForce GRD]: GeForce Game Ready Driver
*[NVIDIA SD]: NVIDIA Studio Driver
</div>

### 其他驱动程序
其他硬件驱动程序能正常工作即可，无推荐。

### 基础程序
点击对应名称可进入官方下载地址。

!!! Success "绿色:fontawesome-solid-check:为必要，灰色:fontawesome-solid-check:为可选。未标明版本号的请下载最新的版本，标有 x 的请下载 x 最大的版本"
<div class="grid" markdown>  

* [x] [Python 3.10.x](https://www.python.org/ftp/python/3.10.11/python-3.10.11-amd64.exe "官方提供安装包的最后一版")
* [x] [Git](https://git-scm.com/download/win)
* [x] [7-zip](https://www.7-zip.org/) / [WinRAR](https://www.rarlab.com/) / [Bandizip](https://www.bandisoft.com/bandizip/)
* [x] [.NET 6.0.x Desktop Runtime](https://dotnet.microsoft.com/en-us/download/dotnet/6.0 "绘世启动器 的运行依赖")
* [ ] [Microsoft Visual C++](https://learn.microsoft.com/zh-CN/cpp/windows/latest-supported-vc-redist?view=msvc-170)

!!! failure "整合包须知"
    * 使用 __秋叶整合包__ 的用户 __请勿__ 安装 Pyhotn / Git，整合包内已内置该程序。
    * 使用其他整合包的用户请根据 整合包发布者 的要求选择。
</div>

!!! warning "一些注意点"
    * Windows 系统下 SD WebUI 程序仅对 Python 3.10 有良好支持，__请勿__ 安装 Python 3.10 以上（3.11 - 3.13）或以下（3.8 - 3.9）版本。
    * Microsoft Visual C++ 仅部分扩展需要，非必要程序。
    * .NET 6.0 请直接安装最新版本的 Desktop Runtime （并非 SDK / ASP.NET Core Runtime / .NET Runtime）。
    * .NET 7.0 / 8.0 / 9.0 不能代替 .NET 6.0。
    * 不建议使用 Windows 系统自带的解压功能。

### 其他程序
!!! Success "绿色:fontawesome-solid-check:为建议，灰色:fontawesome-solid-check:为可选"
<div class="grid" markdown> 

* [x] 魔法程序
* [ ] [FreeFileSync](https://freefilesync.org/ "免费文件同步软件")

!!! warning "有些东西无法细说"
    介于你懂的的情况，魔法程序虽然 __十分推荐__ ，但是只能提及。
</div>

### 系统环境设定
详情见 <small>[扩展阅读：系统环境设定操作基础](./set.md){ .md-button .md-button--primary }</small>

## 准备流程图
??? info "点击展开"
    ``` mermaid
    graph LR
    A[安装系统]-->B[安装驱动程序]-->C[安装基础程序]-->D[配置环境]-->E[部署 AI 画图程序]
    ```
