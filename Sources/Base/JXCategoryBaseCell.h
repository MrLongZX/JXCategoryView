//
//  JXCategoryBaseCell.h
//  UI系列测试
//
//  Created by jiaxin on 2018/3/15.
//  Copyright © 2018年 jiaxin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JXCategoryBaseCellModel.h"

@interface JXCategoryBaseCell : UICollectionViewCell

/// cell模型数据
@property (nonatomic, strong) JXCategoryBaseCellModel *cellModel;

/// 初始化子视图
- (void)initializeViews NS_REQUIRES_SUPER;
/// 刷新数据
- (void)reloadData:(JXCategoryBaseCellModel *)cellModel NS_REQUIRES_SUPER;

@end
