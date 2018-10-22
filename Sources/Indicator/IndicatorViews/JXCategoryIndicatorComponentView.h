//
//  JXCategoryComponentBaseView.h
//  JXCategoryView
//
//  Created by jiaxin on 2018/8/17.
//  Copyright © 2018年 jiaxin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JXCategoryIndicatorProtocol.h"
#import "JXCategoryViewDefines.h"

// 主要内容：
// 设置 指示器位置、边距、能否滚动 三个基础属性
// 遵守指示器协议
@interface JXCategoryIndicatorComponentView : UIView <JXCategoryIndicatorProtocol>

@property (nonatomic, assign) JXCategoryComponentPosition componentPosition;   // 指示器位置 上、下

@property (nonatomic, assign) CGFloat verticalMargin;   // 垂直方向边距；默认：0

@property (nonatomic, assign) BOOL scrollEnabled;   // 手势滚动、点击切换的时候，是否允许滚动，默认YES


@end
