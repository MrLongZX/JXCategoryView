//
//  JXCategoryView.m
//  UI系列测试
//
//  Created by jiaxin on 2018/3/15.
//  Copyright © 2018年 jiaxin. All rights reserved.
//

#import "JXCategoryTitleView.h"
#import "JXCategoryFactory.h"

@interface JXCategoryTitleView ()

@end

@implementation JXCategoryTitleView

#pragma mark - 初始化数据
- (void)initializeData
{
    [super initializeData];

    _titleLabelZoomEnabled = NO;
    // 这里为啥这样？
    _titleLabelZoomScale = 1.2;
    _titleLabelZoomScale = YES;
    _titleColor = [UIColor blackColor];
    _titleSelectedColor = [UIColor redColor];
    _titleFont = [UIFont systemFontOfSize:15];
    _titleColorGradientEnabled = NO;
    _titleLabelMaskEnabled = NO;
    _titleLabelZoomScrollGradientEnabled = YES;
}

#pragma mark - Override
#pragma mark - 返回自定义cell的class
- (Class)preferredCellClass {
    return [JXCategoryTitleCell class];
}

#pragma mark - reloadData方法调用，重新生成数据源赋值到self.dataSource
- (void)refreshDataSource {
    NSMutableArray *tempArray = [NSMutableArray array];
    for (int i = 0; i < self.titles.count; i++) {
        JXCategoryTitleCellModel *cellModel = [[JXCategoryTitleCellModel alloc] init];
        [tempArray addObject:cellModel];
    }
    self.dataSource = tempArray;
}

#pragma mark - 用户点击了某个item，刷新选中与取消选中的cellModel
- (void)refreshSelectedCellModel:(JXCategoryBaseCellModel *)selectedCellModel unselectedCellModel:(JXCategoryBaseCellModel *)unselectedCellModel {
    [super refreshSelectedCellModel:selectedCellModel unselectedCellModel:unselectedCellModel];

    JXCategoryTitleCellModel *myUnselectedCellModel = (JXCategoryTitleCellModel *)unselectedCellModel;
    myUnselectedCellModel.titleColor = self.titleColor;
    myUnselectedCellModel.titleSelectedColor = self.titleSelectedColor;
    myUnselectedCellModel.titleLabelZoomScale = 1.0;

    JXCategoryTitleCellModel *myselectedCellModel = (JXCategoryTitleCellModel *)selectedCellModel;
    myselectedCellModel.titleColor = self.titleColor;
    myselectedCellModel.titleSelectedColor = self.titleSelectedColor;
    myselectedCellModel.titleLabelZoomScale = self.titleLabelZoomScale;
}

#pragma mark - 当contentScrollView滚动时候，处理指示器跟随手势的过渡效果
- (void)refreshLeftCellModel:(JXCategoryBaseCellModel *)leftCellModel rightCellModel:(JXCategoryBaseCellModel *)rightCellModel ratio:(CGFloat)ratio {
    [super refreshLeftCellModel:leftCellModel rightCellModel:rightCellModel ratio:ratio];

    JXCategoryTitleCellModel *leftModel = (JXCategoryTitleCellModel *)leftCellModel;
    JXCategoryTitleCellModel *rightModel = (JXCategoryTitleCellModel *)rightCellModel;

    // 处理标题label缩放
    if (self.titleLabelZoomEnabled && self.titleLabelZoomScrollGradientEnabled) {
        leftModel.titleLabelZoomScale = [JXCategoryFactory interpolationFrom:self.titleLabelZoomScale to:1.0 percent:ratio];
        rightModel.titleLabelZoomScale = [JXCategoryFactory interpolationFrom:1.0 to:self.titleLabelZoomScale percent:ratio];
    }

    // 处理标题label颜色渐变
    if (self.titleColorGradientEnabled) {
        if (leftModel.selected) {
            leftModel.titleSelectedColor = [JXCategoryFactory interpolationColorFrom:self.titleSelectedColor to:self.titleColor percent:ratio];
            leftModel.titleColor = self.titleColor;
        }else {
            leftModel.titleColor = [JXCategoryFactory interpolationColorFrom:self.titleSelectedColor to:self.titleColor percent:ratio];
            leftModel.titleSelectedColor = self.titleSelectedColor;
        }
        if (rightModel.selected) {
            rightModel.titleSelectedColor = [JXCategoryFactory interpolationColorFrom:self.titleColor to:self.titleSelectedColor percent:ratio];
            rightModel.titleColor = self.titleColor;
        }else {
            rightModel.titleColor = [JXCategoryFactory interpolationColorFrom:self.titleColor to:self.titleSelectedColor percent:ratio];
            rightModel.titleSelectedColor = self.titleSelectedColor;
        }
    }
}

#pragma mark - reloadData时，返回每个cell的宽度
- (CGFloat)preferredCellWidthAtIndex:(NSInteger)index {
    if (self.cellWidth == JXCategoryViewAutomaticDimension) {
        // 向上取整
        return ceilf([self.titles[index] boundingRectWithSize:CGSizeMake(MAXFLOAT, self.bounds.size.height) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : self.titleFont} context:nil].size.width);
    }else {
        return self.cellWidth;
    }
}

#pragma mark - refreshState时调用，重置cellModel的状态
- (void)refreshCellModel:(JXCategoryBaseCellModel *)cellModel index:(NSInteger)index {
    [super refreshCellModel:cellModel index:index];

    JXCategoryTitleCellModel *model = (JXCategoryTitleCellModel *)cellModel;
    model.titleFont = self.titleFont;
    model.titleColor = self.titleColor;
    model.titleSelectedColor = self.titleSelectedColor;
    model.title = self.titles[index];
    model.titleLabelMaskEnabled = self.titleLabelMaskEnabled;
    model.titleLabelZoomEnabled = self.titleLabelZoomEnabled;
    model.titleLabelZoomScale = 1.0;
    if (index == self.selectedIndex) {
        model.titleLabelZoomScale = self.titleLabelZoomScale;
    }
}

@end
