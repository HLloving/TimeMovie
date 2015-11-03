//
//  topCollectionView.h
//  TimeMovie
//
//  Created by 黄翔宇 on 15/8/27.
//  Copyright (c) 2015年 黄翔宇. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Model;
@interface topCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegate,UIScrollViewDelegate>
@property(nonatomic,strong)NSArray *movieData;
@property(nonatomic)Model *model;
@property (nonatomic)NSInteger index;
@end
