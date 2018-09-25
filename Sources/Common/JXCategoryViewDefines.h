//
//  JXCategoryViewDefines.h
//  JXCategoryView
//
//  Created by jiaxin on 2018/8/17.
//  Copyright © 2018年 jiaxin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

static const CGFloat JXCategoryViewAutomaticDimension = -1;

/// 指示器组件位置 上、下
typedef NS_ENUM(NSUInteger, JXCategoryComponentPosition) {
    JXCategoryComponentPosition_Bottom,
    JXCategoryComponentPosition_Top,
};

/// 相对已经选中cell 当前选中cell的位置 左、右
typedef NS_ENUM(NSUInteger, JXCategoryCellClickedPosition) {
    JXCategoryCellClickedPosition_Left,
    JXCategoryCellClickedPosition_Right,
};
