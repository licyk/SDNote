# 杂项
这里列出 InvokeAI 的其他功能。


## 参数提示
InvokeAI 界面中许多参数包含功能解释，将鼠标移到参数上将自动显示。

该功能需要手动开启，在 InvokeAI 左下角进入设置，并将**启用信息弹出**选项启用。


## InvokeAI 数据文件夹中不同文件夹的作用
在 InvokeAI 启动时，控制台日志将显示`Root directory`的信息，该信息为 InvokeAI 数据文件夹的路径。

|文件夹|作用|
|---|---|
|cache|InvokeAI 的缓存文件夹|
|configs|一些模型的配置文件|
|databases|InvokeAI 的数据库|
|invokeai.example.yaml|InvokeAI 的配置文件示例
|invokeai.yaml|InvokeAI 的配置文件|
|models|模型文件夹|
|nodes|InvokeAI 节点存放路径|
|outputs|生成的图片保存位置|


## 设置 InvokeAI 配置文件
在 InvokeAI 数据文件夹路径下，可以看到`invokeai.yaml`配置文件，如果需要修改，请参考`invokeai.example.yaml`文件内的示例，或者参考 [Configuration - InvokeAI Documentation](https://invoke-ai.github.io/InvokeAI/configuration) 进行设置。

如果因为修改`invokeai.yaml`后导致 InvokeAI 的功能异常，请将该文件删除来重置 InvokeAI 配置。

!!!note
    在大多数情况下并不需要修改该配置文件，因为 InvokeAI 会自动选择最佳的配置。
