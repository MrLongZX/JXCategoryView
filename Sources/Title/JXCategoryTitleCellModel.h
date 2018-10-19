//
//  JXCategoryTitleCellModel.h
//  UI系列测试
//
//  Created by jiaxin on 2018/3/15.
//  Copyright © 2018年 jiaxin. All rights reserved.
//

#import "JXCategoryIndicatorCellModel.h"
#import <UIKit/UIKit.h>

@interface JXCategoryTitleCellModel : JXCategoryIndicatorCellModel

/// 标题
@property (nonatomic, copy) NSString *title;
/// 标题默认颜色
@property (nonatomic, strong) UIColor *titleColor;
/// 标题选中颜色
@property (nonatomic, strong) UIColor *titleSelectedColor;
/// 标题字体大小
@property (nonatomic, strong) UIFont *titleFont;
/// 标题Label是否遮罩过滤
@property (nonatomic, assign) BOOL titleLabelMaskEnabled;
/// 背景椭圆layer
@property (nonatomic, strong) CALayer *backgroundEllipseLayer;
/// 标题labele能否缩放
@property (nonatomic, assign) BOOL titleLabelZoomEnabled;
/// 标题labele缩放比例
@property (nonatomic, assign) CGFloat titleLabelZoomScale;

@end
