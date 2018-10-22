//
//  JXCategoryIndicatorLineView.h
//  JXCategoryView
//
//  Created by jiaxin on 2018/8/17.
//  Copyright © 2018年 jiaxin. All rights reserved.
//

#import "JXCategoryIndicatorComponentView.h"

typedef NS_ENUM(NSUInteger, JXCategoryIndicatorLineStyle) {
    JXCategoryIndicatorLineStyle_Normal = 0,
    JXCategoryIndicatorLineStyle_JD,
    JXCategoryIndicatorLineStyle_IQIYI,
};

// 主要内容：
// 设置 指示器高度、宽度、圆角、颜色、滚动偏移等属性
// 在三个指示器协议方法中，实现指示器位置的移动
@interface JXCategoryIndicatorLineView : JXCategoryIndicatorComponentView

@property (nonatomic, assign) JXCategoryIndicatorLineStyle lineStyle;

/**
 line滚动时x的偏移量，默认为10；
 lineStyle为JXCategoryLineStyle_IQIYI有用；
 */
@property (nonatomic, assign) CGFloat lineScrollOffsetX;

@property (nonatomic, assign) CGFloat indicatorLineViewHeight;  //默认：3

@property (nonatomic, assign) CGFloat indicatorLineWidth;    //默认JXCategoryViewAutomaticDimension（与cellWidth相等）

@property (nonatomic, assign) CGFloat indicatorLineViewCornerRadius;    //默认JXCategoryViewAutomaticDimension （等于self.indicatorLineViewHeight/2）

@property (nonatomic, strong) UIColor *indicatorLineViewColor;   //默认为[UIColor redColor]

@end
