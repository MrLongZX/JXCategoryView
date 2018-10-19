//
//  JXCategoryTitleCell.h
//  UI系列测试
//
//  Created by jiaxin on 2018/3/15.
//  Copyright © 2018年 jiaxin. All rights reserved.
//

#import "JXCategoryIndicatorCell.h"

@interface JXCategoryTitleCell : JXCategoryIndicatorCell

/// 标题label
@property (nonatomic, strong) UILabel *titleLabel;
/// 标题遮罩层label
@property (nonatomic, strong) UILabel *maskTitleLabel;

@end
