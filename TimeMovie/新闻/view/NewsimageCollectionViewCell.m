//
//  NewsimageCollectionViewCell.m
//  TimeMovie
//
//  Created by 黄翔宇 on 15/8/25.
//  Copyright (c) 2015年 黄翔宇. All rights reserved.
//

#import "NewsimageCollectionViewCell.h"
#import "NewsimageViewController.h"
@implementation NewsimageCollectionViewCell
-(id)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        [self creatViews];
    }
    

    return self;


}


-(void)creatViews{
    
    _scrollview=[[UIScrollView alloc]initWithFrame:self.bounds];
    _scrollview.contentSize=_scrollview.frame.size;
    _scrollview.maximumZoomScale=2;
    _scrollview.minimumZoomScale=.5;
    _scrollview.delegate=self;
    [self.contentView addSubview:_scrollview];
    
    _imageview=[[UIImageView alloc]initWithFrame:_scrollview.bounds];
    

    
    _imageview.contentMode=UIViewContentModeScaleAspectFit;
    [_scrollview addSubview:_imageview];
    UITapGestureRecognizer *oneTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(oneTapAction)];
    oneTap.numberOfTapsRequired=1;
    oneTap.numberOfTouchesRequired=1;
    [_imageview addGestureRecognizer:oneTap];
    _imageview.userInteractionEnabled=YES;
    
    UITapGestureRecognizer *twoTop=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(twoTopAction)];
    twoTop.numberOfTapsRequired=2;
    [_imageview addGestureRecognizer:twoTop];
    [oneTap requireGestureRecognizerToFail:twoTop];


}

-(void)oneTapAction{
    [[NSNotificationCenter defaultCenter ]postNotificationName:@"hiddenNavigationBar" object:nil];




}

-(void)twoTopAction{
    if (_scrollview.zoomScale>=2) {
        [_scrollview setZoomScale:1 animated:YES];
    }else{
    
        [_scrollview setZoomScale:3 animated:YES];
    
    
    }


}
-(void)setUrl:(NSURL *)url{
    
    
    
    [_imageview sd_setImageWithURL:url];



}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{

    return _imageview;


}
-(void)back{
    [_scrollview setZoomScale:1 animated:YES];

}
@end
