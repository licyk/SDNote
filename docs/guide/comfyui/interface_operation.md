---
title: 界面操作
---
# 简述
ComfyUI 的界面和 Stable Diffusion WebUI 的界面完全不相同，在 ComfyUI 中，每个功能都被拆散成一个个节点，通过连接不同的节点搭建起一个完整的生图流程。

![comfyui_interface](../../assets/images/guide/comfyui/interface_operation/comfyui_interface.png)


## 前期配置
如果 ComfyUI 未安装扩展管理器和中文翻译扩展，建议通过以下几种方式进行安装。


### 使用绘世启动器安装
打开绘世启动器的 版本管理 -> 安装新扩展，分别搜索 ComfyUI-Manager 和 AIGODLIKE-COMFYUI-TRANSLATION 并下载安装。


### 使用 Git 命令安装
进入 ComfyUI 的 custom_nodes 文件夹中，打开终端，输入以下的命令安装 ComfyUI-Manager 和 AIGODLIKE-COMFYUI-TRANSLATION 扩展。

```
git clone https://github.com/ltdrdata/ComfyUI-Manager
git clone https://github.com/AIGODLIKE/AIGODLIKE-COMFYUI-TRANSLATION
```

安装后重新启动 ComfyUI。


## 设置中文
安装以上的扩展后，在 ComfyUI 界面顶部可以看到 Manager 按钮，说明扩展管理器已经成功安装，但是通常情况下 ComfyUI 中文翻译扩展安装后并不会自动设置 ComfyUI 界面为中文，需要手动设置。

在 ComfyUI 左下角点击齿轮按钮进入 ComfyUI 设置，找到 AGL 选项并点击，在 AGLTranslation-langualge 选项选择 中文[Chinese Simplified] 后 ComfyUI 将自动重启，此时 ComfyUI 的界面就切换成中文了。


## 快捷键
以下为操作 ComfyUI 界面的快捷键。

|操作|作用|
|---|---|
|鼠标滚轮|缩放工作流的大小。|
|鼠标右键|打开节点列表。|
|鼠标左键双击|打开节点搜索列表。|
|Ctrl + Enter|运行当前的工作流|
|Ctrl + Shift + Enter|将当前的工作流作为运行列表里第一个被运行的工作流|
|Ctrl + Z|撤销工作流更改|
|Ctrl + Y|重做工作流更改|
|Ctrl + S|保存工作流|
|Ctrl + O|导入工作流|
|Alt + C|折叠 / 取消折叠选中的节点。|
|Ctrl + M|禁用 / 激活选中的节点。|
|Ctrl + B|使被选中的节点在工作流运行时被绕过。|
|Delete / Backspace|删除选中的节点。|
|Ctrl + 右 Ctrl + Backspace|清除当前的工作流。|
|Space + 移动鼠标|移动画布。|
|Ctrl + 鼠标左键单击|多选节点。|
|Shift + 鼠标左键长按|拖动选中的多个节点。|
|Ctrl + C / V|复制 / 粘贴选中的节点（不复制节点的连线）。|
|Ctrl + Shift + C / V|复制 / 粘贴选中的节点（同时复制节点的连线）。|
|Ctrl + D|加载默认的工作流。|
|Alt + `+`|放大工作流。|
|Alt + `-`|缩小工作流。|
|Alt + 点击连接线上的点|创建转接点。|
|Shift + 按住连接线上的转接点|从转接点拉出连接线。|
|Q|显示当前运行的工作流队列。|
|H|显示历史工作流。|
|R|刷新工作流。|


## 节点操作
在节点的左侧接口为输入点，节点右侧的接口为输出点，鼠标按住接口并向外拖动可以看到延伸出来的线，将线拖到匹配这个线的接口上可完成不同节点之间的连接。


### 节点菜单
右键节点可以看到该节点的编辑功能。

![comfyui_context_menu](../../assets/images/guide/comfyui/interface_operation/comfyui_context_menu.png)


### 工作流运行提示
如果节点未连接必要的输入，在运行工作流是节点将会报错，使用红色圈标记缺少的输入。

![node_missing_require_input](../../assets/images/guide/comfyui/interface_operation/node_missing_require_input.png)

此时连上对应的输入即可。

