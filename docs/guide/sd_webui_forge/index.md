# 概述
Stable Diffusion WebUI Forge 基于 Stable Diffusion WebUI 开发，界面和 Stable Diffusion WebUI 基本一致，并更换了推理后端，拥有更好的显存优化，并且在某些显卡上速度出图速度比 Stable Diffusion WebUI 更快。

早期的 Stable Diffusion WebUI Forge 使用 Stable Diffusion WebUI 的前端和 ComfyUI 后端，借助 ComfyUI 后端得到了更好的显存优化，在之后的版本更新中，前端使用的 Gradio 框架更新到 Gradio 4，操作有了更好的优化，后端进行了重构，相对之前的版本优化更好一些。

由于 Stable Diffusion WebUI Forge 使用了 Gradio 4 和新的推理后端，Stable Diffusion WebUI 中的一些插件并不能在 Stable Diffusion WebUI Forge 上正常运行，需要自行测试。

!!!note
    部分在 Stable Diffusion WebUI Forge 中插件列表可在下面的链接查看。  
    1. [Forge Extension List and Extension Replacement List (Temporary) · lllyasviel/stable-diffusion-webui-forge · Discussion #1754](https://github.com/lllyasviel/stable-diffusion-webui-forge/discussions/1754)  
    2. [List of extensions NOT working after Forge/Gradio update · lllyasviel/stable-diffusion-webui-forge · Discussion #888](https://github.com/lllyasviel/stable-diffusion-webui-forge/discussions/888)

Stable Diffusion WebUI Forge 在使用上和 Stable Diffusion WebUI 区别不是很大，只有部分功能有差别，可以结合 Stable Diffusion WebUI 的教程学习使用 Stable Diffusion WebUI Forge。下面就开始简单介绍 Stable Diffusion WebUI Forge 的使用。