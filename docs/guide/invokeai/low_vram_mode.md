# 概述
在 InvokeAI 5.6.0 中加入了低显存模式，可以使显存较小的显卡也能运行像 FLUX 需要大显存的模型。启用低显存模式后，InvokeAI 将会把部分模型权重从显存卸载到内存，减少显存的占用。

## 启用低显存模式
将 InvokeAI 更新到 5.6.0 或者更高的版本后，可以在 InvokeAI 的配置文件中启用低显存模式，这需要找到 InvokeAI 的配置文件。InvokeAI 的配置文件可以在 InvokeAI 的根目录（通常是安装 InvokeAI 的目录中）找到。

如果不知道 InvokeAI 的根目录在哪，可以根据 InvokeAI 启动时控制台的信息查看，在启动 InvokeAI 时可以看到类似下面的控制台输出。

```
[2025-04-05 11:16:24,344]::[InvokeAI]::INFO --> cuDNN version: 90100
[2025-04-05 11:16:28,469]::[InvokeAI]::INFO --> Patchmatch initialized
[2025-04-05 11:16:29,935]::[InvokeAI]::INFO --> Loading node pack invoke_tipo
[2025-04-05 11:16:29,938]::[InvokeAI-TIPO]::INFO --> Loading TIPO Node
[2025-04-05 11:16:29,938]::[InvokeAI-TIPO]::INFO --> Check TIPO Requirements
[2025-04-05 11:16:29,938]::[InvokeAI-TIPO]::INFO --> Check LLaMA CPP
[2025-04-05 11:16:29,940]::[InvokeAI-TIPO]::INFO --> Check TIPO KGen
[TIPO-KGen]-|11:16:30|-INFO: TIPO Model Dir: E:\Softwares\InvokeAI\invokeai\models\kgen
[2025-04-05 11:16:30,211]::[InvokeAI-TIPO]::INFO --> Load TIPO Node Done
[2025-04-05 11:16:30,213]::[InvokeAI]::INFO --> Loading node pack invoke_wd14_tagger
[2025-04-05 11:16:31,125]::[InvokeAI-WD14-Tagger]::INFO --> Loading WD1.4 Tagger Node
[2025-04-05 11:16:31,125]::[InvokeAI-Tagger]::INFO --> Check onnxruntime For WD1.4 Tagger
[2025-04-05 11:16:31,147]::[InvokeAI-WD14-Tagger]::INFO --> Load WD1.4 Tagger Node Done
[2025-04-05 11:16:31,148]::[InvokeAI]::INFO --> Loading node pack XYGrid_nodes
[2025-04-05 11:16:31,218]::[InvokeAI]::INFO --> Loaded 3 node packs from E:\Softwares\InvokeAI\invokeai\nodes: invoke_tipo, invoke_wd14_tagger, XYGrid_nodes
[2025-04-05 11:16:31,275]::[InvokeAI]::INFO --> InvokeAI version 5.9.1
[2025-04-05 11:16:31,275]::[InvokeAI]::INFO --> Root directory = E:\Softwares\InvokeAI\invokeai
[2025-04-05 11:16:31,280]::[InvokeAI]::INFO --> Initializing database at E:\Softwares\InvokeAI\invokeai\databases\invokeai.db
[2025-04-05 11:16:31,382]::[ModelManagerService]::INFO --> [MODEL CACHE] Calculated model RAM cache size: 7163.50 MB. Heuristics applied: [1, 2].
[2025-04-05 11:16:31,597]::[InvokeAI]::INFO --> Pruned 32 finished queue items
[2025-04-05 11:16:35,001]::[InvokeAI]::INFO --> Cleaned database (freed 2.98MB)
[2025-04-05 11:16:35,001]::[InvokeAI]::INFO --> Invoke running on http://127.0.0.1:9090 (Press CTRL+C to quit)
```

在启动信息中可以看到一行关于 Root directory 的信息。

```
[2025-04-05 11:16:31,275]::[InvokeAI]::INFO --> Root directory = E:\Softwares\InvokeAI\invokeai
```

这条信息显示了 InvokeAI 的根目录所在路径，也就是`E:\Softwares\InvokeAI\invokeai`，在这个目录中可以找到`invokeai.yaml`这个配置文件，如果没有则需要启动一次 InvokeAI。

