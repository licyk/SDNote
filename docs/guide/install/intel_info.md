---
title: Intel 用户须知
---
# Intel 用户须知

[Intel 的 Windows 用户安装教程](https://www.bilibili.com/video/BV1rH4y167hs)。

下面文章均取至 [intel-extension-for-pytorch](https://intel.github.io/intel-extension-for-pytorch/xpu/latest/tutorials/known_issues.html)，文件经过翻译，原文点击点击高亮文字


# 故障排除

## 当前平台不支持 FP64 数据类型。

原因：FP64 本身不受英特尔®数据中心 GPU Flex 系列和英特尔®锐炫™ A 系列显卡平台的支持。 如果您在该平台上运行任何 AI 工作负载并收到此错误消息，则表示内核需要不支持的 FP64 指令，并且执行已停止。

***

## 运行时错误（如果之前）invalid device pointerimport horovod.torch as hvdimport intel_extension_for_pytorch

原因：英特尔®优化版 Horovod* 使用英特尔®扩展 for PyTorch* 提供的实用程序。不正确的导入顺序导致 Intel® Extension for PyTorch* 在 Intel® 之前卸载 在执行结束时对 Horovod* 进行优化，并触发此错误。

解决方案：在 .import intel_extension_for_pytorchimport horovod.torch as hvd

***

## dpcpp 设备数应大于零。

原因：如果您在 conda 环境中使用 Intel® Extension for PyTorch*，可能会遇到此错误。Conda 还附带了 libstdc++.so 动态库文件，该文件可能与附带的文件冲突 在操作系统中。

解决方案：将操作系统中的文件路径导出到环境变量。libstdc++.soLD_PRELOAD

***

## 符号未定义导致。_GLIBCXX_USE_CXX11_ABI

ImportError: undefined symbol: _ZNK5torch8autograd4Node4nameB5cxx11Ev
原因：DPC++ 不支持，英特尔® PyTorch* 扩展始终使用 .当 PyTorch* 是 编译用 ._GLIBCXX_USE_CXX11_ABI=0_GLIBCXX_USE_CXX11_ABI=1_GLIBCXX_USE_CXX11_ABI=0

解决方案：使用支持 .我们建议使用预制车轮 在 [下载服务器](https:// developer.intel.com/ipex-whl-stable-xpu) 中以避免此问题。export GLIBCXX_USE_CXX11_ABI=1_GLIBCXX_USE_CXX11_ABI=1

***

## 使用英特尔 MPI 时，AI 模型执行完成后终止错误。

原因：当 AI 模型（例如 RN50 训练）在英特尔 MPI 环境中执行完成时，这是一个随机问题。它不是用户友好的，因为模型执行不优雅地结束。此问题已在 PyTorch* 2.3 （#116312） 中修复。

解决方案：在模型脚本的清理阶段添加，如上所述 在 Distributed Data Parallel 入门中，英特尔®扩展 PyTorch* 扩展模块支持 PyTorch* 2.3 之前。dist.destroy_process_group()

***

## 在英特尔®锐炫™ A 系列 GPU 上运行某些 AI 模型时。-997 runtime error

原因：有些实际上是内存不足错误。由于英特尔®锐炫™ A 系列 GPU 的设备内存少于英特尔®数据中心 GPU、Flex 系列 170 和英特尔®数据中心 GPU Max 系列，在其上运行某些 AI 模型可能会触发内存不足错误，并导致它们报告故障，例如最有可能的故障。这是意料之中的。内存使用优化是一项正在进行的工作，以允许英特尔®锐炫™ A 系列 GPU 支持更多 AI 模型。-997 runtime error-997 runtime error

***

## 在 WSL2 上，从英特尔®锐炫™ A 系列 GPU 的源代码构建失败，而不会引发任何错误。

原因：您的系统可能没有足够的 RAM，因此调用了 Linux 内核的内存不足杀手。可以通过在 bash （WSL2 终端） 上运行来验证这一点。dmesg

解决方案：如果 OOM 杀手确实终止了生成过程，则可以尝试增加 WSL2 的交换大小，和/或减少与环境并行生成作业的数量 变量（默认情况下，它等于逻辑 CPU 内核数。因此，设置为 1 是一种非常保守的方法，会大大减慢速度）。MAX_JOBSMAX_JOBS

***

## 某些工作负载在 WSL2 上一段时间后终止并显示错误。CL_DEVICE_NOT_FOUND

原因：此问题是由于 Windows 上的 TDR 功能造成的。

解决方案：尝试将 Windows 注册表中的 TDRDelay 增加到较大的值，例如 20（默认为 2 秒），然后重新启动。

***

## AI 模型收敛测试（>24 小时）结束后随机错误终止。

原因：当某些 AI 模型收敛测试执行完成时，这是一个随机问题。它不是用户友好的，因为模型执行不优雅地结束。

解决方案：收敛测试结束后终止进程，或者使用检查点将收敛测试分成几个阶段单独执行。

***

## 在英特尔®数据中心 GPU Max 系列显卡上执行 LLM 推理工作负载时，存在随机不稳定问题，例如页面错误或原子访问冲突。

原因：LTS 驱动程序 803.29 上报告了此问题。根本原因正在调查中。

解决方案：使用主动滚动稳定释放驱动程序 775.20 或最新驱动程序版本来解决。

***

# 库依赖关系

## 问题：在没有 oneMKL 的情况下构建面向 PyTorch* 的英特尔®扩展模块时，找不到 oneMKL 库。

原因：当 PyTorch* 是使用 oneMKL 库构建的，而®英特尔 PyTorch* 扩展模块是在没有 MKL 库的情况下构建的，可能会出现此链接器问题。

解决方案：通过设置以下内容来解决问题：

```
export USE_ONEMKL=OFF
export MKL_DPCPP_ROOT=${HOME}/intel/oneapi/mkl/latest
```

然后全新构建面向 PyTorch* 的英特尔®扩展模块。

***

## 未定义的符号：.英特尔 MKL 致命错误：无法加载或“libmkl_vml_def.so.2.mkl_lapack_dspevdlibmkl_vml_avx512.so.2

原因：当英特尔扩展 PyTorch* 是使用 oneMKL 库构建的，而 PyTorch* 不是使用任何 MKL 库构建时®，可能会出现此问题。oneMKL内核可能错误地进入CPU后端 并触发此问题。

解决方案：通过从 conda 安装 oneMKL 库来解决问题：

```
conda install mkl
conda install mkl-include
```

然后全新构建 PyTorch*。

***

## OSError：：无法打开共享对象文件：没有这样的文件或目录。libmkl_intel_lp64.so.2

原因：当系统中存在多个 MKL 库时，使用了错误的 MKL 库。

解决方案：通过以下方式预加载oneMKL：

```
export LD_PRELOAD=${MKL_DPCPP_ROOT}/lib/intel64/libmkl_intel_lp64.so.2:${MKL_DPCPP_ROOT}/lib/intel64/libmkl_intel_ilp64.so.2:${MKL_DPCPP_ROOT}/lib/intel64/libmkl_gnu_thread.so.2:${MKL_DPCPP_ROOT}/lib/intel64/libmkl_core.so.2:${MKL_DPCPP_ROOT}/lib/intel64/libmkl_sycl.so.2
```

如果继续看到其他共享对象文件的类似问题，请在 by 下添加相应的文件。请注意，如果系统上安装了多个 MKL 库，则库的后缀可能会更改（例如从 .1 更改为 .2）。`${MKL_DPCPP_ROOT}/lib/intel64/LD_PRELOAD`

***

# 单元测试
英特尔®数据中心 GPU Flex 系列 170 上的单元测试失败

以下单元测试在英特尔®数据中心 GPU Flex 系列 170 上失败，但相同的测试用例在英特尔®数据中心 GPU Max 系列上通过。故障的根本原因正在调查中。

test_weight_norm.py::TestNNMethod::test_weight_norm_differnt_type

