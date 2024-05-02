---
title: 画师提示词应用
---
# 画师提示词应用
在 SDXL 模型中，模型的泛化能力大大的增强，仅靠提示词就可以实现比 SD 1.5 模型更多的效果。在基于 SDXL 的 [NovelAI 3](https://novelai.net) 中，就可以通过画师提示词来调整画面的画风，当然在开源社区中有一些模型也能通过画师提示词来调整画风，比如 [Animagine XL 3](https://huggingface.co/cagliostrolab/animagine-xl-3.0)，[Kohaku XL Epsilon](https://huggingface.co/KBlueLeaf/Kohaku-XL-Epsilon)。


## 画师提示词来源
画师的名字有中文 / 英文 / 日文等，但 在 Stable Diffusion 中只认英文的提示词，所以需要寻找对应的英文提示词。在模型的介绍页可能会说明支持的一些画师提示词，比如 [Kohaku XL Epsilon](https://huggingface.co/KBlueLeaf/Kohaku-XL-Epsilon)，或者去数据集来源站点，如 [Danbooru](https://danbooru.donmai.us) 来寻找。

!!!note
    其实有支持中文或者日文的 SDXL 模型，[华为](https://www.huawei.com)出了支持中文提示词的 [SDXL](https://pangu-draw.github.io) 模型，[Stability AI](https://stability.ai) 出了支持日文提示词的 [SDXL](https://huggingface.co/stabilityai/japanese-stable-diffusion-xl) 模型。


## 怎么用
请确保 SD WebUI 的版本大于 1.5 以支持 SDXL 模型，现在使用 Animagine XL 3.0 模型进行演示。

|模型（点击即可下载）|放置路径|
|---|---|
|[Animagine XL 3.0](https://modelscope.cn/api/v1/models/licyks/sd-model/repo?Revision=master&FilePath=sdxl_1.0%2Fanimagine-xl-3.0.safetensors)|stable-diffusion-webui/models/Stable-diffusion|
|[sdxl_fp16_fix_vae](https://modelscope.cn/api/v1/models/licyks/sd-vae/repo?Revision=master&FilePath=sdxl_1.0%2Fsdxl_fp16_fix_vae.safetensors)|stable-diffusion-webui/models/VAE|
|[vaeapprox-sdxl](https://modelscope.cn/api/v1/models/licyks/sd-vae/repo?Revision=master&FilePath=vae-approx%2Fvaeapprox-sdxl.pt)|stable-diffusion-webui/models/VAE-approx|
|[model](https://modelscope.cn/api/v1/models/licyks/sd-vae/repo?Revision=master&FilePath=vae-approx%2Fmodel.pt)|stable-diffusion-webui/models/VAE-approx|

这里先尝试不用画师提示词的写法。
```
1girl,animal ears,animal ear fluff,cat ears,pink hair,short hair,bangs,blush,closed mouth,light smile,purple eyes,hair between eyes,white hoodie,flat chest,
looking at viewer,under the tree,hand on own chest,fist,
landscape,grass,flower,blue sky,cirrocumulus,moody lighting,sunlight,day,building,house,path,wind,cherry blossoms tree,falling petals,
close-up,upper body,from side,
```

![origin_prompt](../../assets/images/guide/prompt/origin_prompt.jpg)

加上风格提示词。

- watercolor,pastel color
```
watercolor,pastel color, 
1girl,animal ears,animal ear fluff,cat ears,pink hair,short hair,bangs,blush,closed mouth,light smile,purple eyes,hair between eyes,white hoodie,flat chest,
looking at viewer,under the tree,hand on own chest,fist,
landscape,grass,flower,blue sky,cirrocumulus,moody lighting,sunlight,day,building,house,path,wind,cherry blossoms tree,falling petals,
close-up,upper body,from side,
```

![watercolor,pastel_color](../../assets/images/guide/prompt/watercolor,pastel_color.jpg)

- monochrome
```
monochrome, 
1girl,animal ears,animal ear fluff,cat ears,pink hair,short hair,bangs,blush,closed mouth,light smile,purple eyes,hair between eyes,white hoodie,flat chest,
looking at viewer,under the tree,hand on own chest,fist,
landscape,grass,flower,blue sky,cirrocumulus,moody lighting,sunlight,day,building,house,path,wind,cherry blossoms tree,falling petals,
close-up,upper body,from side,
```

![monochrome](../../assets/images/guide/prompt/monochrome.jpg)

- chibi,deformed,watercolor
```
chibi,deformed,watercolor,
1girl,animal ears,animal ear fluff,cat ears,pink hair,short hair,bangs,blush,closed mouth,light smile,purple eyes,hair between eyes,white hoodie,flat chest,
looking at viewer,under the tree,hand on own chest,fist,
landscape,grass,flower,blue sky,cirrocumulus,moody lighting,sunlight,day,building,house,path,wind,cherry blossoms tree,falling petals,
close-up,upper body,from side,
```

![chibi,deformed,watercolor](../../assets/images/guide/prompt/chibi,deformed,watercolor.jpg)

现在把风格提示词换成画师提示词。

- weri
```
weri,
1girl,animal ears,animal ear fluff,cat ears,pink hair,short hair,bangs,blush,closed mouth,light smile,purple eyes,hair between eyes,white hoodie,flat chest,
looking at viewer,under the tree,hand on own chest,fist,
landscape,grass,flower,blue sky,cirrocumulus,moody lighting,sunlight,day,building,house,path,wind,cherry blossoms tree,falling petals,
close-up,upper body,from side,
```

![weri](../../assets/images/guide/prompt/weri.jpg)

- maccha \(mochancc\)
```
maccha \(mochancc\),
1girl,animal ears,animal ear fluff,cat ears,pink hair,short hair,bangs,blush,closed mouth,light smile,purple eyes,hair between eyes,white hoodie,flat chest,
looking at viewer,under the tree,hand on own chest,fist,
landscape,grass,flower,blue sky,cirrocumulus,moody lighting,sunlight,day,building,house,path,wind,cherry blossoms tree,falling petals,
close-up,upper body,from side,
```

![maccha_mochancc](../../assets/images/guide/prompt/maccha_mochancc.jpg)

多个画师提示词进行组合。

- ciloranko,maccha \(mochancc\),quan \(kurisu tina\)
```
ciloranko,maccha \(mochancc\),quan \(kurisu tina\),
1girl,animal ears,animal ear fluff,cat ears,pink hair,short hair,bangs,blush,closed mouth,light smile,purple eyes,hair between eyes,white hoodie,flat chest,
looking at viewer,under the tree,hand on own chest,fist,
landscape,grass,flower,blue sky,cirrocumulus,moody lighting,sunlight,day,building,house,path,wind,cherry blossoms tree,falling petals,
close-up,upper body,from side,
```

![ciloranko,maccha_mochancc,quan_kurisu_tina](../../assets/images/guide/prompt/ciloranko,maccha_mochancc,quan_kurisu_tina.jpg)

- quansarcake,hxxg,chiaroscuro,atdan
```
quansarcake,hxxg,chiaroscuro,atdan,
1girl,animal ears,animal ear fluff,cat ears,pink hair,short hair,bangs,blush,closed mouth,light smile,purple eyes,hair between eyes,white hoodie,flat chest,
looking at viewer,under the tree,hand on own chest,fist,
landscape,grass,flower,blue sky,cirrocumulus,moody lighting,sunlight,day,building,house,path,wind,cherry blossoms tree,falling petals,
close-up,upper body,from side,
```

![quansarcake,hxxg,chiaroscuro,atdan](../../assets/images/guide/prompt/quansarcake,hxxg,chiaroscuro,atdan.jpg)

风格提示词加上画师提示词。

- meme,chibi,jazz_jack,xinzoruo
```
meme,chibi,jazz_jack,xinzoruo,
1girl,animal ears,animal ear fluff,cat ears,pink hair,short hair,bangs,blush,closed mouth,light smile,purple eyes,hair between eyes,white hoodie,flat chest,
looking at viewer,under the tree,hand on own chest,fist,
landscape,grass,flower,blue sky,cirrocumulus,moody lighting,sunlight,day,building,house,path,wind,cherry blossoms tree,falling petals,
close-up,upper body,from side,
```

![meme,chibi,jazz_jack,xinzoruo](../../assets/images/guide/prompt/meme,chibi,jazz_jack,xinzoruo.jpg)

通过组合不同的画师提示词就可以达到画出不同画风的图片，并且可以适当加上风格提示词。