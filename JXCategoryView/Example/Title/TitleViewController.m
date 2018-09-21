//
//  TestViewController.m
//  JXCategoryView
//
//  Created by jiaxin on 2018/8/8.
//  Copyright © 2018年 jiaxin. All rights reserved.
//

#import "TitleViewController.h"
#import "JXCategoryTitleView.h"

@interface TitleViewController ()

@property (nonatomic, strong) JXCategoryTitleView *myCategoryView;
@end

@implementation TitleViewController

- (void)viewDidLoad {
    if (self.titles == nil) {
        _titles = @[@"螃蟹", @"麻辣小龙虾", @"苹果", @"营养胡萝卜", @"葡萄", @"美味西瓜", @"香蕉", @"香甜菠萝", @"鸡肉", @"鱼", @"海星"];
    }

    [super viewDidLoad];

    // 设置分割控制视图 标题
    self.myCategoryView.titles = self.titles;
}

// 获取分割控制视图
- (JXCategoryTitleView *)myCategoryView {
    return (JXCategoryTitleView *)self.categoryView;
}

// 控制器数量
- (NSUInteger)preferredListViewCount {
    return self.titles.count;
}

// 设置分割控制视图 种类
- (Class)preferredCategoryViewClass {
    return [JXCategoryTitleView class];
}

@end
