## Tiled Diffusion 放大
multidiffusion-upscaler-for-automatic1111 扩展提供了 Tiled Diffusion 功能用于图片放大，不过该功能必须搭配 Tiled VAE 一起使用。下面为 Tiled Diffusion 的设置界面。

![tiled_diffusion_interface](../../assets/images/guide/upscale/tiled_diffusion_interface.jpg)

使用 Tiled Diffusion 进行图片放大时，勾选 Tiled Diffusion 选项，设置参数可以照抄下面的

- 方案：Mixture of Diffusers
- 潜空间分块宽度:128
- 潜空间分块高度:128
- 潜空间分块重叠:16
- 潜空间分块单批数量:8
- 放大算法：R-ESRGAN 4x+ Anime6B

正面提示词建议删去具体描述的部分（如人物，场景），减少放大后图片出现鬼影的概率。重绘幅度调至 0.2~0.4（推荐0.4），并启用 TIled VAE，调整好后就可以点击生成进行图片放大了。

如果想要放大后获得比较干净的画面，可以勾选 Tiled Diffusion 选项卡下方的噪声反转。

!!!note
    噪声反转会导致一些笔触被破坏，比如你的图片是厚涂风格的，放大时启用噪声反转后，图片那些涂抹风格就会被抹干净。

!!!note
    multidiffusion-upscaler-for-automatic1111 扩展关于图片放大的具体说明：https://github.com/pkuliyi2015/multidiffusion-upscaler-for-automatic1111/wiki/%E5%88%86%E7%89%87%E6%89%A9%E6%95%A3