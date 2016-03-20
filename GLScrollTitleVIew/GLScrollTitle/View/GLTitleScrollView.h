//
//  GLTitleScrollView.h
//  AutoLayoutTest
//
//  Created by William on 16/3/17.
//  Copyright © 2016年 William. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^titleButtonTapIndexBlcok)(NSUInteger index);

@interface GLTitleScrollView : UIScrollView

//title容器
@property (nonatomic, strong) NSArray *scrollTitleArray;

//标题视图容器
@property (nonatomic, strong) NSMutableArray *titleButtonArray;

@property (nonatomic, strong) UIView *bottomLine;//底部分割线

@property (nonatomic, copy) titleButtonTapIndexBlcok tapBlock;

@property (nonatomic, assign) NSUInteger updateIndex;

@property (nonatomic, assign) CGFloat rightMargin;

- (instancetype)initWithTitleArray:(NSArray *)titleArray;

//更新标题
- (void)updateTitles;

@end