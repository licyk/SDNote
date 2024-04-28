---
title: SD WebUI
---
# SD WebUI
这里是有关 SD WebUI 的报错收集。

## 前言
### 部署
如果还没有安装 SD WebUI，请根据下面的文档进行安装。

- [绘画指南 - 部署 - Windows 平台](../guide/install/index.md)


### 版本区分
很多人不知道 4.8，2.8.3，1.9.3，1.5，XL 这些版本哪个是最新的，下面做个简单的解释。

- 整合包 sd-webui-aki-v4.x

4.8 指的是秋葉整合包的版本，像之前的4.7，4.6也是属于整合包的版本。

- 绘世启动器 2.8.x

在打开绘世启动器后，左上角显示的 绘世 2.8.3 为绘世启动器的版本。在使用整合包时，或者使用绘世启动器部署的环境时，只有绘世启动器是自动更新的

- SD WebUI 1.9.x

平时跑图时所看到的界面是 SD WebUI 提供的，而 1.9.3 指的是 SD WebUI 的版本，在绘世启动器的`版本管理`->`内核`所看的 1.9.3 指的也是 SD WebUI 的版本。

- Stable Diffusion 1.5 / XL

平常下载模型的时候总会看到 1.5、XL 这些版本，这里指的是模型基于 Stable Diffusion 1.5 / XL 模型进行训练 / 融合。在跑图的时候，使用的大模型就是 Stable Diffusion 模型。