编辑 InvokeAI 配置文件，在配置文件中加入下面的参数以启用低显存模式。

```yaml
enable_partial_loading: true
```


## 配置 PyTorch CUDA 内存分配器
如果显卡的型号为 Nvidia 显卡，可以配置 PyTorch CUDA 的内存分配器，优化 PyTorch 的显存分配。

通常使用 CUDA 内置的内存分配器可以得到更好的效果，在配置文件中加入下面的参数即可使用 CUDA 内置的内存分配器。

```yaml
pytorch_cuda_alloc_conf: "backend:cudaMallocAsync"
```

!!!note
    PyTorch CUDA 内存分配器也可以设置成其他的，详细可以设置的配置可以在此查看：[CUDA semantics — PyTorch 2.6 documentation](https://pytorch.org/docs/stable/notes/cuda.html#optimizing-memory-usage-with-pytorch-cuda-alloc-conf)


## 配置推理的显存大小
InvokeAI 无法使用所有的显存用于模型缓存和加载，它需要预留一定的显存用于各种运算操作，如模型的推理等。

默认情况下 InvokeAI 预留 3 GB 的显存用于模型的推理，通常情况下已经足够用于模型推理。如果仍然出现显存不足的问题，可以提高预留值。

```yaml
device_working_mem_gb: 4
```

添加该配置后将预留 4 GB 的显存用于模型推理，当然可以将该值设置为更高的值。

!!!note
    1. 更高的值意味着需要更加频繁的将模型权重卸载到内存中，导致出图的速度降低，所以该值不宜过高。
    2. 如果需要提高出图速度，可以将这个值降低，但也意味着出现显存不足问题的概率将提高。


## 动态内存和显存缓存大小
InvokeAI 将会利用内存和显存来缓存模型权重，降低硬盘的使用率以提高加载速度。

通常情况下 InvokeAI 将动态管理内存和显存的缓存大小以获得最佳的性能，无需手动配置。

如果显存的足够大，能够完全模型权重存放在显存中，可以手动配置缓存大小来提高性能。

```yaml
# 默认最大的内存缓存大小在启动 InvokeAI 时被确定下来，根据系统的内存和显存大小来确定该值
# 如果需要手动设置，可以通过 max_cache_ram_gb 来覆盖默认值
# 增加 max_cache_ram_gb 的值将增加用于缓存不活跃模型的内存大小，使缓存模型的重新加载速度更快
# 如果系统中有 32 GB 的内存，并且没有其他软件占用大量的内存，可以将 max_cache_ram_gb 设置为 28 GB
max_cache_ram_gb: 28


# 默认最大的显存缓存大小根据可用的显存大小来确定，并且动态调整
# 如果需要手动设置，可以通过 max_cache_vram_gb 来覆盖默认值
# 但通常不需要手动设置该值
max_cache_vram_gb: 16
```

!!!warning
    1. 通常情况下不需要手动设置`max_cache_vram_gb`的值，该配置优先于`device_working_mem_gb`，所以手动配置该值可以会增加显存不足问题的概率。
    2. 如果需要手动配置`max_cache_vram_gb`的值，可以根据`max_cache_vram_gb = 显卡的显存大小 - device_working_mem_gb`来确定。  
    比如显卡的显存大小为 12 GB，`device_working_mem_gb`的值为 3，则`max_cache_vram_gb`的最大安全值为`12GB - 3GB = 9GB`。
    3. 通常手动设置`max_cache_vram_gb`是为了更少的显存占用，所以`max_cache_vram_gb`的值应该设置为远小于**最大安全值**的值。


## 保存模型权重副本在内存中
当 InvokeAI 将模型权重加载到显存中，InvokeAI 仍然将该模型权重保存在内存中，以加快模型的切换速度和应用 LoRA 模型的速度。如果禁用该功能，将降低模型的切换速度和应用 LoRA 模型的速度，但可以降低内存的占用（但内存的峰值占用可能不会改变）。如果系统的内存有限，可以禁用该功能。

```yaml
keep_ram_copy_of_weights: false
```


## 其他参考
详细的低显存模式的说明可阅读：[Low-VRAM mode - Invoke](https://invoke-ai.github.io/InvokeAI/features/low-vram)
