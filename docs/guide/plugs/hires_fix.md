## 高分辨率修复
这个功能仅在文生图界面中可以看到，因为高分辨率修复的本质为图生图，所以在图生图界面是看不到这个功能的。

![hires_fix](../../assets/images/guide/plugs/hires_fix.jpg)

启用后一般只用调整`放大算法`、`重绘幅度`、`放大倍数`这三个选项。

放大倍数决定了放大之后图片的分辨率，但该值越高，需要的显存越多，所以建议启用 Tiled VAE 来降低显存的占用，降低爆显存的概率。

!!!note
    TIled VAE 由 multidiffusion-upscaler-for-automatic1111 扩展提供：https://github.com/pkuliyi2015/multidiffusion-upscaler-for-automatic1111

放大算法和重绘幅度的选择可以参考下面的表格：

|放大算法|重绘幅度|放大模型文件存放路径|
|---|---|---|
|Latent|> 0.55|无需下载|
|[SwinIR_4x](https://modelscope.cn/api/v1/models/licyks/sd-upscaler-models/repo?Revision=master&FilePath=SwinIR%2FSwinIR_4x.pth)|0.2~0.4|stable-diffusion-webui/models/SwinIR|
|[R-ESRGAN 4x+](https://modelscope.cn/api/v1/models/licyks/sd-upscaler-models/repo?Revision=master&FilePath=RealESRGAN%2FRealESRGAN_x4plus.pth)|0.2~0.4|stable-diffusion-webui/models/RealESRGAN|
|[R-ESRGAN 4x+ Anime6B](https://modelscope.cn/api/v1/models/licyks/sd-upscaler-models/repo?Revision=master&FilePath=RealESRGAN%2FRealESRGAN_x4plus_anime_6B.pth)|0.2~0.4|stable-diffusion-webui/models/RealESRGAN|
|[4x_NMKD-Superscale-SP_178000_G](https://modelscope.cn/api/v1/models/licyks/sd-upscaler-models/repo?Revision=master&FilePath=ESRGAN%2F4x_NMKD-Superscale-SP_178000_G.pth)|0.2~0.4|stable-diffusion-webui/models/ESRGAN|
|[DAT_x4](https://modelscope.cn/api/v1/models/licyks/sd-upscaler-models/repo?Revision=master&FilePath=DAT%2FDAT_x4.pth)|0.2~0.4|stable-diffusion-webui/models/DAT|

不过这个方法有也有局限性，因为直接文生图出来的图并不一定达到自己想要的效果，需要使用图生图里的局部重绘来修改图片，这时候放大就没太大意义，不过只是单纯的文生图抽卡可以忽略。

!!!note
    个人觉得图片放大这个步骤应该放在制作图片的最后一个阶段，因为用高分辨率的图片来进行重绘会占用大量的显存，这时又不得不缩小图片的分辨率，所以显得这么早就放大就没有太大意义。当然你可以启用 Tiled VAE 来降低显存占用，只不过高分辨率图片的重绘会比低分辨率图片的重绘慢很多。
