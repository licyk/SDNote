---
title: AMD 用户须知
---
# amd用户须知

[AMD 的 Windows 用户安装教程和启动错误解决方法](https://www.bilibili.com/video/BV1vK421a7Hf)。

下面文章均取至 [ZLUDA 的 README 文件](https://github.com/vosen/ZLUDA)，文件经过翻译，原文点击点击高亮文字。


# ZLUDA 说明

如果系统中同时存在集成的 AMD GPU 和专用的 AMD GPU，则 ZLUDA 使用集成的 GPU。

这是底层 ROCm/HIP 运行时中的一个错误。您可以通过禁用集成 GPU 来解决此问题。

在 Windows 上，我们建议您使用环境变量环境变量（此处有更多内容）或在设备管理器中禁用它。`HIP_VISIBLE_DEVICES=1`

集成 GPU（经 Radeon 680M 测试）的工作方式有限。一些很少使用的 GPU 操作（abort、printf 等）会挂起或使应用程序崩溃。此外，性能库支持（cuBLAS、cuDNN 等）可能会受到限制，从而导致更复杂的应用程序无法运行。

ZLUDA 可以使用 AMD 服务器 GPU（通过 Instinct MI200 进行测试），但需要注意。

在服务器 GPU 上，ZLUDA 可以编译 CUDA GPU 代码以以下两种模式之一运行：

快速模式，速度更快，但会使异国情调（但正确）的 GPU 代码挂起。
慢速模式，这应该会使 GPU 代码更稳定，但可能会阻止某些应用程序在 ZLUDA 上运行。
默认情况下，ZLUDA使用快速模式。这是因为：

性能差异很大，快速模式可以快两倍。
在多个项目（SPECFEM3D、QUDA、CHroma、MILC、Kokkos、LAMMPS、OpenFOAM、XGBoost、NAMD、LAMMPS）中没有遇到可以跳闸快速模式的代码模式。
您可以使用环境变量在慢速模式下强制编译。ZLUDA_WAVE64_SLOW_MODE=1

这些都不适用于台式机和集成 GPU（RDNA 系列）

# 注意(第一次启动很慢)

使用ZLUDA的应用程序启动速度很慢。

在第一次启动时，ZLUDA需要为应用程序编译GPU代码。这是一次性成本，编译后的 GPU 代码缓存在 Windows 和 Linux 中或 Linux 上。
某些应用程序会在使用 GPU 代码时逐渐加载它。如果不希望这样做，您可以尝试设置环境变量。这取决于应用程序的编程方式，但它可能会强制在启动时加载（和编译）所有内核，无论它们是否被使用。%LOCALAPPDATA%$XDG_CACHE_HOME$HOME/.cacheCUDA_MODULE_LOADING=EAGER


## 运行 ZLUDA 的应用程序可能会产生略有不同的值

首先，ZLUDA忽略了内核中存在的一些浮点非正态和舍入模式信息。其次，对于CUDA中的某些近似（非IEEE 754）NVIDIA浮点运算，ZLUDA盲目使用近似AMD浮点运算。两者可能具有不同的精度。

***

## CUDA 12+
使用 CUDA 12 构建并使用 Thrust 的应用程序会因 .LLVM ERROR: unsupported libcall legalization

这是一个 ROCm/HIP 错误。目前，使用 CUDA 12 之前版本构建的 CUDA 应用程序效果最好。使用 CUDA 12 和 CUDA 12 之前的推力构建也可能有效。

***

## OptiX的
ZLUDA 为 Arnold 提供了最低限度的 OptiX 实现。有关详细信息，请参阅 Arnold 部分。

***

## Windows
防病毒软件将 ZLUDA 标记为恶意软件。

ZLUDA 启动器 （） 使用恶意软件使用的一些技术，但效果很好。 劫持该进程，并将原始 NVIDIA CUDA 库的所有使用重定向为使用 ZLUDA 的 CUDA。zluda.exezluda.exe

不要与使用反作弊的游戏一起使用。ZLUDA 不支持 CUDA 游戏工作负载（PhysX 或 DLSS），反作弊可能会误认为是恶意软件或作弊。zluda.exezluda.exe

***

## 启动应用程序时出现以下错误：zluda.exeError: OsError { function: "DetourCreateProcessWithDllsW", error_code: 740, message: "The requested operation requires elevation." }

您正在启动需要管理员权限的应用程序。尝试从管理员命令行启动。zluda.exezluda.exe

ZLUDA 对性能库（cuDNN、cuBLAS、cuSPARSE、cuFFT、OptiX、NCCL）提供有限的支持。目前，此支持仅适用于 Linux，在 Windows 上不可用。

ZLUDA 启动器 （） 不支持 32 位进程。如果应用程序启动 32 位子进程，则 32 位进程及其 64 位子进程都无法使用 ZLUDA。这会影响 SiSoft Sandra。zluda.exea.exea.exea64.exe
