//
//  BaseViewController.h
//  JXCategoryView
//
//  Created by jiaxin on 2018/8/9.
//  Copyright © 2018年 jiaxin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JXCategoryView.h"

#define WindowsSize [UIScreen mainScreen].bounds.size

@interface BaseViewController : UIViewController

/// 是否处理侧滑手势
@property (nonatomic, assign) BOOL shouldHandleScreenEdgeGesture;
/// 需要修改指示器位置按钮
@property (nonatomic, assign) BOOL isNeedIndicatorPositionChangeItem;
/// 分割控制视图
@property (nonatomic, strong) JXCategoryBaseView *categoryView;
/// 分割控制视图
@property (nonatomic, strong) UIScrollView *scrollView;

/// 选择分割控制视图 种类
- (Class)preferredCategoryViewClass;
/// 选择分割控制视图 高度
- (CGFloat)preferredCategoryViewHeight;
/// 选择列表视图 类
- (Class)preferredListViewControllerClass;
/// 选择列表视图 数量
- (NSUInteger)preferredListViewCount;
/// 在某个位置 配置列表视图
- (void)configListViewController:(UIViewController *)controller index:(NSUInteger)index;

@end
