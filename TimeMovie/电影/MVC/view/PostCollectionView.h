//
//  PostCollectionView.h
//  TimeMovie
//
//  Created by 黄翔宇 on 15/8/26.
//  Copyright (c) 2015年 黄翔宇. All rights reserved.
//

#import <UIKit/UIKit.h>
@class  topCollectionView;
@interface PostCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegate,UIScrollViewDelegate>
@property(nonatomic,strong)NSArray *movieData;
@property (nonatomic,assign)NSInteger index;
//-(id)initWithTopCollectionView:(topCollectionView *)top;
@end
