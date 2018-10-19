//
//  JXCategoryComponetCell.m
//  DQGuess
//
//  Created by jiaxin on 2018/7/25.
//  Copyright © 2018年 jingbo. All rights reserved.
//

#import "JXCategoryIndicatorCell.h"
#import "JXCategoryIndicatorCellModel.h"

@interface JXCategoryIndicatorCell ()

/// 分割线
@property (nonatomic, strong) UIView *separatorLine;

@end

@implementation JXCategoryIndicatorCell

- (void)initializeViews
{
    [super initializeViews];

    // 创建分割线
    self.separatorLine = [[UIView alloc] init];
    self.separatorLine.hidden = YES;
    [self.contentView addSubview:self.separatorLine];
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    // 设置分割线位置
    JXCategoryIndicatorCellModel *model = (JXCategoryIndicatorCellModel *)self.cellModel;
    CGFloat lineWidth = model.separatorLineSize.width;
    CGFloat lineHeight = model.separatorLineSize.height;

    self.separatorLine.frame = CGRectMake(self.bounds.size.width - lineWidth + self.cellModel.cellSpacing/2, (self.bounds.size.height - lineHeight)/2.0, lineWidth, lineHeight);
}

- (void)reloadData:(JXCategoryBaseCellModel *)cellModel
{
    [super reloadData:cellModel];

    // 设置分割线属性
    JXCategoryIndicatorCellModel *model = (JXCategoryIndicatorCellModel *)cellModel;
    self.separatorLine.backgroundColor = model.separatorLineColor;
    self.separatorLine.hidden = !model.sepratorLineShowEnabled;

    // 根据cell是否背景色过渡，设置背景色
    if (model.cellBackgroundColorGradientEnabled) {
        if (model.selected) {
            self.contentView.backgroundColor = model.cellBackgroundSelectedColor;
        } else {
            self.contentView.backgroundColor = model.cellBackgroundUnselectedColor;
        }
    }
}

@end
