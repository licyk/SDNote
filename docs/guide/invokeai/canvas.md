# 统一画布
InvokeAI 的统一画布拥有一个用于绘画的画布，并且包含一个强大的控制层，将 ControlNet、IP Adapter、分区提示词结合起来，和画布共同使用，使创作变得更加简单，下面将介绍 InvokeAI 统一画布的使用。

在使用之前，需要将 **Invoke** 按钮右侧的保存图片方式改为**发送到画布**。

!!!note
    1. 因为 InvokeAI 并没有像 Stable Diffusion WebUI / ComfyUI 那样的显存优化，作者所使用的 RTX 4060 Laptop 8G 无法在 InvokeAI 上运行 Stable Diffusion XL 的 ControlNet / IP Adapter，所以本篇讲解到涉及 ControlNet / IP Adapter 的操作时将使用 Stable Diffusion 1.5 的版本代替 Stable Diffusion XL 的版本。  
    2. InvokeAI 许多功能使用按钮代替，如果不知道该按钮代表的功能，可以将鼠标移动到按钮上将显示按钮缩代表的功能名称。（善用 InvokeAI 的提示功能）


## 画布
在统一画布的中间部分为画布，左侧为生成参数的调整面板，右侧为图层和图库。

![canvas](../../assets/images/guide/invokeai/canvas/canvas.png)

左侧和右侧面板可以隐藏，可以按住面板之间的间隔处将左 / 右侧面板隐藏起来，或者按下 T / G 键将左 / 右侧面板隐藏，为画布腾出空间。

![hidden_config_panel_and_layers_panel](../../assets/images/guide/invokeai/canvas/hidden_config_panel_and_layers_panel.png)

在画布的左上角可以调整画笔的颜色、透明度和大小。

![canvas_bursh_color_config](../../assets/images/guide/invokeai/canvas/canvas_bursh_color_config.png)

因为此时画布中并没有一个栅格层（在 PhotoShop 中为图层），所以无法使用画笔在画布中进行绘制。这时可以在右侧的图层面板创建一个空的栅格层，或者从**画廊**中选择一张图片，右键打开菜单，选择**从图像创建新画布 -> As 栅格层**，此时图片将发送到画布中。

在图层面板的**栅格图层**选择该图片后，此时就可以在新建的栅格层进行绘画。

![use_brush_to_painting](../../assets/images/guide/invokeai/canvas/use_brush_to_painting.png)

画布顶部工具栏的两个 🔍︎ 按钮可以放大和缩小画布，或者可以使用鼠标滚轮进行画布的缩放。⛶（使图层适应画布）可以将画布缩放到合适屏幕的大小。⬜︎（将边界框适配到涂层）可以将用于进行 AI 生成的边界框框住所有的栅格层。当图片修改得差不多后，想把图片保存到图库中，可以点击 💾（将画布保存到图库）按钮。如果需要撤销 / 重做对画布内容的修改，可以点击 ↩︎（撤销）/ ↪︎（重做）按钮，或者使用 Ctrl + Z / Ctrl + Shift + Z 快捷键。

在画布的左侧设置了鼠标在画布中的功能，从上到下对应的功能如下。

|功能|作用|对应的快捷键|
|---|---|---|
|刷子|使用画笔在画布中进行绘制。|B|
|橡皮|擦除画布中的内容|E|
|绘制方形|用于快速在画布中绘制方形色块。|U|
|移动模式|进入移动模式，可以移动画布中被选中的元素，如栅格图层中的某个图层或者修复遮罩中某个遮罩。|V|
|浏览模式|进入浏览模式，使用鼠标可以拖动画布的位置。|H / 按住 Space|
|边界框调整|调整边界框的位置，在 AI 进行生成时，将以边界框为界限进行生成。|C|
|吸色笔|吸取画布中某处的颜色并应用到画笔。|I / 按住 Alt|
|开关左侧参数栏|打开 / 关闭左侧的参数栏。|T|
|生成|点击后进行图片生成。|Ctrl + Enter|
|取消当前生成的项目|取消当前正在进行的生图任务。|无|
|清空所有生成项目|取消所有的生图任务。|无|

在右侧的图层选中某一层后，右键画布可以看到处理该层的功能。

## 图层
在统一画布的右侧为图层，图层的选择和 PhotoShop 的图层选择类似，选中其中一层后可以在画布中编辑该层的内容。

![layers](../../assets/images/guide/invokeai/canvas/layers.png)

图层分为以下几种。


### 全局参考图像
该图层基于 IP Adapter，使用 IP Adapter 的功能对图像生成的画风和元素特征进行画风迁移。

IP Adapter 需要一张图片进行画风迁移，在添加**全局参考图像**图层后，点击 **Upload an image** 可以打开系统的文件管理器用于上传图片。或者从**画廊**的素材中拖动一张图片到画布中，此时 InvokeAI 将提示要发送图片到哪种图层，拖到 **New Global Reference Image**后将自动创建一个新的**全局参考图像**图层并将该图片导入该图层。

