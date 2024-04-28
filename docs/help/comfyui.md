---
title: ComfyUI
---
# ComfyUI
这里是有关 ComfyUI 的报错收集。

## 前言
### 部署
部署 ComfyUI 可以通过以下途径。

- 整合包部署：[【AI绘画】ComfyUI整合包发布！解压即用 一键启动 工作流版界面 超多节点 ☆更新 ☆汉化 秋叶整合包_哔哩哔哩_bilibili](https://www.bilibili.com/video/BV1Ew411776J)
- 绘世启动器部署：[什么，绘世启动器还能安装ComfyUI（全新篇——安装与配置） - 哔哩哔哩](https://www.bilibili.com/read/cv28869554)
- 从源码部署：[comfyanonymous/ComfyUI - Installing](https://github.com/comfyanonymous/ComfyUI?tab=readme-ov-file#installing)


### 关于 ComfyUI
ComfyUI 并没有比 SD WebUI 快多少，而 ComfyUI 的显存策略和 SD WebUI 不同，所以 ComfyUI 在很多时候显存占用会比 SD WebUI 低一点，所以没有所谓的 ComfyUI 比 SD WebUI 好。在 SD WebUI 中也有 [LightDiffusionFlow](https://github.com/Tencent/LightDiffusionFlow) 扩展实现 ComfyUI 的保存工作流，工作流可在 [LIGHTFLOW](https://www.lightflow.ai/) 寻找。

ComfyUI 的扩展生态一直存在着问题，各种扩展的环境依赖要求经常互相冲突，甚至和 ComfyUI 的环境依赖要求冲突，部分扩展可能还会互相冲突，导致 ComfyUI 无法正常运行，出现各种报错，所以入门 ComfyUI 需要做好面对报错的准备。

关于 ComfyUI 扩展生态的问题：[A rant about current custom nodes ecosystem · comfyanonymous/ComfyUI · Discussion #2635](https://github.com/comfyanonymous/ComfyUI/discussions/2635)。

这是避免 ComfyUI 环境坏掉的方法（来自绘世启动器开发者[喵喵hmkai](https://space.bilibili.com/2082155)）。

0. 远离官方整合包和官方整合包的派生；如果不能远离，就远离里边自带的更新脚本，除非你不安装任何插件
1. 少装插件
2. 不要直接把插件压缩包或者文件夹拷进去，这不是 WebUI
3. 不要直接 git clone 插件，这不是 WebUI
4. 只有在用官方整合包的情况下使用 install.bat，其他情况均不使用
5. 插件能用列表装就别用链接装，有些额外的部件只有列表里装才会下载，这不是 WebUI

## 报错合集

### 环境依赖存在冲突
这是因为某些扩展的依赖关系出现了冲突。

![conflict_in_environmental_dependencies](../assets/images/help/comfyui/conflict_in_environmental_dependencies.jpg)

这个通常可以选择忽略警告并继续运行。如果想要修复，可尝试选择按顺序安装冲突依赖，只不过无法彻底解决问题。

你可以尝试卸载发生环境依赖冲突的扩展，以上图为例，可以看到 was-node-suite-comfyui 和 ComfyUI-PhotoMaker-ZHO 的依赖要求中只用了`==`来注明版本号，可以在绘世启动器的`版本管理`->`扩展`中，将这两个扩展卸载。


### the following node types were not found，导入节点流爆红
这可能是所加载的节点流缺少了包含了缺失的扩展。

![missing_custom_node](../assets/images/help/comfyui/missing_custom_node.jpg)

可以在你下载工作流的地方查找作者的说明，查看作者使用了哪些扩展，然后在绘世启动器的`版本管理`->`安装新扩展`，搜索对应的扩展或者输入扩展的下载链接进行安装。

或者使用 [ComfyUI-Manager](https://github.com/ltdrdata/ComfyUI-Manager) 扩展管理工具安装缺失的扩展（前提是安装了 [ComfyUI-Manager](https://github.com/ltdrdata/ComfyUI-Manager) 扩展）。在 ComfyUI 右下角点击管理器，在 ComfyUI-Manager 界面点击安装缺失节点。

![search_missing_custom_node_by_comfyui_manager](../assets/images/help/comfyui/search_missing_custom_node_by_comfyui_manager.jpg)

等待 ComfyUI-Manager 扫描缺失的扩展。扫描完成后将列出缺失的扩展。

![install_missing_custom_node_by_comfyui_manager](../assets/images/help/comfyui/install_missing_custom_node_by_comfyui_manager.jpg)

点击安装这些扩展，然后重启 ComfyUI 后生效。

!!!note
    如果这里没有显示扩展，可能有以下原因。

    1. 扩展不在 ComfyUI-Manager 的扩展数据库中，无法被查找到。
    2. 扩展已经安装了，但是在 ComfyUI 启动的时候加载失败了，在 ComfyUI 的启动信息中可以查看 Import times for custom nodes 这部分的信息，如果看到 IMPORT FAILED 就说明加载失败了。
    3. 扩展出现了破坏性更新，扩展内带的节点出现过大的改动，导致原来使用该扩展搭建出的节点无法使用，需要重新搭建。比如 [ComfyUI_IPAdapter_plus](https://github.com/cubiq/ComfyUI_IPAdapter_plus) 扩展，在 2024.3.23 时将扩展重写了（破坏性更新），导致之前使用这个扩展的工作流需要重新搭建。


### ComfyUI 启动时显示 IMPORT FAILED
在 ComfyUI 启动完成后显示的 Import times for custom nodes 信息中出现了 IMPORT FAILED，这是因为扩展因为某些原因导致导入失败，可能有以下几种原因。

1. 扩展有子模块未正确克隆下载，请使用绘世启动器的[扩展安装功能](../sd_launcher/ver_manager/install.md)或者 [ComfyUI-Manager](https://github.com/ltdrdata/ComfyUI-Manager) 重新安装该扩展。
2. 扩展版本和 ComfyUI 版本未对齐，请在绘世启动器的版本中将内核和扩展都更新一遍。
3. 扩展所需的依赖环境缺失，需要在绘世启动器的`高级选项`->`环境维护`，使用[环境修复](../sd_launcher/advance/env.md#_2)功能修复扩展所需的依赖环境。


### Please check your connect and try again or make sure your Internet connection is on
这是因为网络问题导致无法下载一些缺失文件，尝试配置代理解决。

!!!note
    有些报错也和网络问题有关，比如报错中有`Internet`、`connection`这些关键词，或者是`由于目标计算机积极拒绝，无法连接` / `信号灯超时时间已到`，就有可能是网络问题。


### 'UNetModel' object has no attribute 'default_image_only_indicator'
在绘世启动器的`版本管理`->`扩展`，更新或者卸载 [FreeU_Advanced](https://github.com/WASasquatch/FreeU_Advanced) 扩展。


### ComfyUI 设置中文
有以下两种方式设置中文。

- 使用 [AIGODLIKE-COMFYUI-TRANSLATION](https://github.com/AIGODLIKE/AIGODLIKE-COMFYUI-TRANSLATION) 扩展

1. 在绘世启动器的`版本管理`->`安装新扩展`，搜索 AIGODLIKE-COMFYUI-TRANSLATION 扩展并安装。
2. 在 ComfyUI 的界面点击右上角的齿轮图标进入 ComfyUI 设置。
3. 在 ComfyUI 设置中找到 AGLTranslation-langualge 选项，然后选择 [中文] Chinese Simplified。

- 使用绘世启动器的云端汉化功能

1. 打开绘世启动器的高级选项。
2. 在启动器特性设置中找到启用云端页面汉化选项，启用即可。


### 配置代理
参考该教程：[绘世启动器 - 配置绘世启动器的代理 - SDNote](../help/sd_launcher.md#_6)


### insightface model is required for FaceID models
缺失对应的模型，参看扩展说明自行下载模型，放到对应的目录。在 ComfyUI-Manager 中，可以在`安装模型`选项找到缺失的模型。


### ComfyUI too old, can't autodecet properly.
在绘世启动器的版本管理里更新 ComfyUI。


### [AinmateDiffEvo] - ERROR - No motion models found.Please download one and place in ...
这是缺少 AnimateDiffEvo 扩展对应的动作模型，如果不使用 AnimateDiffEvo 扩展，可以忽略这个报错。如果要解决这个报错，请下载对应的模型并放到报错提示的路径中，参考：[Kosinkadink/ComfyUI-AnimateDiff-Evolved - Model Setup](https://github.com/Kosinkadink/ComfyUI-AnimateDiff-Evolved?tab=readme-ov-file#model-setup)。


### mat1 and mat2 shapes cannot be multiplied
ControlNet 模型和大模型（SD）的版本不匹配，ControlNet 1.5 的模型需要搭配 SD 1.5 模型，ControlNet XL 的模型需要搭配 SDXL 模型。

ControlNet 模型下载：https://modelscope.cn/models/licyks/controlnet_v1.1