这里把 Stable Diffusion 简称 SD，[Stability AI](https://stability.ai) 目前推出的 SD 版本有 1.4、1.5、2.0、2.1、XL，在之后将会发布 SD 3，


### 整合包、绘世启动器、SD、SD WebUI 的关系
整合包就是将 SD WebUI（内核），SD 模型、绘世启动器（作为启动 SD WebUI 的工具）和一些常用的扩展打包在一起，实现开箱即用。

SD WebUI 是基于 SD 进行制作的 WebUI 界面，用于方便的使用 SD 这个模型。

而绘世启动器是管理、启动 SD WebUI 的工具，在进行跑图的所使用的界面是 SD WebUI 而不是 绘世启动器。

!!!note
    绘世启动器和 SD WebUI 的关系可以看作 PCL2 启动器和 Minecraft 的关系，所以绘世启动器 ≠ SD WebUI。

## 报错合集

### CUDA kernel errors might be asynchronously reported at some other API call,so the stacktrace below might be incorrect
可尝试以下方法解决。

1. 重装 PyTorch
2. 重装显卡驱动
3. 重装对应显卡版本的整合包

如果以上方法都试过了，可能显卡出现了问题。


### Can't send data when our state is ERROR
刷新浏览器网页即可。


### CUDA Out Of Memory
显存炸了，尝试启用 Tiled VAE，或者将生图的分辨率降低。如果使用 ControlNet 扩展，可以在 ControlNet 的选项卡勾上低显存模式。


### RuntimeError Sizes of tensors must match
图像的分辨率不是 8 的倍数，需重新调整。


### ModuleNotFoundError: No module named 'tqdm.auto'
1、启动器的`版本管理`->`扩展`，卸载 Temporalkit 插件
2、启动器的`高级选项`，点右上角的“启动命令提示符”
3、依次输入下面两条命令
```bash
python -m pip uninstall tqdm -y
python -m pip install tqdm
```
4、重启 SD WebUI


### Cannot connect to proxy
前往绘世启动器的`设置`->`代理设置`，检查代理服务器地址是否和代理软件的地址对应，如果无误，检查代理软件是否打开，或者代理软件的节点是否可用。


### Connection timed out / Connection was Reset
网络不稳定，尝试更换其他网络，或者配置代理。


### 提示词输入框不见了
![prompt_input_box_disappear](../assets/images/help/sd_webui/prompt_input_box_disappear.jpg)

确认这个按钮是否勾上了。


### 生成按钮下面的保存预设按钮不见了
在 SD WebUI 1.6 之后，这个功能被移到旁边的画笔按钮中，如果想恢复按钮，可以尝试安装 [sd-webui-boomer](../guide/use/extra.md#_7) 扩展。


### 图片颜色变得奇怪
可能是提示词 / 分辨率 / 使用的 LoRA 模型有问题，尝试调整后再生图。


### 预览图是正常的，但是出图后图片变花
这是你的大模型和 VAE 模型不匹配，将 VAE 模型改成对应大模型版本的模型，或者 VAE 模型选择无。

![vae_and_sd_model_mismatch](../assets/images/help/sd_webui/vae_and_sd_model_mismatch.jpg)

!!!note
    对应版本的 VAE 模型下载：  
    SD 1.5：[vae-ft-mse-840000-ema-pruned.safetensors](https://modelscope.cn/api/v1/models/licyks/sd-vae/repo?Revision=master&FilePath=sd_1.5%2Fvae-ft-mse-840000-ema-pruned.safetensors)  
    SDXL：[sdxl_fp16_fix_vae.safetensors](https://modelscope.cn/api/v1/models/licyks/sd-vae/repo?Revision=master&FilePath=sdxl_1.0%2Fsdxl_fp16_fix_vae.safetensors)


### stderr: fatal: ambiguous argument 'HEAD': unknown revision or path not in the working tree
`repositories`里的文件出现损坏，将 SD WebUI 下的`repositories`文件夹删掉后重启 SD WebUI。


### modules.sysinfo has no attribute format_exception
尝试下载最新的整合包并部署。


### [WinError 10054]远程主机强迫关闭了一个现有的连接
网络问题，尝试配置代理，或者检查代理是否配置正确。


### Error! in sd webui 1.5, composable-lora not support with sd-webui-lycoris extension
请卸载 a1111-sd-webui-lycoris 扩展（如果安装了 a1111-sd-webui-locon 扩展，也卸载），该插件蒋慧导致 SD WebUI 出图速度变慢。

有关该插件的说明：https://www.bilibili.com/opus/900927097529171969


### [Errno 2] No such file or directory
可能你填写的路径有误导致无法找到文件，请检查后路径是否正确后再重试。


### ModuleNotFondError: no module named '_socket'
在使用旧版整合包 + 某些扩展就会出现这个问题，尝试下载最新的整合包并部署。


### A tensor with al NaNs was produced in Unet / VAE
这是因为当前的生图参数（提示词 / 分辨率 / 种子 / ...）匹配上了一张无法表示的图，所以造成了黑图。可尝试调整生图参数再次进行生图。

如果经常出现黑图，可以前往绘世启动器的高级选项，在[计算精度设置](../sd_launcher/advance/index.md#_5)中关闭对应的半精度优化，但这只是环境措施，并且会显著增加显存的占用。

最好的方法是找出出现问题的模型，并更换掉。使用排除法，检查是否使用了 LoRA，如果用了，尝试去除后是否解决问题。问题未解决，检查是否 ControlNet，并尝试关闭。如果问题解决，说明 ControlNet 模型出问题，需要重新下载 ControlNet 模型。如果问题还是没有解决，则尝试更换大模型 / VAE，如果更换后解决了问题，则说明是大模型 / VAE 的问题。


### Expected all tensors to be on the same device, but found at least two devices, cpu and cuda:0!
尝试重启 SD WebUI，如果未解决，尝试禁用一些扩展。


### The size of tensor a (96) must match the size of tensor b(250) at non-sinaleton dimension 3
可能有以下原因。

1. Lora 模型和大模型版本不匹配。
2. 扩展和 SD WeUI 未更到最新版本，请在绘世启动器的版本管理中进行更新。


### Torch is not able to use GPU
PyTorch 未正确安装 / 版本和显卡不对应，或者显卡驱动未更到最新版本。尝试重新安装 PyTorch 和更新驱动。


### DefaultCPUAllocator: not enough memory
内存不足，尝试增加虚拟内存。

1. 按下`Win + R`快捷键，输入`sysdm.cpl`，回车运行，打开`高级系统设置`
2. 在打开的窗口中，点击`高级`选项卡下`性能`选项组的`设置`按钮
3. 打开性能选项窗口后，点击`高级`选项卡中的`更改`按钮
4. 在打开的窗口中，首先取消勾选`自动管理所有驱动器的分页文件大小`
5. 接下来选择`自定义大小`，然后手动设置初始大小以及最大值，建议初始值为 10240，最大值为 30720（或者更高的值）。设置完后，先点`设置`，然后点击`确定`按钮保存设置，设置好后重启电脑。


### mat1 and mat2 shapes cannot be multiplied
ControlNet 模型和大模型（SD）的版本不匹配，ControlNet 1.5 的模型需要搭配 SD 1.5 模型，ControlNet XL 的模型需要搭配 SDXL 模型。

ControlNet 模型下载：https://modelscope.cn/models/licyks/controlnet_v1.1

### could not convert string to float
输入的字符可能存在中文逗号，请使用英文逗号。


### \<urlopen error [ SSL: WRONG_VERSION_NUMBER] wrong version number (_ssl.c:1007)\>
网络不稳定，尝试更换其他网络，或者配置代理。


### 系统退出代码名称：IN_PAGE_ERROR
虚拟内存不足，尝试增大虚拟内存。


### 系统退出代码名称：ACCESS VIOLATION
内存不足导致崩溃，尝试增大虚拟内存，或者加内存条。


### 提示词插件无法翻译，右上角提示 ’NoneType‘ object has no attribute 'group'
提示词翻译插件的翻译 API 出现了问题，请更换。

![change_prompt_all_in_one_translate_api](../assets/images/help/sd_webui/change_prompt_all_in_one_translate_api.jpg)


### SD WebUI 右上角显示“连接到后台接口服务失败”
![prompt_all_in_one_can_not_connect_backend](../assets/images/help/sd_webui/prompt_all_in_one_can_not_connect_backend.jpg)

刷新浏览器网页即可。


### 训练“预处理”选项卡不见了
参考该教程：[【AI绘画】训练“预处理”选项卡不见了？挪位置了！ - 哔哩哔哩](https://www.bilibili.com/read/cv29917364)


### 停止使用 LoRA 插件
参考该教程：[【AI绘画】停止使用LoRA插件，请使用WebUI内置原生LoRA - 哔哩哔哩](https://www.bilibili.com/read/cv26261691)


### 绘世启动器打开后界面白屏
参考该教程：[【AI绘画】绘世启动器打开全白/全黑 显示错误 - 哔哩哔哩](https://www.bilibili.com/read/cv27627914)


### 备份 SD WebUI 提示词预设
参考该教程：[【AI绘画】SD-WebUI里保存的tag模板换整合包怎么移动/备份？ - 哔哩哔哩](https://www.bilibili.com/read/cv19511011)


### 网页显示不正常，界面挤在一起
参考该教程：[【AI绘画】webui疑难杂症：网页显示不正常，挤在一起了 - 哔哩哔哩](https://www.bilibili.com/read/cv19519519)


### 整合包文件迁移
参考该教程：[https://www.bilibili.com/read/cv24389699](https://www.bilibili.com/read/cv24389699)


### SD WebUI 界面显示异常
如果 SD WebUI 界面出现下面的情况，请检查你的 SD WebUI 路径是否有某个文件夹是以`.`开头。

![leading_dot_causing_interface_removal](../assets/images/help/sd_webui/leading_dot_causing_interface_removal.jpg)

例如：
```
B:\Downloads\.subdir\sd.webui
             ^
```

这时你需要将`.subdir`前面的`.`删去。

详细的原因：[Do not installed Webui under a directory with leading dot (`.`) · Issue #13292 · AUTOMATIC1111/stable-diffusion-webui](https://github.com/AUTOMATIC1111/stable-diffusion-webui/issues/13292)


### TensorRT 扩展能提速三倍？
假的，建议卸载。


### SD WebUI 左上角显示连接错误
查看绘世启动器的控制台，检查 SD WebUI 是否崩溃了。


### RuntimeError: You have not selected any ControlNet Model
你没有选择任何 ControlNet 模型，请在 ControlNet 扩展选项卡中选择一个 ControlNet 模型。

如果没有 ControlNet 模型，可以在这里下载：https://modelscope.cn/models/licyks/controlnet_v1.1


### 使用 WD 1.4 反推器反推提示词时出现报错
如果报错信息中看到`Please check your connection and try again or make sure your Internet connection is on`，这说明是无法连接到 Huggingface，导致下载反推模型失败，尝试配置代理解决。

如果报错信息中看到`ValueError: An event handler (on_interrogate) didn't receive enough output values (needed: 4, received: 3)`，这可能是因为环境中 onnxruntime 的版本过低，在绘世启动器的高级选项中，点击右上角的启动命令提示符，输入以下命令更新 onnxruntime。
```bash
python -m pip install onnxruntime -U
```


### 配置代理
参考该教程：[绘世启动器 - 配置绘世启动器的代理 - SDNote](../help/sd_launcher.md#_6)


### 使用 SDXL 模型时特定提示词组慧出现鬼图
参考该教程：[杂项 - 使用 SDXL 模型时特定的提示词组会出现鬼图 - SD Notes](../guide/use/extra.md#sdxl_1)


### xFormers can't load C++/CUDA extensions
这是因为你安装了不匹配 PyTorch 版本 xFormers，前往绘世启动器的`高级选项`->`环境维护`->`安装 PyTorch`，安装对应版本的 PyTorch。参看[环境维护 - 安装 PyTorch - SD Notes](../sd_launcher/advance/env.md#pytorch)。


### ControlNet 没效果
检查 ControlNet 扩展的选项卡中有没有选择 ControlNet 模型，再检查 ControlNet 权重之类的参数是否正确设置。


### SD WebUI 界面点击没反应
SD WebUI 点击切换模型按钮但无法切换模型，点击生成按钮后无反应，这可能是开启的浏览器翻译导致界面无法正常使用，尝试关闭浏览器翻译后重试。如果问题未解决，尝试更换浏览器。

!!!note
    浏览器推荐：[杂项 - 浏览器推荐 - SDNote](../help/other.md#_5)