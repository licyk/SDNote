---
title: Intel
---
# Intel 用户须知

***

下面文章均取至 [intel-extension-for-pytorch](https://intel.github.io/intel-extension-for-pytorch/xpu/latest/tutorials/known_issues.html)，文件经过翻译，原文点击点击高亮文字

***

# 故障排除

# 当前平台不支持 FP64 数据类型。

原因：FP64 本身不受[Intel® Data Center GPU Flex Series](https://www.intel.com/content/www/us/en/products/docs/discrete-gpus/data-center-gpu/flex-series/overview.html)和[Intel® Arc™ A-Series Graphics](https://www.intel.com/content/www/us/en/products/details/discrete-gpus/arc.html)的支持。 如果您在该平台上运行任何 AI 工作负载并收到此错误消息，则表示内核需要不支持的 FP64 指令，并且执行已停止。

***

# 运行报错 invalid device pointer if import horovod.torch as hvd before import intel_extension_for_pytorch

原因：`Intel® Optimization for Horovod*`使用`Intel® Extension for PyTorch*`提供的实用程序。不正确的导入顺序导致`Intel® Extension for PyTorch*` 在`  Intel® Optimization` 之前卸载 在执行结束时对 Horovod* 进行优化，并触发此错误。

解决方案：在`import intel_extension_for_pytorch`之前加上`import horovod.torch as hvd`

***

# dpcpp 设备数应大于零。

原因：如果您在 conda 环境中使用`Intel® Extension for PyTorch*`，您可能会遇到此错误。因为Conda 还附带了 `libstdc++.so` 动态库文件，该文件可能与操作系统中附带的文件冲突。

解决方案：将操作系统中的`libstdc++.so`文件路径导出到环境变量`LD_PRELOAD`。

***

## 由_GLIBCXX_USE_CXX11_ABI引起的符号未定义。

`ImportError: undefined symbol: _ZNK5torch8autograd4Node4nameB5cxx11Ev`
原因：DPC++ 不支持 `_GLIBCXX_USE_CXX11_ABI=0`，`Intel® Extension for PyTorch*`始终使用`_GLIBCXX_USE_CXX11_ABI=1`进行编译。当 PyTorch* 以 `_GLIBCXX_USE_CXX11_ABI=0`编译时，会出现此符号未定义问题。

解决方案：传递导出  `GLIBCXX_USE_CXX11_ABI=1 ` 并使用支持 ` _GLIBCXX_USE_CXX11_ABI=1 ` 的特定编译器编译 PyTorch*。我们建议在[下载服务器](https://developer.intel.com/ipex-whl-stable-xpu)中以避免此问题。

***

## 使用英特尔 MPI 时，AI 模型执行完成后终止错误。

原因：当 AI 模型（例如 RN50 训练）在英特尔 MPI 环境中执行完成时，这是一个随机问题。它不是用户友好的，因为模型执行不优雅地结束。此问题已在 PyTorch* 2.3 [#116312](https://github.com/pytorch/pytorch/commit/f657b2b1f8f35aa6ee199c4690d38a2b460387ae) 中修复。

解决方案：在模型脚本的清理阶段添加 `dist.destroy_process_group() `，如分布式数据并行入门中所述，如[Getting Started with Distributed Data Parallel](https://pytorch.org/tutorials/intermediate/ddp_tutorial.html)中所述在 Intel Extension for PyTorch* 支持 PyTorch* 2.3 之前®。

***

## 在 Intel® Arc™ A-Series GPUs 上运行某些 AI 模型时。  -997 runtime error  

原因：一些 -997 运行时错误实际上是内存不足错误。由于 Intel® Arc™ A-Series GPUs 的设备内存少于Intel® Data Center GPU Flex Series 170和Intel® Data Center GPU Max Series，因此在其上运行某些 AI 模型可能会触发内存不足错误，并导致它们报告故障，例如最有可能的 -997 运行时错误。这是意料之中的。内存使用优化是一项正在进行的工作，以允许英特尔®锐炫™ A 系列 GPU 支持更多 AI 模型。

***

## 在 WSL2 上，从Intel® Arc™ A-Series GPUs 的源代码构建失败，而不会引发任何错误。

原因：您的系统可能没有足够的内存，因此调用了 Linux 内核的内存不足杀手。可以通过在 bash（WSL2 终端）上运行 dmesg 来验证这一点。

解决方案：如果 OOM 杀手确实终止了生成过程，则可以尝试增加 WSL2 的交换大小和/或减少具有环境变量 `MAX_JOBS `的并行生成作业数（默认情况下，它等于逻辑 CPU 内核数）。因此，将 ` MAX_JOBS  `设置为  `1  `是一种非常保守的方法，会大大减慢速度）。

***

## 某些工作负载在 WSL2 上一段时间后终止并显示错误。CL_DEVICE_NOT_FOUND

原因：此问题是由于 Windows 上的 [TDR feature](https://learn.microsoft.com/en-us/windows-hardware/drivers/display/tdr-registry-keys#tdrdelay)造成的。

解决方案：尝试将 Windows 注册表中的 TDRDelay 增加到一个大值，例如 20（默认为 2 秒），然后重新启动。

***

## AI 模型收敛测试（>24 小时）结束后随机错误终止。

原因：当某些 AI 模型收敛测试执行完成时，这是一个随机问题。它不是用户友好的，因为模型执行不优雅地结束。

解决方案：收敛测试结束后终止进程，或者使用检查点将收敛测试分成几个阶段单独执行。

***

## 在英特尔®数据中心 GPU Max 系列显卡上执行 LLM 推理工作负载时，存在随机不稳定问题，例如页面错误或访问冲突。

原因：LTS 驱动程序[803.29](https://dgpu-docs.intel.com/releases/LTS_803.29_20240131.html) 上报告了此问题。根本原因正在调查中。

解决方案：使用主动滚动稳定释放驱动程序 [775.20](https://dgpu-docs.intel.com/releases/stable_775_20_20231219.html) 或最新驱动程序版本来解决。

***

## Undefined symbol: mkl_lapack_dspevd. Intel MKL FATAL ERROR: cannot load libmkl_vml_avx512.so.2 or `libmkl_vml_def.so.2.

原因：当英特尔扩展 PyTorch* 是使用 oneMKL 库构建的，而 PyTorch* 不是使用任何 MKL 库构建时®，可能会出现此问题。oneMKL内核可能错误地进入CPU后端 并触发此问题。

解决方案：通过从 conda 安装 oneMKL 库来解决问题：

```
conda install mkl
conda install mkl-include
```

然后全新构建 PyTorch*。

***

## OSError: libmkl_intel_lp64.so.2: cannot open shared object file: No such file or directory.

原因：当系统中存在多个 MKL 库时，使用了错误的 MKL 库。

解决方案：通过以下方式预加载oneMKL：

```
export LD_PRELOAD=${MKL_DPCPP_ROOT}/lib/intel64/libmkl_intel_lp64.so.2:${MKL_DPCPP_ROOT}/lib/intel64/libmkl_intel_ilp64.so.2:${MKL_DPCPP_ROOT}/lib/intel64/libmkl_gnu_thread.so.2:${MKL_DPCPP_ROOT}/lib/intel64/libmkl_core.so.2:${MKL_DPCPP_ROOT}/lib/intel64/libmkl_sycl.so.2
```

如果您继续看到其他共享对象文件的类似问题，请在  `${MKL_DPCPP_ROOT}/lib/intel64/ `下添加相应的文件，通过  `LD_PRELOAD `。请注意，如果系统上安装了多个 MKL 库，则库的后缀可能会更改（例如从 .1 更改为 .2）。

***



