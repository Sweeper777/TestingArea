ArrowView
===========
###Info | 简介

自定义箭头弹出窗口，代码简单，逻辑清晰，修改和添加按钮方便，暂只支持block回调，你可以自己添加代理回调，欢迎提出你宝贵的意见。
****
<img src="./screenshot.gif" />


###Userage | 使用说明

1.导入头文件

	#import "ArrowView.h"



2.初始化


	 self.view=[[ArrowView alloc]initWithFrame:CGRectMake(10, 400, 300, 80) style:ArrowView_Right];
    [self.view setBackgroundColor:[UIColor clearColor]];
    [self.view addUIButtonWithTitle:[NSArray arrayWithObjects:@"播放",@"下载",@"点赞",@"吐槽", nil]];
    [self.window addSubview:self.view];
                         
3.设置block回调


       [self.view setSelectBlock:^(UIButton *button){
        NSLog(@"tag=%ld",button.tag);
    }];
        
        
****
###License | 许可
This code is distributed under the terms of the MIT License (MIT).
代码使用 MIT License (MIT) 许可发布.

The original author, NAICAI LI, reserves the right to change the license.
原作者 NAICAI LI 保留更改此许可的权力.
****
###Donate | 捐赠
	
[Alipay | 支付宝](https://me.alipay.com/linaicai)











