//
//  JXCategoryComponentCellModel.h
//  DQGuess
//
//  Created by jiaxin on 2018/7/25.
//  Copyright © 2018年 jingbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JXCategoryBaseCellModel.h"

/// 指示器cell模型
@interface JXCategoryIndicatorCellModel : JXCategoryBaseCellModel

/// cellh间分割线是否展示
@property (nonatomic, assign) BOOL sepratorLineShowEnabled;
/// 分割线颜色
@property (nonatomic, strong) UIColor *separatorLineColor;
/// 分割线大小
@property (nonatomic, assign) CGSize separatorLineSize;

@property (nonatomic, assign) CGRect backgroundViewMaskFrame;
/// cell背景色是否渐变过渡
@property (nonatomic, assign) BOOL cellBackgroundColorGradientEnabled;
/// cell未选中背景色
@property (nonatomic, strong) UIColor *cellBackgroundUnselectedColor;
/// cell选中背景色
@property (nonatomic, strong) UIColor *cellBackgroundSelectedColor;

@end
