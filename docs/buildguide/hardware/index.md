---
title: 硬件选择
---
# 硬件选择
本章节将分 __使用已有硬件__ / __准备购买硬件__ 两种情况进行说明，如未指明代表条件共同适用。高性能的硬件能够回避一些基础的错误。

!!! warning "读前须知"
    * 本章节提供的硬件建议基准判定为 <big>__Windows 系统下仅使用基础优化时比较流畅的使用带有一些扩展的 SD WebUI__</big> ，并非低于该基准就无法正常运行 SD WebUI 软件。
    * SD WebUI / ComfyUI 等其他 AI 绘图 软件对硬件的需求 __并不__ 完全一致。
    * 本章节不涉及苹果电脑（Intel 平台 / Apple silicon 平台）和 Linux 系统。

## 硬件平台
建议使用台式机，相对于笔记本电脑，台式机有更好的散热条件。同时部分笔记本电脑缺少 [XMP](https://www.intel.cn/content/www/cn/zh/gaming/extreme-memory-profile-xmp.html "英特尔® 极限内存配置文件") / [EXPO](https://www.amd.com/zh-cn/products/processors/technologies/expo.html "AMD Extended Profiles for Overclocking") 功能，导致内存条无法发挥超频性能。

## CPU
Intel / AMD 的近代 CPU 皆可（建议2013年及之后发售的 CPU），只要能流畅运行 Windows 10 专业版 及以上的系统。

!!! warning "注意核心显卡惹祸"
    2024年初，带有核显的 Intel CPU 的用户出现过无法打开 绘世启动器 的问题，主要原因为 Intel 显卡的驱动bug，现 Intel 已通过更新驱动修复该bug。

## 内存
=== "__使用已有硬件__"

    最低 16 GB，建议 32 GB 及以上，DDR3(L) 及之后的内存皆可（含 LPDDR4x / LPDDR5x）。

=== "__准备购买硬件__"

    建议 32 GB 及以上，DDR4 及之后的内存皆可（含 LPDDR4x / LPDDR5x）。

!!! warning "显存如果越少，内存建议越多"
    * 以上内存容量建议仅只针对含有 8 GB 及以上显存 __独立显卡__ 的硬件平台，如果显卡显存大小小于 8 GB，建议配备更多的内存。
    * 如果您打算使用核心显卡（只有 共享 GPU 内存）生成图片，建议把显存容量需求算入到内存容量中。
    * 如果您打算使用 CPU 生成图片，建议把显存容量需求 __加一倍__ 算入到内存容量中。
    * Nvidia [GeForce GRD]("GeForce Game Ready Driver") 536.40 版公版驱动引入了 共享 GPU 内存 功能，可以在不调整 SD WebUI 运行优化参数的前提下已牺牲生成图片速度为前提提高生成图片的 成功率 / 尺寸，此处 共享 GPU 内存 空间实际为内存空间。

!!! warning "谨慎内存焊接在主板上的笔记本"
    * 焊接意味着 基本 断送了升级内存容量的可能。
    * 如果 只能 选择内存焊接在主板上的笔记本，请果断的选择容量最大的。
    
## 显卡
=== "__使用已有硬件__"

    Nvidia 核心：最低 Turing 架构 8 GB 显存显卡，建议 Ampere 架构及以上， 16 GB 及以上显存显卡。
    ??? example "Turing / Ampere 架构对应部分型号"
        | 架构 | GeForce | Quadro / NVS | Tesla / Datacenter |
        | :-: | :-: | :-: | :-: |
        | Turing | GTX 1660 / RTX 2080 / TITAN RTX | RTX 8000 / T1000 | T4 |
        | Ampere | RTX 3090 | RTX A6000 | A100|


    AMD 核心：最低 RDNA2 架构 12 GB 显存显卡，建议 RDNA2 架构 16 GB 及以上显存显卡.
    ??? example "RDNA1 / RDNA2 架构对应部分型号"
        | 架构 | 型号 |
        | :-: | :-: |
        | RDNA1 | Radeon RX 5700 XT(M) |
        | RDNA2 | Radeon RX 6700 XT(M) |

=== "__准备购买硬件__"

    Nvidia 核心：建议 Ampere 架构及以上， 16 GB 及以上显存显卡。
    ??? example "Ampere 架构对应部分型号"
        | 架构 | GeForce | Quadro / NVS | Tesla / Datacenter |
        | :-: | :-: | :-: | :-: |
        | Ampere | RTX 3090 | RTX A6000 | A100|

!!! warning "需求不同，需要不同"
    * 如果您需要长期使用 SDXL 模型生成图片，建议使用 12 GB 及以上显存的显卡。
    * Windows 系统下 AMD / Intel 显卡优化一般，相对于 Nvidia 显卡需要考虑选择更大显存的显卡。
    * RDNA1 架构的显卡因为最大只有 8 GB 显存，故仅作提及。
    * RDNA1 之前架构的 AMD 显卡无法使用 [原版 SD Webui](https://github.com/AUTOMATIC1111/stable-diffusion-webui "AUTOMATIC1111，SD WebUI的母亲（父亲？）")。
    * Nvidia Turing 架构以下的显卡因为缺乏 FP16 算力，可能会有 "要不速度慢要不吃显存多" 的现象。

<small>[扩展阅读：NVIDIA CUDA](#){ .md-button .md-button--primary }</small>

## 硬盘
=== "__使用已有硬件__"

    最低 128 GB 剩余空间的 SATA SSD。

=== "__准备购买硬件__"

    最低 1 TB 剩余空间的 NVME SSD，建议 TLC 颗粒。

!!! warning "软件以外也需要空间的"
    * 这里提出的剩余空间 __仅__ 为储存 SD WebUI 软件建议预留的大小，事实上您还需要为 虚拟内存 预留足够的空间。
    * Windows 系统下在 Nvidia 显卡拥有 8 GB 显存时 物理内存 + 虚拟内存 = 64 GB 可以基本满足生成图片的需求。
    * 建议将 虚拟内存 文件位置设定在 直连 CPU 的 NVME SSD 中（如果主板有）。
    
!!! warning "HDD 并不适合担当此重任"
    * 因为 SD WebUI 软件本身为大量小体积的文件组成，在软件启动时随机读取 IOPS 弱爆的 HDD 会让启动时间明显的增加。
    * 如果实际无法为 SD WebUI 软件准备足够的 SSD 空间，可以考虑将 存放模型 的文件夹放置在 HDD 中，通过 `mklink` 指令将 模型 文件夹链接到 SD WebUI 软件目录内。
    
!!! failure "远离 SMR HDD"
    * SMR HDD 的糟糕性能决定了该类硬盘只能用来存储冷数据，无论什么情况，都不要拿 SMR HDD 来运行 SD WebUI 软件。
    * 您可以用过 硬盘型号 + SMR 词组在搜索引擎搜索您手上的 HDD 是否使用了 SMR 技术。

!!! Success "拥有一个镜像能减轻出错后收拾烂摊子的工作量"
    建议为 SD WebUI 软件准备一个存放镜像的空间（可以存放在 HDD，空间大小等同为 SD WebUI 准备的空间大小），可以为在操作 SD WebUI 软件出现重大问题而又无法撤销时提供简单、有效的还原方式。