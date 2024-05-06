## ControlNet Tile 放大
ControlNet Tile 模型可以保证图片的一致性，同时也可以用于增加图片的细节，所以可以作为图片放大的方法。

!!!note
    使用 ControlNet 扩展需要安装 sd-webui-controlnet 扩展：https://github.com/Mikubill/sd-webui-controlnet

使用时在 ControlNet 选项卡中启用一个 ControlNet 单元，控制类型选择 Tile/Blur(分块/模糊)，预处理器选择 tile_resample，模型选择 control_v11f1e_sd15_tile_fp16。

!!!note
    使用 ControlNet Tile 前需要下载 [control_v11f1e_sd15_tile_fp16](https://modelscope.cn/api/v1/models/licyks/controlnet_v1.1/repo?Revision=master&FilePath=control_v11f1e_sd15_tile_fp16.safetensors)，并将模型放到 stable-diffusion-webui/models/ControlNet 路径里

![controlnet_tile](../../assets/images/guide/upscale/controlnet_tile.jpg)

再将重绘幅度调整到 0.4~0.7 之间的值（推荐0.5），点击生成就可以进行放大了。