运行工作流时，正在运行的节点将会标记为绿色。

![working_node](../../assets/images/guide/comfyui/interface_operation/working_node.png)

如果某个节点运行出现的错误，此时节点会标记为紫色，此时应该检查该节点和该节点前面的节点是否有参数错误，连接是否有误。

![node_has_error](../../assets/images/guide/comfyui/interface_operation/node_has_error.png)

除了将节点标记为紫色，ComfyUI 将弹窗提示报错信息。

![error_notice](../../assets/images/guide/comfyui/interface_operation/error_notice.png)

点击 Find Issues 可以跳转到 ComfyUI 的 Github Issues 分区中，可以尝试从中找到和自己错误类似的帖子并寻求解决方法，或者发送 Issues 报告这个错误。

点击 Show Report 将显示具体的报错信息，可以根据这个信息在搜索引擎查找对应的解决方法。


### 建立节点组
下面是一个简单的生图工作流，可以看到该工作流有许多节点组成。

![nodes_before_make_group](../../assets/images/guide/comfyui/interface_operation/nodes_before_make_group.png)

如果觉得一个个节点在调整时很麻烦，可以将这些节点组合成节点组。按住键盘上的 Ctrl 键，使用鼠标选中这些节点，再右键打开菜单，选择**转换为节点组**，此时将弹出节点组命名窗口，输入名称并确定后将创建一个新的节点组。

![make_new_node_group](../../assets/images/guide/comfyui/interface_operation/make_new_node_group.png)

现在工作流就显得非常整洁了，右键该节点选择**Manage Group Node**可以调整节点组的组件顺序和要显示的组件，但是这样整合功能的节点在出现报错时排查问题会变得困难，当出现报错时需要右键该节点组，选择**转换为节点**将节点组拆分，对错误进行排查。


### 节点分类
当节点过多时，工作流可能就显得很乱，此时就可以通过建立组对节点进行分类。

在 ComfyUI 界面空白处右键打开菜单，点击**新建框**就会创建一个框，创建多个框并调整框的大小后，将节点移动到里面进行分类，这样就可以让工作流的每个部分清晰明了，当拖动框时，框内的节点也会被拖动。

除了通过这种方式创建框进行分类，还可以用 ComfyUI 的快速建框的功能。将几个节点放在一起后，按住 Ctrl 键多选节点，再右键 ComfyUI 界面空白处，选择**并入到框**，此时 ComfyUI 将自动为选中的 ComfyUI 节点创建框。

![create_frame_classify_node](../../assets/images/guide/comfyui/interface_operation/create_frame_classify_node.png)


### 节点连线
节点之间连线可以通过按住节点的接口拉出一条线，将线连接到另一个节点上。如果一个节点的输出想要拉出两条线，除了从接口分别拉出两条线这个方法，还可以在有一条线的基础上，按住 Shift 键并点击那条线，此时将快速从该线的端点快速拉出一条线，而不是必须从输出接口拉线。

如果节点之间的连线过长，想要整理连线，可以使用**转接点**节点进行中转。

![use_route_node](../../assets/images/guide/comfyui/interface_operation/use_route_node.png)

除了使用**转接点**节点，也可以直接在线上突出的点建立转接点。打开 ComfyUI 设置，在**LiteGraph -> Reroute Beta**，将 **Opt-in to the reroute beta test** 启用即可使用该功能。

按住 Alt 键并点击连线上凸起的点，此时点将变大并转换为转接点，按住 Shift 键可以从该转接点拉出线用于连接其他节点。

![use_new_route_point](../../assets/images/guide/comfyui/interface_operation/use_new_route_point.png)


### 重置节点
如果节点的参数调错了导致出图效果不行或者无法正常生成图片，可以右键该节点，选择**修复（重建）**，此时将重置节点的参数为默认值。


### 转换节点输入
节点的参数一般由输入接口和界面组件组成，但界面组件可以转换为输入接口，通过输入接口控制原有界面组件的参数。右键该节点，在**转换为输入**选项中可以选择将想要转换的界面组件转换成输入接口。

|转换前|转换后|
|---|---|
|![node_before_convert_widget_to_input](../../assets/images/guide/comfyui/interface_operation/node_before_convert_widget_to_input.png)|![convert_node_widget_to_input](../../assets/images/guide/comfyui/interface_operation/convert_node_widget_to_input.png)|

