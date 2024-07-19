---
title: 导入工作流
---
工作流除了可以自己搭建，也可以从其他地方下载工作流并导入。


## 工作流下载
常用工作流网站

- [OpenArt](https://openart.ai/home)

OpenArt 作为一款集云端运行 ComfyUI 工作流和 AI 图像创作于一体的平台，OpenArt 提供了强大的 AI 图像创作功能，还提供了云端运行和可免费下载 ComfyUI 工作流，但国内的网不什么好访问。

- [Comfy Workflows](https://comfyworkflows.com/workflows)

Comfy Workflows 上也有很多免费的可用的工作流提供下载，可能没有OpenArt多，但好在国内可以访问到

- [Civitai](https://civitai.com/models)

Civitai 不仅提供了各种模型的下载，还提供了工作流的下载，只要在过滤器里选择工作流选项，就可以看到很多可免费下载的工作流。


## 导入工作流
工作流下载后格式一般是 json 或者 png，可以在 ComfyUI 侧边栏点击 加载 按钮加载工作流文件，也可以将工作流文件从文件管理器拖到 ComfyUI 界面中进行加载。


## 解决节点缺失
如果 ComfyUI 缺少工作流中某些节点所需的扩展，ComfyUI 将弹窗提示哪个节点缺失。

![missing_node_notice](../../assets/images/guide/comfyui/input_workflow/missing_node_notice.jpg)

在工作流界面中表现为节点颜色为红色，并显示 Undefined（因为缺失节点对应的扩展导致节点未定义）。

![undefined_node](../../assets/images/guide/comfyui/input_workflow/undefined_node.jpg)

这时候可以点击 ComfyUI 侧边栏的 管理器 -> 安装缺失节点，ComfyUI-Manager 将自动搜索工作流节点

![search_missing_node_by_comfyui_manager](../../assets/images/guide/comfyui/input_workflow/search_missing_node_by_comfyui_manager.jpg)

在界面中可以看到 ComfyUI-Manager 搜索出来的缺失节点，点击 Install 后重启 ComfyUI 使扩展生效。

如果使用 ComfyUI-Manager 的安装缺少依赖功能未搜索到节点对应的扩展，可以尝试在下载工作流的地方查找该工作流需要安装什么扩展，并使用 ComfyUI-Manager 的通过 Git URL 安装功能进行安装。

有些情况下，下载到的工作流使用了旧版的扩展进行搭建，当扩展出现了破坏性更新后，原有的工作流将不再兼容新的扩展，也就会出现工作流中某些节点显示 Undefined。这时候只能只能将工作流出现问题的地方重新搭建，或者选择将节点对应的扩展回退到旧版本。


## 修复导入失败的扩展
在 ComfyUI 启动完成后，在控制台将显示扩展加载的情况，如下：

```
Import times for custom nodes:
   0.0 seconds: E:\Softwares\ComfyUI\custom_nodes\websocket_image_save.py
   0.0 seconds: E:\Softwares\ComfyUI\custom_nodes\AIGODLIKE-COMFYUI-TRANSLATION
   0.0 seconds (IMPORT FAILED): E:\Softwares\ComfyUI\custom_nodes\ComfyUI-WD14-Tagger
   0.5 seconds: E:\Softwares\ComfyUI\custom_nodes\comfyui_controlnet_aux
   0.5 seconds: E:\Softwares\ComfyUI\custom_nodes\ComfyUI-Manager

Starting server

To see the GUI go to: http://0.0.0.0:8188
```

如果看见某个扩展被标记为 (IMPORT FAILED)，说明该扩展加载失败，扩展加载失败的原因有以下几种可能，以及解决方法。


- 扩展的版本较低，不兼容 ComfyUI，或者 ComfyUI 版本较低，不兼容扩展。

可尝试将 ComfyUI 和 扩展都更到最新版本来解决，在 ComfyUI-Manager 中点击更新全部即可更新 ComfyUI 和扩展。


- 扩展安装后出现扩展自身文件不完整，无法正常运行

尝试将扩展卸载后重新安装。


- 扩展所需的依赖缺失

尝试安装扩展所需的依赖。

在 ComfyUI-Manager 中，进入节点管理，可以看到加载失败的扩展（显示 IMPORT FAILED）。

![fix_node_import_failed_by_comfyui_manager](../../assets/images/guide/comfyui/input_workflow/fix_node_import_failed_by_comfyui_manager.jpg)

选择 Try fix 后重启 ComfyUI，ComfyUI-Manager 将在启动 ComfyUI 时尝试安装该扩展的依赖，一般依赖安装成功后可以解决加载扩展失败的问题。
