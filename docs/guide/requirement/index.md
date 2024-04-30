---
title: 起步配置推荐
---
# 起步配置推荐
!!!note
	推荐的硬件要求并非SDWebUI能够运行的实际下限，但越低的硬件环境下使用体验越糟糕，这里列举的起步配置为能够比较舒服的使用SDWebUI软件时的系统/硬件要求。
	
## Windows 系统版本
最低 Windows 10 专业版。

## 内存
最低 16 GB，建议 32 GB 及以上。

!!!note
	越少的物理内存需要设定越多的虚拟内存来维持SDWebUI软件运行。

## 储存
最低 64 GB。

!!!note
    1. 建议使用SSD硬盘作为存储介质，即便只是QLC的SATA硬盘，因为SDWebUI程序本体为大量零碎文件，在启动时十分考验硬盘的iops，使用HDD硬盘在程序启动时需要更长的等待时间，如果您的SSD硬盘容量比较紧张，可以考虑将SDWebUI程序本体放置在SSD硬盘内，模型文件夹放置在HDD硬盘，然后模型文件夹通过系统mklink（Windows环境）指令链接到SDWebUI程序文件夹内。
	2. 如果您准备购买SSD硬盘，则建议至少购买TLC颗粒的SSD硬盘（SATA/M.2不限）。

## 显卡
### 显卡品牌
个人建议选择显卡品牌的优先级：Nvidia > AMD ≈ Intel

### Nvidia 品牌
最低20系起步，如果您准备购买显卡，建议30系起步.

### AMD 品牌
建议能使用ZLUDA的显卡，如果您准备购买显卡，并不推荐AMD品牌的显卡。

### Intel 品牌
暂无，如果您准备购买显卡，并不推荐Intel品牌的显卡。

### 显存要求
最低 8 GB，建议 12 GB 及以上。

!!!note
	如果您主要使用SDXL模型，建议 12 GB 起步。

### 显卡驱动
建议使用最新的显卡驱动，以下为不同显卡品牌的官方驱动下载地址。

- Nvidia：https://www.nvidia.cn/geforce/drivers
- AMD：https://www.amd.com/zh-hans/support
- Intel：https://www.intel.cn/content/www/cn/zh/download-center

## 网络
涉及到的部分网站在国内的访问性不佳，建议自备加速工具。