!!!warning
    注意，将界面组件转换成输入接口后必须为该输入接口连接对应的节点，否则将导致该节点报错无法运行，或者右键该节点，在**转换为组件**选项将输入接口转换为界面组件。


### 折叠节点
有些节点的参数不需要展示，并且想要降低节点占用界面的空间，可以点击节点左上角的圆点，此时节点将折叠所有参数，再次点击圆点将恢复。


### 节点批量拖动 / 复制 / 粘贴
按住 Ctrl / Shift 键，使用左键点击节点可以多选节点，按住 Shift 键时拖动被多选中的节点的某一个节点可以同时拖动多个被选中的节点。

使用 Ctrl + C 可以复制节点，再按下 Ctrl + V 可以粘贴节点。


### 节点删除
如果要删除某个节点，选中某个后按下 Backspace / Delete 键即可，或者右键该节点，选择**移除**即可删除节点。


## 工具栏
ComfyUI 的工具栏包含了一些快捷按钮，如 执行队列，这个按钮就类似 Stable Diffusion WebUI 中的生成按钮。

下面是侧边栏的功能。

|按钮|队列|节点库|模型库|工作流|切换主题|设置|
|---|---|---|---|---|---|---|
|界面|![queue_interface](../../assets/images/guide/comfyui/interface_operation/queue_interface.png)|![node_library_interface](../../assets/images/guide/comfyui/interface_operation/node_library_interface.png)|![model_library_interface](../../assets/images/guide/comfyui/interface_operation/model_library_interface.png)|![workflow_list_interface](../../assets/images/guide/comfyui/interface_operation/workflow_list_interface.png)|![switch_interface_theme](../../assets/images/guide/comfyui/interface_operation/switch_interface_theme.png)|![comfyui_setting](../../assets/images/guide/comfyui/interface_operation/comfyui_setting.png)|
|作用|显示 ComfyUI 正在执行的工作流队列和已完成的队列。|显示 ComfyUI 中存在的节点列表，可以拖动节点出来放入工作流中。|显示 ComfyUI 中`ComfyUI/models`文件夹里已有的模型，将模型拖动出来将自动创建加载该模型所对应的模型加载节点。|显示 ComfyUI 已保存的工作流和已经打开的工作流。|切换 ComfyUI 界面的主题。|打开 ComfyUi 的设置。|

在 ComfyUI 的顶部栏也包含一些功能。

|按钮|工作流|编辑|帮助|切换底部面板|隐藏菜单|
|---|---|---|---|---|---|
|界面|![workflow_button](../../assets/images/guide/comfyui/interface_operation/workflow_button.png)|![edit_buttom](../../assets/images/guide/comfyui/interface_operation/edit_buttom.png)|![help_buttom](../../assets/images/guide/comfyui/interface_operation/help_buttom.png)|![toggle_bottom_panel](../../assets/images/guide/comfyui/interface_operation/toggle_bottom_panel.png)|![hide_menu](../../assets/images/guide/comfyui/interface_operation/hide_menu.png)|
|作用|显示关于工作流的操作。|显示编辑工作流的功能。|获取 ComfyUI 帮助。|显示 ComfyUI 运行日志。|隐藏 / 显示 ComfyUI 工具栏。|


## 执行队列
ComfyUI 提供一个按钮用于运行工作流。

![queue_buttom](../../assets/images/guide/comfyui/interface_operation/queue_buttom.png)

按住该按钮的最左边可以拖动该按钮的位置。

点击**执行队列**可以运行工作流，多次点击将会创建一个工作流队列，依次运行工作流。在**执行队列**的右边有个向下的箭头，点开后可以看到工作流的工作模式。

**执行队列**模式是在点击该按钮后才运行工作流，**执行队列 立即**模式是一直运行工作流，**执行队列 变动**模式是在修改工作流的某个参数后再运行，但使用该模式时要注意，当工作流中有运行后会发生变动的参数，比如**随机种**，运行工作流后将会发生变化，此时将再次触发工作流的运行，也就会无限运行下去。

假设下面是一个工作流队列。

