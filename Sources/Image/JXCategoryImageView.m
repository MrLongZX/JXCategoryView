//
//  JXCategoryImageView.m
//  JXCategoryView
//
//  Created by jiaxin on 2018/8/20.
//  Copyright © 2018年 jiaxin. All rights reserved.
//

#import "JXCategoryImageView.h"
#import "JXCategoryFactory.h"

@implementation JXCategoryImageView

- (void)dealloc
{
    self.loadImageCallback = nil;
}

- (void)initializeData
{
    [super initializeData];

    _imageSize = CGSizeMake(20, 20);
    _imageZoomEnabled = NO;
    _imageZoomScale = 1.2;
}

#pragma mark - 返回自定义cell的class
- (Class)preferredCellClass
{
    return [JXCategoryImageCell class];
}

#pragma mark - reloadData方法调用，重新生成数据源赋值到self.dataSource
- (void)refreshDataSource
{
    NSMutableArray *tempArray = [NSMutableArray array];
    NSUInteger count = (self.imageNames.count > 0) ? self.imageNames.count : (self.imageURLs.count > 0 ? self.imageURLs.count : 0);
    for (int i = 0; i < count; i++) {
        JXCategoryImageCellModel *cellModel = [[JXCategoryImageCellModel alloc] init];
        [tempArray addObject:cellModel];
    }
    self.dataSource = tempArray;
}

#pragma mark - 用户点击了某个item，刷新选中与取消选中的cellModel
- (void)refreshSelectedCellModel:(JXCategoryBaseCellModel *)selectedCellModel unselectedCellModel:(JXCategoryBaseCellModel *)unselectedCellModel
{
    [super refreshSelectedCellModel:selectedCellModel unselectedCellModel:unselectedCellModel];

    JXCategoryImageCellModel *myUnselectedCellModel = (JXCategoryImageCellModel *)unselectedCellModel;
    myUnselectedCellModel.imageZoomScale = 1.0;

    JXCategoryImageCellModel *myselectedCellModel = (JXCategoryImageCellModel *)selectedCellModel;
    myselectedCellModel.imageZoomScale = self.imageZoomScale;
}

#pragma mark - refreshState时调用，重置cellModel的状态
- (void)refreshCellModel:(JXCategoryBaseCellModel *)cellModel index:(NSInteger)index
{
    [super refreshCellModel:cellModel index:index];

    // 图片加载block、大小、未选中、选中、
    JXCategoryImageCellModel *myCellModel = (JXCategoryImageCellModel *)cellModel;
    myCellModel.loadImageCallback = self.loadImageCallback;
    myCellModel.imageSize = self.imageSize;
    if (self.imageNames != nil) {
        myCellModel.imageName = self.imageNames[index];
    }else if (self.imageURLs != nil) {
        myCellModel.imageURL = self.imageURLs[index];
    }
    if (self.selectedImageNames != nil) {
        myCellModel.selectedImageName = self.selectedImageNames[index];
    }else if (self.selectedImageURLs != nil) {
        myCellModel.selectedImageURL = self.selectedImageURLs[index];
    }
    
    // 图片能否缩放、缩放比例
    myCellModel.imageZoomEnabled = self.imageZoomEnabled;
    myCellModel.imageZoomScale = 1.0;
    if (index == self.selectedIndex) {
        myCellModel.imageZoomScale = self.imageZoomScale;
    }
}

#pragma mark - 当contentScrollView滚动时候，处理指示器跟随手势的过渡效果
- (void)refreshLeftCellModel:(JXCategoryBaseCellModel *)leftCellModel rightCellModel:(JXCategoryBaseCellModel *)rightCellModel ratio:(CGFloat)ratio
{
    [super refreshLeftCellModel:leftCellModel rightCellModel:rightCellModel ratio:ratio];

    JXCategoryImageCellModel *leftModel = (JXCategoryImageCellModel *)leftCellModel;
    JXCategoryImageCellModel *rightModel = (JXCategoryImageCellModel *)rightCellModel;
    // 图片缩放
    if (self.imageZoomEnabled) {
        leftModel.imageZoomScale = [JXCategoryFactory interpolationFrom:self.imageZoomScale to:1.0 percent:ratio];
        rightModel.imageZoomScale = [JXCategoryFactory interpolationFrom:1.0 to:self.imageZoomScale percent:ratio];
    }
}

#pragma mark - reloadData时，返回每个cell的宽度
- (CGFloat)preferredCellWidthAtIndex:(NSInteger)index
{
    return self.imageSize.width;
}

@end
