//
//  ArrowView.h
//  ArrowView
//
//  Created by linaicai on 14-5-26.
//  Copyright (c) 2014年 LINAICAI. All rights reserved.
//
typedef void(^clickButton)(UIButton *button);
typedef NS_ENUM(NSInteger, UIArrowViewSytle)
{
    ArrowView_Left = 0,//箭头在左边
    ArrowView_Right = 1,//箭头在右边
    ArrowView_Top = 2,//箭头在顶边
    ArrowView_Bottom = 3,//箭头在底边
};
#import <UIKit/UIKit.h>
@interface ArrowView : UIControl
@property(nonatomic,assign)NSInteger style;
@property(nonatomic,weak)clickButton selectBlock;
- (id)initWithFrame:(CGRect)frame style:(UIArrowViewSytle)style;
- (void)hidArrowView:(BOOL)animated;
- (void)showArrowView:(BOOL)animated;
- (void)dismissArrowView:(BOOL)animated;

- (void)addUIButtonWithTitle:(NSArray *)title;
@end
