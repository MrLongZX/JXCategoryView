//
//  JXCategoryView.h
//  UI系列测试
//
//  Created by jiaxin on 2018/3/15.
//  Copyright © 2018年 jiaxin. All rights reserved.
//

#import "JXCategoryIndicatorView.h"
#import "JXCategoryTitleCell.h"
#import "JXCategoryTitleCellModel.h"

// 主要内容：
// 初始化title类型的标题颜色、字体大小、label缩放等数据
// 创建数据模型 初始化标题模型数据
// 用户点击item更新数据，滑动contentScrollView处理标题label相关内容
@interface JXCategoryTitleView : JXCategoryIndicatorView

@property (nonatomic, strong) NSArray <NSString *>*titles;

@property (nonatomic, strong) UIColor *titleColor;      //默认：[UIColor blackColor]

@property (nonatomic, strong) UIColor *titleSelectedColor;      //默认：[UIColor redColor]

@property (nonatomic, strong) UIFont *titleFont;    //默认：[UIFont systemFontOfSize:15]

@property (nonatomic, assign) BOOL titleColorGradientEnabled;   //默认：NO，title的颜色是否渐变过渡

@property (nonatomic, assign) BOOL titleLabelMaskEnabled;   //默认：NO，titleLabel是否遮罩过滤。（需要backgroundEllipseLayerShowEnabled = YES）

//----------------------titleLabelZoomEnabled-----------------------//
@property (nonatomic, assign) BOOL titleLabelZoomEnabled;     //默认为NO

@property (nonatomic, assign) BOOL titleLabelZoomScrollGradientEnabled;     //手势滚动中，是否需要更新状态。默认为YES

@property (nonatomic, assign) CGFloat titleLabelZoomScale;    //默认1.2，titleLabelZoomEnabled为YES才生效

@end
