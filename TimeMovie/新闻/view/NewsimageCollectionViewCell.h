//
//  NewsimageCollectionViewCell.h
//  TimeMovie
//
//  Created by 黄翔宇 on 15/8/25.
//  Copyright (c) 2015年 黄翔宇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsimageCollectionViewCell : UICollectionViewCell<UIScrollViewDelegate>
@property (nonatomic,strong)UIScrollView *scrollview;
@property (nonatomic,strong)UIImageView *imageview;
@property (nonatomic,assign)NSInteger index;
@property (nonatomic,strong)NSURL *url;
@property (nonatomic)NSTimer *timer;
-(void)back;

@end