|(正在运行的工作流)|(待运行的工作流 1)|(待运行的工作流 2)|(待运行的工作流 3)|

点击**执行队列**时将会在队列后面插入新的工作流队列。

|(正在运行的工作流)|(待运行的工作流 1)|(待运行的工作流 2)|(待运行的工作流 3)|(插入的待运行的工作流)|

如果按下 Shift 键再点击**执行队列**，工作流队列将插入在正在运行的工作流和待运行的工作流之间。

|(正在运行的工作流)|(插入的待运行的工作流)|(待运行的工作流 1)|(待运行的工作流 2)|(待运行的工作流 3)|

如果当前已经有几个工作流队列，但是想修改参数后让下次运行的工作流为刚刚修改后的工作流，可以按住 Shift 键，

右边的数字调整运行工作流的批次。

× 按钮为取消当前运行的工作流，而方形按钮将清空所有待运行的工作流队列。


## 扩展管理
安装 ComfyUI-Manager 扩展后，在 ComfyUI 工具栏可以看到**管理器**按钮，点开后可以看到 ComfyUI-Manager 的界面。

![comfyui_manager_interface](../../assets/images/guide/comfyui/interface_operation/comfyui_manager_interface.png)

ComfyUI-Manager 包含了管理 ComfyUI 的各种功能，以下是不同功能的描述。


- 节点管理

管理 ComfyUI 的扩展，包含安装 / 卸载 / 禁用 / 启用节点，修复节点缺失依赖的功能。


- 安装缺失节点

当导入一个工作流时，如果 ComfyUI 缺少工作流中节点所需要的扩展，ComfyUI 将弹窗提示有节点缺失，这是可以使用该功能扫描工作流需要的节点并安装。


- 模型管理

模型管理可以下载一些节点所需的模型。


- 通过 Git URL 安装

如果将要安装的插件没有节点管理中搜到，但是知道该节点的 Git 仓库地址，可以通过该功能进行安装。


- 更新全部

点击后将更新所有的 ComfyUI 扩展和 ComfyUI 本体。


- 更新 ComfyUI

仅更新 ComfyUI 本体。


- A1111 替代

下载实现 Stable Diffusion WebUI 部分功能的扩展。


ComfyUI-Manager 还有其他实用的功能，如标签显示功能，启用后可以看到节点是来源于哪个扩展。


## 释放显存占用
ComfyUI-Manager 还提供了释放显存的工具，在 ComfyUI-Manager 的**管理器**按钮旁边有 2 个用于释放显存的按钮，点击后将会卸载放置在显存中的模型，释放被占用的显存。

![unload_model_by_comfyui_manager](../../assets/images/guide/comfyui/interface_operation/unload_model_by_comfyui_manager.png)


## ComfyUI 内置节点
使用 ComfyUI 时，优先使用 ComfyUI 内置的节点进行工作流搭建，当 ComfyUI 内置的节点无法实现想要的功能时再考虑使用 ComfyUI 扩展提供的节点。

下面是 ComfyUI 内置的节点列表。