![send_image_to_new_global_reference](../../assets/images/guide/invokeai/canvas/send_image_to_new_global_reference.png)


### 修复遮罩
该图层用于设置重绘的区域，选中该层后，可以在画布中绘制用于局部重绘的遮罩，在进行生成时将对遮罩部分的内容进行重绘。

![use_inpaint_mask](../../assets/images/guide/invokeai/canvas/use_inpaint_mask.png)

如果需要设置遮罩部分的重绘幅度，可以在图层顶上的**去噪强度**选项设置。该值越高，遮罩部分的变化越大。


### 区域导向
这是用于设置分区提示词，对图片的不同部分设置不同的提示词，可以很好解决在全局提示词中无法准确描述各部分的元素导致元素污染的问题，并且该功能可以使 AI 绘制多人图变得简单。

在创建**区域导向**后，可以使用画笔绘制该部分提示词对应的区域。

![use_regional_prompt](../../assets/images/guide/invokeai/canvas/use_regional_prompt.png)


### 局部参考图像
**局部参考图像**和**全局参考图像**功能类似，都基于 IP Adapter 进行画风迁移，但是该功能仅针对区域进行画风迁移，可控性更高。

在添加**局部参考图像**图层后，点击 **Upload an image** 可以打开系统的文件管理器用于上传图片。或者从**画廊**的素材中拖动一张图片到画布中，此时 InvokeAI 将提示要发送图片到哪种图层，拖到 **New Regional Reference Image**后将自动创建一个新的**局部参考图像**图层并将该图片导入该图层。

![send_image_to_new_region_reference](../../assets/images/guide/invokeai/canvas/send_image_to_new_region_reference.png)

导入图像后，选中该图层，并使用画笔在画布中绘制该图层的蒙版，在生成的时候蒙版部分的内容将进行画风迁移。

![use_regional_reference_mask](../../assets/images/guide/invokeai/canvas/use_regional_reference_mask.png)


### 控制层
该层的功能基于 ControlNet，ControlNet 可以通过图像作为控制条件，和提示词一起控制图像的生成。

在添加**控制层**图层后，点击 **Upload an image** 可以打开系统的文件管理器用于上传图片。或者从**画廊**的素材中拖动一张图片到画布中，此时 InvokeAI 将提示要发送图片到哪种图层，拖到 **New Regional Reference Image**后将自动创建一个新的**控制层**图层并将该图片导入该图层。

![send_image_to_new_control_layer](../../assets/images/guide/invokeai/canvas/send_image_to_new_control_layer.png)

创建一个控制层后，选择其中一个 ControlNet 模型，此时 InvokeAI 将根据选择的 ControlNet 模型的类型使用对应的 ControlNet 预处理器，对导入控制层的图片进行预处理。

![use_controlnet_preprocess_to_process_image](../../assets/images/guide/invokeai/canvas/use_controlnet_preprocess_to_process_image.png)

在下方的选择可以点击 **Advanced** 调整更多的预处理图片的参数，调整完成后点击 **Apply** 应用预处理结果，此时将使用处理后的图片作为控制层的控制条件。

![configure_advance_preprocess](../../assets/images/guide/invokeai/canvas/configure_advance_preprocess.png)

借助画布功能，可以对预处理后的图片再次进行编辑。

编辑完成后需要调整边界框的大小，按下 C 键进入边界框调整模式，将边界框包含在控制图片内。或者调整控制图片的大小，右键该图片，选择 **Transfrom** 进入缩放模式，将控制图片调整到在边界框内。

![edit_controlnet_image_resize_bbox](../../assets/images/guide/invokeai/canvas/edit_controlnet_image_resize_bbox.png)

下面是 InvokeAI 支持的 ControlNet 类型和对应的预处理器。

|ControlNet 类型|对应的预处理器|
|---|---|
|Canny|Canny Edge Detection|
|Inpaint|无|
|MLSD|Line Segment Detection|
|Depth|Depth Anything|
|NormalMap|Normal Map|
|Segmentation|无|
|Lineart|Lineart Edge Detection|
|Lineart Anime|Lineart Anime Edge Detection|
|OpenPose|DW Openpose Detection|
|Scribble|Lineart Edge Detection|
|SoftEdge|HED Edge Detection|
|Shuffle|Content Shuffle|
|Tile|无|
|QRCode|无|


### 栅格层
这个就是 PhotoShop 中的图层了，当有不同的**栅格层**时可以选择其中一个**栅格层**进行修改，并且不会影响另一个**栅格层**。

可以创建一个空白的**栅格层**进行绘制，也可以从**画廊**的素材中拖动一张图片到画布中，此时 InvokeAI 将提示要发送图片到哪种图层，拖到 **New Raster Layer**后将使用该图片创建一个新的**栅格层**。

![send_image_to_new_raster_layer](../../assets/images/guide/invokeai/canvas/send_image_to_new_raster_layer.png)


## 统一画布应用
统一画布中大致的功能已经介绍了，下面将使用统一画布进行创作。
