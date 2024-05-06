## Ultimate SD upscale
ultimate-upscale-for-automatic1111 扩展提供的放大方案将图片分块后放大，再将这些分块合成一张大图，可在低显存的情况下放大图片。

!!!note
    ultimate-upscale-for-automatic1111 扩展下载：https://github.com/Coyote-A/ultimate-upscale-for-automatic1111

使用时在 SD WebUI 的脚本中选择 Ultimate SD upscale，参数可按照下面给的来调整。

- Target size type：From img2img2 settings
- 放大算法：R-ESRGAN 4x+ Anime6B
- 类型：Linear
- 分块宽度：768
- 分块高度：768
- 蒙版边缘模糊度：24
- Padding：32

![ultimate_sd_upscale](../../assets/images/guide/plugs/ultimate_sd_upscale.jpg)

再将重绘幅度调至 0.2~0.4之间的值（推荐 0.4），重绘尺寸倍数设置好尺度，就可以进行图片放大了。