???ComfyUI_Node_Library
    ComfyUI Node Library  
    ├── api  
    │   └── 图像  
    │       └── 保存图像到网络接口  
    ├── Latent  
    │   ├── Latent按系数缩放  
    │   ├── Latent复合  
    │   ├── Latent缩放  
    │   ├── Latent遮罩复合  
    │   ├── SD3  
    │   │   └── 空Latent_SD3  
    │   ├── StableCascade  
    │   │   ├── VAE编码_Cascade_StageC  
    │   │   └── 空Latent_Cascade  
    │   ├── VAE编码  
    │   ├── VAE解码  
    │   ├── video  
    │   │   ├── EmptyMochiLatentVideo  
    │   │   └── ltxv  
    │   │       └── EmptyLTXVLatentVideo  
    │   ├── 变换  
    │   │   ├── Latent裁剪  
    │   │   ├── Latent翻转  
    │   │   └── Latent旋转  
    │   ├── 高级  
    │   │   ├── Latent插值  
    │   │   ├── Latent批次随机种操作  
    │   │   ├── Latent相乘  
    │   │   ├── Latent相加  
    │   │   ├── Latent相减  
    │   │   └── operations  
    │   │       ├── Latent操作 色调映射Reinhard  
    │   │       ├── Latent操作（锐化）  
    │   │       ├── Latent应用操作  
    │   │       └── Latent应用操作（CFG）  
    │   ├── 空Latent  
    │   ├── 内补  
    │   │   ├── VAE内补编码器  
    │   │   └── 设置Latent噪波遮罩  
    │   ├── 批处理  
    │   │   ├── Latent组合批次  
    │   │   ├── 从批次获取Latent  
    │   │   ├── 复制Latent批次  
    │   │   └── 重设Latent批次  
    │   └── 音频  
    │       ├── VAE编码_Audio  
    │       ├── VAE解码_Audio  
    │       └── 空Latent_Audio  
    ├── 采样  
    │   ├── K采样器  
    │   ├── K采样器(高级)  
    │   ├── 视频模型  
    │   │   ├── 三角CFG引导  
    │   │   └── 线性CFG引导  
    │   └── 自定义采样  
    │       ├── Sigmas  
    │       │   ├── 翻转Sigmas  
    │       │   ├── 分离Sigmas  
    │       │   └── 分离Sigmas降噪  
    │       ├── 采样器  
    │       │   ├── DPMAdaptative采样器  
    │       │   ├── DPMPP_2M_SDE采样器  
    │       │   ├── DPMPP_2S_Ancestral采样器  
    │       │   ├── DPMPP_3M_SDE采样器  
    │       │   ├── DPMPP_SDE采样器  
    │       │   ├── Euler_A_CFG++采样器  
    │       │   ├── Euler_A采样器  
    │       │   ├── K采样器选择  
    │       │   ├── LCM缩放采样器  
    │       │   └── LMS采样器  
    │       ├── 调度器  
    │       │   ├── AlignYourSteps调度器  
    │       │   ├── Beta调度器  
    │       │   ├── Exponential调度器  
    │       │   ├── GITS调度器  
    │       │   ├── Karras调度器  
    │       │   ├── Laplace调度器  
    │       │   ├── LTXVScheduler  
    │       │   ├── Polyexponential调度器  
    │       │   ├── SDTurbo调度器  
    │       │   ├── VP调度器  
    │       │   └── 基础调度器  
    │       ├── 引导器  
    │       │   ├── CFG引导  
    │       │   ├── 基础引导  
    │       │   └── 双CFG引导  
    │       ├── 噪波  
    │       │   ├── 禁用噪波  
    │       │   └── 随机噪波  
    │       ├── 自定义采样器  
    │       └── 自定义采样器(高级)  
    ├── 测试
    │   ├── Euler_CFG++采样器  
    │   ├── Latent混合  
    │   ├── PerpNeg重塑负提示引导  
    │   ├── PhotoMaker  
    │   │   ├── PhotoMaker编码  
    │   │   └── PhotoMaker加载器  
    │   ├── SAG自注意力引导  
    │   ├── StableCascade  
    │   │   └── StableCascade_超分ControlNet  
    │   ├── Torch编译模型  
    │   ├── VAE分块编码  
    │   ├── VAE分块解码  
    │   ├── 保存 LoRA  
    │   ├── 保存Latent  
    │   ├── 差异扩散  
    │   ├── 读取Latent  
    │   ├── 条件  
    │   │   └── CLIP文本编码ControlNet  
    │   ├── 注意力测试  
    │   │   ├── CLIP注意力乘数  
    │   │   ├── UNetTemporal注意力乘数  
    │   │   ├── UNet交叉注意力乘数  
    │   │   └── UNet自注意力乘数  
    │   └── 自定义采样  
    │       └── 噪波  
    │           └── 添加噪波  
    ├── 高级  
    │   ├── guidance  
    │   │   ├── SkipLayerGuidanceDiT  
    │   │   └── SkipLayerGuidanceSD3  
    │   ├── hooks  
    │   │   ├── CLIP  
    │   │   │   └── Set CLIP Hooks  
    │   │   ├── combine  
    │   │   │   ├── Combine Hooks [2]  
    │   │   │   ├── Combine Hooks [4]  
    │   │   │   └── Combine Hooks [8]  
    │   │   ├── cond pair  
    │   │   │   ├── Cond Pair Combine  
    │   │   │   ├── Cond Pair Set Default Combine  
    │   │   │   ├── Cond Pair Set Props  
    │   │   │   └── Cond Pair Set Props Combine  
    │   │   ├── cond single  
    │   │   │   ├── Cond Set Default Combine  
    │   │   │   ├── Cond Set Props  
    │   │   │   └── Cond Set Props Combine  
    │   │   ├── create  
    │   │   │   ├── Create Hook LoRA  
    │   │   │   ├── Create Hook LoRA (MO)  
    │   │   │   ├── Create Hook Model as LoRA  
    │   │   │   └── Create Hook Model as LoRA (MO)  
    │   │   ├── Timesteps Range  
    │   │   └── 调度  
    │   │       ├── Create Hook Keyframe  
    │   │       ├── Create Hook Keyframes From Floats  
    │   │       ├── Create Hook Keyframes Interp  
    │   │       └── Set Hook Keyframes  
    │   ├── 加载器  
    │   │   ├── CLIP加载器  
    │   │   ├── UNET加载器  
    │   │   ├── 三CLIP加载器  
    │   │   ├── 双CLIP加载器  
    │   │   └── 已弃用  
    │   │       └── 扩散加载器  
    │   ├── 模型  
    │   │   ├── ModelSamplingLTXV  
    │   │   ├── 模型采样算法AuraFlow  
    │   │   ├── 模型采样算法Cascade  
    │   │   ├── 模型采样算法Flux  
    │   │   ├── 模型采样算法SD3  
    │   │   ├── 模型离散采样算法  
    │   │   ├── 模型连续采样算法EDM  
    │   │   ├── 模型连续采样算法V  
    │   │   └── 缩放CFG  
    │   ├── 模型融合  
    │   │   ├── 保存Checkpoint  
    │   │   ├── 保存Checkpoint(仅图像)  
    │   │   ├── 保存CLIP  
    │   │   ├── 保存VAE  
    │   │   ├── 保存模型  
    │   │   ├── 模型版本  
    │   │   │   ├── ModelMergeAuraflow  
    │   │   │   ├── ModelMergeLTXV  
    │   │   │   ├── ModelMergeMochiPreview  
    │   │   │   ├── ModelMergeSD35_Large  
    │   │   │   ├── 模型融合(SD1)  
    │   │   │   ├── 模型融合(SD2)  
    │   │   │   ├── 模型融合(SD3_2B)  
    │   │   │   ├── 模型融合(SDXL)  
    │   │   │   └── 融合Flux1模型  
    │   │   ├── 模型融合(相加)  
    │   │   ├── 融合CLIP  
    │   │   ├── 融合CLIP（相加）  
    │   │   ├── 融合CLIP（相减）  
    │   │   ├── 融合模型  
    │   │   ├── 融合模型(分层)  
    │   │   └── 融合模型(相减)  
    │   └── 条件  
    │       ├── CLIP文本编码Hunyuan  
    │       ├── CLIP文本编码SD3  
    │       ├── CLIP文本编码SDXL  
    │       ├── CLIP文本编码SDXL(Refiner)  
    │       ├── flux  
    │       │   ├── CLIP文本编码Flux  
    │       │   └── Flux引导  
    │       ├── 设置条件时间  
    │       └── 条件零化  
    ├── 加载器  
    │   ├── Checkpoint加载器(简易)  
    │   ├── CLIP视觉加载器  
    │   ├── ControlNet加载器  
    │   ├── DiffControlNet加载器  
    │   ├── GLIGEN加载器  
    │   ├── LoRA加载器  
    │   ├── LoRA加载器(仅模型)  
    │   ├── unCLIPCheckpoint加载器  
    │   ├── VAE加载器  
    │   ├── 超网络加载器  
    │   ├── 放大模型加载器  
    │   ├── 风格模型加载器  
    │   └── 视频模型  
    │       └── Checkpoint加载器(仅图像)  
    ├── 模型微调  
    │   └── UNet  
    │       ├── FreeU_V2模型重加权  
    │       ├── FreeU模型重加权  
    │       ├── PAG注意力引导  
    │       ├── Tome合并模型Token  
    │       ├── 超分块  
    │       └── 收缩模型UNET  
    ├── 实用工具  
    │   ├── Primitive元节点  
    │   ├── 注释  
    │   └── 转接点  
    ├── 条件  
    │   ├── 3D模型  
    │   │   ├── SV3D_条件  
    │   │   ├── SZ123条件  
    │   │   └── SZ123条件(批次)  
    │   ├── CLIP设置停止层  
    │   ├── CLIP视觉编码  
    │   ├── CLIP文本编码器  
    │   ├── ControlNet  
    │   │   ├── ControlNet应用（旧版高级）  
    │   │   ├── ControlNet应用_阿里妈妈局部重绘  
    │   │   └── 设置UnionControlNet类型  
    │   ├── GLIGEN  
    │   │   └── GLIGEN文本框应用  
    │   ├── InstructPix2Pix  
    │   │   └── InstructPixToPix条件  
    │   ├── StableCascade  
    │   │   └── StableCascade_StageB条件  
    │   ├── unCLIP条件  
    │   ├── 按系数设置条件采样区域  
    │   ├── 放大扩散  
    │   │   └── SD4X放大条件  
    │   ├── 风格模型  
    │   │   └── 风格模型应用  
    │   ├── 内补  
    │   │   └── 内补模型条件  
    │   ├── 视频模型  
    │   │   ├── LTXVConditioning  
    │   │   ├── LTXVImgToVideo  
    │   │   └── SVD_图像到视频_条件  
    │   ├── 条件采样区域  
    │   ├── 条件采样区域强度  
    │   ├── 条件合并  
    │   ├── 条件联结  
    │   ├── 条件平均  
    │   └── 条件设置遮罩  
    ├── 图像  
    │   ├── 保存图像  
    │   ├── 变换  
    │   │   └── 图像裁剪  
    │   ├── 动画  
    │   │   ├── 保存APNG  
    │   │   └── 保存WEBP  
    │   ├── 放大  
    │   │   ├── 图像按系数缩放  
    │   │   ├── 图像按像素缩放  
    │   │   ├── 图像缩放  
    │   │   └── 图像通过模型放大  
    │   ├── 后处理  
    │   │   ├── 图像混合  
    │   │   ├── 图像量化  
    │   │   ├── 图像模糊  
    │   │   ├── 图像锐化  
    │   │   └── 图像形态学  
    │   ├── 加载图像  
    │   ├── 空图像  
    │   ├── 批处理  
    │   │   ├── 从批次获取图像  
    │   │   ├── 复制图像批次  
    │   │   └── 重设图像批次  
    │   ├── 图像反转  
    │   ├── 图像遮罩复合  
    │   ├── 图像组合批次  
    │   ├── 外补画板  
    │   ├── 网页镜头捕捉  
    │   ├── 预处理  
    │   │   └── Canny  
    │   └── 预览图像  
    ├── 音频  
    │   ├── 保存音频  
    │   ├── 加载音频  
    │   └── 预览音频  
    └── 遮罩  
        ├── 纯块遮罩  
        ├── 合成  
        │   ├── Porter-Duff图像合成  
        │   ├── 分离图像Alpha  
        │   └── 合并图像Alpha  
        ├── 加载图像遮罩  
        ├── 图像到遮罩  
        ├── 图像颜色到遮罩  
        ├── 遮罩裁剪  
        ├── 遮罩到图像  
        ├── 遮罩反转  
        ├── 遮罩混合  
        ├── 遮罩扩展  
        ├── 遮罩羽化  
        └── 遮罩阈值  

!!!note
    部分节点的说明：  
    [ComfyUI 节点功能详解 | ComfyUI WIKI 速查手册](https://comfyui-wiki.com/zh/comfyui-nodes)  
    [Node Documentation - Salt AI Docs](https://docs.getsalt.ai/md)  
    [Overview page of ComfyUI core nodes - ComfyUI Community Manual](https://blenderneko.github.io/ComfyUI-docs/Core%20Nodes)  
    [T8star1984/Comfyui-Aix-NodeMap: Comfyui's latest node organization and annotation, continuously updated, and supported by the Aix team/comfyui最新节点整理及注释，持续更新，AIX团队](https://github.com/T8star1984/Comfyui-Aix-NodeMap)
