## CUDA SDK Version(s) / CUDA Compute Capability (Version) 的关系
- CUDA SDK Version(s) 指 CUDA 开发工具的版本，一张显卡核心能够支持多个不同的 CUDA SDK Version(s)，PyTorch 和 xformers 软件中描述的 CUDA 版本为 CUDA SDK Version(s)。
- CUDA Compute Capability (Version) 指显卡核心中 CUDA 的代数，一张显卡核心的 CUDA Compute Capability (Version) 是固定不变的。

## 部分 CUDA Compute Capability (Version) / 显卡核心架构 / CUDA SDK Version(s) 的关系[^1]
<div class="grid" markdown>
| Compute Capability | 显卡核心架构 | CUDA SDK Version(s) |
| :-: | :-: | :-: |
| 6.0-6.2 | Pascal | 11.8/12.0-12.4 |
| 7.0-7.2 | Volta | 11.8/12.0-12.4 |
| 7.5 | Turing | 11.8/12.0-12.4 |
| 8.0-8.7 | Ampere | 11.8/12.0-12.4 |
| 8.9 | Ada Lovelace | 11.8/12.0-12.4 |
| 9.0 | Hopper | 11.8/12.0-12.4 |
| 10.0 | Blackwell | 未列出 |

!!! info "关系说明"
    * 列表仅列出支持 FP16 的显卡核心架构。
    * 列表中 Turing 以下核心架构显卡 __仅 Tesla 计算卡__ 支持 FP16[^2] [^3]。
    * 实际 Compute Capability 5.3 的 Maxwell 架构核心支持 FP16，但未有对应的 桌面 / 移动 显卡，故排除。
    * 显卡核心架构 与 显卡核心型号 的关系可见[^1]
    * CUDA SDK Version(s) 仅列出 PyTorch 2 开始支持的版本。
    * 显卡核心型号 与 Compute Capability 的关系可见 [NVIDIA DEVELOPER页面](https://developer.nvidia.com/cuda-gpus#compute)
</div>

[^1]: 参考来源：[维基百科 CUDA GPUs supported](https://en.wikipedia.org/wiki/CUDA#GPUs_supported)
[^2]: 参考来源：[NVIDIA Deep Learning TensorRT Documentation](https://docs.nvidia.com/deeplearning/tensorrt/support-matrix/index.html#hardware-precision-matrix)
[^3]: 参考来源：[维基百科 CUDA Version features and specifications](https://en.wikipedia.org/wiki/CUDA#Version_features_and_specifications)