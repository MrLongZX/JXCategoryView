//
//  JXCategoryIndicatorBackgroundView.h
//  JXCategoryView
//
//  Created by jiaxin on 2018/8/17.
//  Copyright © 2018年 jiaxin. All rights reserved.
//

#import "JXCategoryIndicatorComponentView.h"

// 主要内容：
// 设置 指示器高度、宽度、宽度增量、圆角、颜色等属性
// 在三个指示器协议方法中，实现指示器位置的移动
@interface JXCategoryIndicatorBackgroundView : JXCategoryIndicatorComponentView

@property (nonatomic, assign) CGFloat backgroundViewWidth;     //默认JXCategoryViewAutomaticDimension（与cellWidth相等）

@property (nonatomic, assign) CGFloat backgroundViewWidthIncrement;    //宽度增量补偿，因为backgroundEllipseLayer一般会比实际内容大一些。默认10

@property (nonatomic, assign) CGFloat backgroundViewHeight;   //默认JXCategoryViewAutomaticDimension（与cell高度相等）

@property (nonatomic, assign) CGFloat backgroundViewCornerRadius;   //默认JXCategoryViewAutomaticDimension(即backgroundViewHeight/2)

@property (nonatomic, strong) UIColor *backgroundViewColor;   //默认为[UIColor lightGrayColor]

@end
