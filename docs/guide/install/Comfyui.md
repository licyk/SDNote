---
title: ComfyUI部署
---

## 部署
部署 ComfyUI 可以通过以下途径。

- 整合包部署：[【AI绘画】ComfyUI整合包发布！解压即用 一键启动 工作流版界面 超多节点 ☆更新 ☆汉化 秋叶整合包_哔哩哔哩_bilibili](https://www.bilibili.com/video/BV1Ew411776J)
- 绘世启动器部署：[什么，绘世启动器还能安装ComfyUI（全新篇——安装与配置） - 哔哩哔哩](https://www.bilibili.com/read/cv28869554)
- 从源码部署：[comfyanonymous/ComfyUI - Installing](https://github.com/comfyanonymous/ComfyUI?tab=readme-ov-file#installing)

***

# ComfyUI
这里是有关 ComfyUI 的报错收集。

## 关于 ComfyUI
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

***

## 为 ComfyUI 安装扩展
为 ComfyUI 安装扩展有几种方式。

1. 使用绘世启动器的版本管理：在绘世启动器的`版本管理`->`安装新扩展`，在扩展列表中选择扩展安装或者输入扩展地址进行安装。
2. 使用 [Comfyui-Manager](https://github.com/ltdrdata/ComfyUI-Manager)：在安装 [Comfyui-Manager](https://github.com/ltdrdata/ComfyUI-Manager) 扩展后，使用 ComfyUI-Manger 的扩展安装功能安装扩展。
3. 使用 Git 命令：在 ComfyUI/custom_nodes 目录下使用`git clone 扩展地址`命令安装。
4. 手动从 Github 下载压缩包：在 Github 扩展项目中下载扩展的压缩包并解压到 ComfyUI/custom_nodes 目录中。（极不推荐！！！！！！）

在安装和使用扩展前，请仔细阅读扩展作者的说明文档，并按照扩展作者的说明进行操作！！！

***