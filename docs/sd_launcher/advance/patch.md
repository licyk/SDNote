# 补丁管理
用于管理绘世启动器的热补丁。

![patch](../../assets/images/sd_launcher/patch/patch.jpg)

这里包含了修复某个问题的补丁以解决某个问题，同时也有一些特性补丁可供选择。

比如 AUTOMATIC/stable-diffusion-webui/#14855 低显存模型模型流式加载，这个补丁可大大提升 4 GB 显存显卡的出图速度。

!!!note
	您只需要勾选对您有用的补丁。

!!!note
	绘世启动器的补丁文件位于启动器的`.launcher`目录，可以看到类似`pyinterop.hfkx1kkk0g4q7.zip`这样的文件，并且被添加到`PYTHONPATH`环境变量中，补丁如何实现的可自行研究。
