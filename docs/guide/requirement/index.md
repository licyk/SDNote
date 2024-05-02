---
title: 起步配置推荐
---
# 起步配置推荐
!!!note
	推荐的硬件要求并非 SD WebUI 能够运行的实际下限，但越低的硬件环境下使用体验越糟糕，这里列举的起步配置为能够比较舒服的使用 SD WebUI 软件时的 系统 / 硬件 要求。


## Windows 系统版本
最低 Windows 10 专业版。


## 内存
最低 16 GB，建议 32 GB 及以上。

!!!note
	越少的物理内存需要设定越多的虚拟内存来维持 SD WebUI 软件运行。


## 储存
最低 64 GB。

!!!note
    1. 建议使用 固态硬盘 作为存储介质，即便只是 QLC 的 SATA 固态硬盘，因为 SD WebUI 程序本体为大量零碎文件，在启动时十分考验硬盘的iops，使用 机械硬盘 在程序启动时需要更长的等待时间，如果您的 固态硬盘 容量比较紧张，可以考虑将 SD WebUI 程序本体放置在 固态硬盘 内，模型文件夹放置在 机械硬盘，然后模型文件夹通过系统 mklink（Windows环境）指令链接到 SD WebUI 程序文件夹内。
	2. 如果您准备购买 固态硬盘，则建议至少购买 TLC 颗粒的 固态硬盘（ SATA / M.2 不限）。


## 显卡

### 核心选择
个人建议选择显卡核心的优先级：Nvidia > AMD ≈ Intel


### Nvidia 核心
最低20系起步，如果您准备购买显卡，建议30系起步.


### AMD 核心
建议 **能使用 ZLUDA** 的显卡，如果您准备购买显卡，并不推荐 AMD 核心的显卡。


### Intel 核心
暂无，如果您准备购买显卡，并不推荐 Intel 核心的显卡。


### 显存要求
Nvidia：最低 8 GB，建议 12 GB 及以上。
AMD / Intel：最低 12 GB，建议 16 GB 及以上。

!!!note
	如果您主要使用 SDXL 模型，Nvidia 建议 12 GB 起步，AMD / Intel 建议 16 GB 起步。


### 显卡驱动
建议使用最新的显卡驱动，以下为不同显卡的公版驱动下载地址。

- Nvidia：https://www.nvidia.cn/geforce/drivers
- AMD：https://www.amd.com/zh-hans/support
- Intel：https://www.intel.cn/content/www/cn/zh/download-center

!!!note
	笔记本电脑用户并不建议从笔记本电脑品牌官网下载显卡驱动，除非笔记本电脑品牌发布的显卡驱动包含了公版驱动没有但又对电脑使用很有影响的功能。


## 网络
涉及到的部分网站在国内的访问性不佳，建议自备加速工具。