//
//  JXCategoryBaseCellModel.h
//  UI系列测试
//
//  Created by jiaxin on 2018/3/15.
//  Copyright © 2018年 jiaxin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JXCategoryBaseCellModel : NSObject

/// 位置
@property (nonatomic, assign) NSUInteger index;
/// 是否选中
@property (nonatomic, assign) BOOL selected;
/// cell宽度
@property (nonatomic, assign) CGFloat cellWidth;
/// cell间距
@property (nonatomic, assign) CGFloat cellSpacing;
/// 是否可缩放
@property (nonatomic, assign) BOOL cellWidthZoomEnabled;
/// 缩放比例
@property (nonatomic, assign) CGFloat cellWidthZoomScale;

@end
