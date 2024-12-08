---
title: FLUX 模型使用
---
# 概述
SD WebUI Forge 已经支持使用 FLUX 模型，下面就简单介绍 FLUX 模型如何使用。

## 模型选择
FLUX 模型因为体积很大，所以模型的 CLIP，Unet，VAE 组件被拆分出来，所以在 SD WebUI Forge 顶部选择 FLUX 时需要分别选上这些组件，只有少数 FLUX 模型将 CLIP，Unet，VAE 组件打包在一起。

如果 FLUX 模型的组件是拆分的，需要这样选择：

![select_flux_gguf_model](../../assets/images/guide/sd_webui_forge/select_flux_gguf_model.png)

!!!note
    flux1-dev-Q4_K_S 下载：[flux1-dev-Q4_K_S.gguf](https://modelscope.cn/models/licyks/flux-model/resolve/master/flux_1/flux1-dev-Q4_K_S.gguf)。  
    t5-v1_1-xxl-encoder-Q5_K_M 下载：[t5-v1_1-xxl-encoder-Q5_K_M.gguf](https://modelscope.cn/models/licyks/flux-model/resolve/master/flux_text_encoders/t5-v1_1-xxl-encoder-Q5_K_M.gguf)。  
    clip_l 下载：[clip_l.safetensors](https://modelscope.cn/models/licyks/flux-model/resolve/master/flux_text_encoders/clip_l.safetensors)。  
    ae 下载：[ae.safetensors](https://modelscope.cn/models/licyks/flux-model/resolve/master/flux_vae/ae.safetensors)。  
    flux1-dev-Q4_K_S 属于 UNet 组件，放在`stable-duffision-webui-forge/models/Stable-diffusion`中。  
    t5-v1_1-xxl-encoder-Q5_K_M、clip_l 属于 CLIP，放在`stable-duffision-webui-forge/models/text_encoder`中。  
    ae 属于 VAE，放在`stable-duffision-webui-forge/models/VAE`中。


如果 FLUX 模型未被拆分，可以这样选择：

![select_flux_fp8_model](../../assets/images/guide/sd_webui_forge/select_flux_fp8_model.png)

![select_flux_fp8_model_and_t5_fp16_model](../../assets/images/guide/sd_webui_forge/select_flux_fp8_model_and_t5_fp16_model.png)

!!!note
    flux1-dev-fp8 下载：[flux1-dev-fp8.safetensors](https://modelscope.cn/models/licyks/flux-model/resolve/master/flux_1/flux1-dev-fp8.safetensors)。  
    t5xxl_fp16 下载：[t5xxl_fp16.safetensors](https://modelscope.cn/models/licyks/flux-model/resolve/master/flux_text_encoders/t5xxl_fp16.safetensors)。  
    flux1-dev-fp8 属于完整模型，放在`stable-duffision-webui-forge/models/Stable-diffusion`中。  
    t5xxl_fp16 属于 CLIP，放在`stable-duffision-webui-forge/models/text_encoder`中。

因为 FLUX 模型的巨大体积，显存大小的要求被大大提高，但是通过模型量化技术，可以大大降低模型体积，降低了显存大小要求。常见的 gguf 格式的模型就是量化模型。

!!!note
    关于 FLUX 完整版模型，量化模型的说明：[Flux Tutorial 2 (Seperated Full Models, GGUF, Technically Correct Comparison between GGUF and NF4, etc)](https://github.com/lllyasviel/stable-diffusion-webui-forge/discussions/1050)。

## 使用
在 SD WebUI Forge 顶部的 UI 选项选择 flux，SD WebUI Forge 将会自动选择针对 FLUX 模型的最佳配置，或者 UI 选择全部，手动调整参数也可以。

现在调整一下生图参数，使用 flux1-dev-Q4_K_S.gguf、t5-v1_1-xxl-encoder-Q5_K_M.gguf、clip_l.safetensors、ae.safetensors 模型，以下为我为 FLUX 模型设置的参数。

|选项|值|
|---|---|
|采样方法|Euler|
|调度类型|Simple|
|迭代步数|20|
|宽度|1008|
|高度|1344|
|Distilled CFG Scale|3.5|
|提示词引导系数|1|

FLUX 模型只能设置提示词引导系数为 1，设置为 1 后，反向提示词将不可用，但通常 FLUX 并不需要反向提示词。

FLUX 既可以使用提示词进行画面描述，也可以使用自然语言进行描述，或者使用提示词 + 自然语言进行描述。

|组合|提示词|效果图|
|---|---|---|
|提示词|1girl,solo,very long hair,green hair,ahoge,bangs,hair ornament,four-leaf clover hair ornament,shirt,braid,brown eyes,long sleeves,jacket,white shirt,bow,dress shirt,open clothes,sleeves past wrists,necktie,collared shirt,hood,open jacket,black necktie,hooded jacket,brown jacket,hood down,plaid skirt,pleated skirt,skirt,brown skirt,plaid,<br/>sitting on bench,head tilt,light smile,hand on own chin,index finger raised,hand up,one eye closed,closed mouth,arm between legs,<br/>outdoors,park,tree,landscape,river,bench,night,night sky,starry sky,flower,butterfly,fireflies,<br/>front view,upper body,|![use_flux_with_tags](../../assets/images/guide/sd_webui_forge/use_flux_with_tags.png)|
|自然语言|An illustration of a girl with long green hair with bangs, braid and ahoge, and four-leaf clover as hair ornament. She has brown eyes with light smile and looking at viewer. She wears white shirt with black necktie and open jacket. The jacket is brown with hood. She is wears pleated plaid brown skirt. She is sitting on bench, a hand put on own chin and index finger is raise, closing one eye and head is tilting, the other hand is between legs. The environment is in the park at night, the night sky has some star. Some flower, butterfly and firefly near the girl. Upper body and frontal camera|![use_flux_with_natural_language](../../assets/images/guide/sd_webui_forge/use_flux_with_natural_language.png)|
|提示词 + 自然语言|1girl,solo,very long hair,green hair,ahoge,bangs,hair ornament,four-leaf clover hair ornament,shirt,braid,brown eyes,long sleeves,jacket,white shirt,bow,dress shirt,open clothes,sleeves past wrists,necktie,collared shirt,hood,open jacket,black necktie,hooded jacket,brown jacket,hood down,plaid skirt,pleated skirt,skirt,brown skirt,plaid,<br/><br/>An illustration of a girl with light smile and looking at viewer. She is sitting on bench,a hand put on own chin and index finger is raise,closing one eye and head is tilting,the other hand is between legs. The environment is in the park at night,the night sky has some star. Some flower,butterfly and firefly near the girl. Upper body and frontal camera,|![use_flux_with_tags_and_natural_language](../../assets/images/guide/sd_webui_forge/use_flux_with_tags_and_natural_language.png)|