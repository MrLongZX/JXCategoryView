//
//  BaseViewController.m
//  JXCategoryView
//
//  Created by jiaxin on 2018/8/9.
//  Copyright © 2018年 jiaxin. All rights reserved.
//

#import "BaseViewController.h"
#import "ListViewController.h"
#import "NestViewController.h"

@interface BaseViewController () <JXCategoryViewDelegate, UIScrollViewDelegate>
/// 当前选中位置
@property (nonatomic, assign) NSInteger currentIndex;
@end

@implementation BaseViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _shouldHandleScreenEdgeGesture = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;

    CGFloat naviHeight = 64;
    if (@available(iOS 11.0, *)) {
        if (WindowsSize.height == 812) {
            naviHeight = [UIApplication sharedApplication].keyWindow.safeAreaInsets.top + 44;
        }
    }

    NSUInteger count = [self preferredListViewCount];
    CGFloat categoryViewHeight = [self preferredCategoryViewHeight];
    CGFloat width = WindowsSize.width;
    CGFloat height = WindowsSize.height - naviHeight - categoryViewHeight;

    // 设置scrollView
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, categoryViewHeight, width, height)];
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.contentSize = CGSizeMake(width*count, height);
    self.scrollView.bounces = NO;
    [self.view addSubview:self.scrollView];

    if (@available(iOS 11.0, *)) {
        self.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }

    // 添加子视图到scrollView
    for (int i = 0; i < count; i ++) {
        UIViewController *listVC = [[[self preferredListViewControllerClass] alloc] init];
        [self configListViewController:listVC index:i];
        [self addChildViewController:listVC];
        listVC.view.frame = CGRectMake(i*width, 0, width, height);
        [self.scrollView addSubview:listVC.view];
    }

    // 设置分割控制视图
    self.categoryView.frame = CGRectMake(0, 0, WindowsSize.width, categoryViewHeight);
    self.categoryView.delegate = self;
    self.categoryView.contentScrollView = self.scrollView;
    [self.view addSubview:self.categoryView];

    // 添加修改指示器位置按钮
    if (self.isNeedIndicatorPositionChangeItem) {
        UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"指示器位置切换" style:UIBarButtonItemStylePlain target:self action:@selector(rightItemClicked)];
        self.navigationItem.rightBarButtonItem = rightItem;
    }
}

#pragma mark - 处理特殊效果：嵌套使用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if ([self isKindOfClass:[NestViewController class]]) {
        CGFloat index = scrollView.contentOffset.x/scrollView.bounds.size.width;
        CGFloat absIndex = fabs(index - self.currentIndex);
        if (absIndex >= 1) {
            //嵌套使用的时候，最外层的VC持有的scrollView在翻页之后，就断掉一次手势。解决快速滑动的时候，只响应最外层VC持有的scrollView。子VC持有的scrollView却没有响应
            self.scrollView.panGestureRecognizer.enabled = NO;
            self.scrollView.panGestureRecognizer.enabled = YES;
            _currentIndex = floor(index);
        }
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    self.navigationController.interactivePopGestureRecognizer.enabled = (self.categoryView.selectedIndex == 0);
}

#pragma mark - 选择分割控制视图 种类
- (Class)preferredCategoryViewClass {
    return [JXCategoryBaseView class];
}

#pragma mark - 选择分割控制视图 高度
- (CGFloat)preferredCategoryViewHeight {
    return 50;
}

#pragma mark - 选择列表视图 类
- (Class)preferredListViewControllerClass {
    return [ListViewController class];
}

#pragma mark - 选择列表视图 数量
- (NSUInteger)preferredListViewCount {
    return 0;
}

#pragma mark - 在某个位置 配置列表视图
- (void)configListViewController:(UIViewController *)controller index:(NSUInteger)index {
    
}

- (JXCategoryBaseView *)categoryView {
    if (_categoryView == nil) {
        _categoryView = [[[self preferredCategoryViewClass] alloc] init];
    }
    return _categoryView;
}

#pragma mark - 指示器位置切换
- (void)rightItemClicked {
    JXCategoryIndicatorView *componentView = (JXCategoryIndicatorView *)self.categoryView;
    for (JXCategoryIndicatorComponentView *view in componentView.indicators) {
        if (view.componentPosition == JXCategoryComponentPosition_Top) {
            view.componentPosition = JXCategoryComponentPosition_Bottom;
        }else {
            view.componentPosition = JXCategoryComponentPosition_Top;
        }
    }
    [componentView reloadData];
}

#pragma mark - JXCategoryViewDelegate
// 点击选择或者滚动选中都会调用该方法
- (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index {
    //侧滑手势处理
    if (_shouldHandleScreenEdgeGesture) {
        self.navigationController.interactivePopGestureRecognizer.enabled = (index == 0);
    }

}

@end
