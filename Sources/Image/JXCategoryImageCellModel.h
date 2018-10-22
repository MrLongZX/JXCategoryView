//
//  JXCategoryImageCellModel.h
//  JXCategoryView
//
//  Created by jiaxin on 2018/8/20.
//  Copyright © 2018年 jiaxin. All rights reserved.
//

#import "JXCategoryIndicatorCellModel.h"

@interface JXCategoryImageCellModel : JXCategoryIndicatorCellModel

@property (nonatomic, copy) void(^loadImageCallback)(UIImageView *imageView);

/// 加载bundle内的图片
@property (nonatomic, copy) NSString *imageName;
/// 图片URL
@property (nonatomic, strong) NSURL *imageURL;
/// 加载bundle内的选中图片
@property (nonatomic, copy) NSString *selectedImageName;
/// 选中图片URL
@property (nonatomic, strong) NSURL *selectedImageURL;
/// 图片大小
@property (nonatomic, assign) CGSize imageSize;
/// 图片是否缩放
@property (nonatomic, assign) BOOL imageZoomEnabled;    
/// 图片缩放比例
@property (nonatomic, assign) CGFloat imageZoomScale;

@end
