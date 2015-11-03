//
//  TopCollectionViewCell.m
//  TimeMovie
//
//  Created by 黄翔宇 on 15/8/24.
//  Copyright (c) 2015年 黄翔宇. All rights reserved.
//

#import "TopCollectionViewCell.h"
#import "Topmodel.h"
#import "UIViewExt.h"
@implementation TopCollectionViewCell
-(void)setTopmodel:(Topmodel *)topmodel{
    _topmodel=topmodel;
    NSNumber *n=_topmodel.rating[@"average"];
    _rat=[n floatValue] ;
    
    NSString *rating=[NSString stringWithFormat:@"%.1f",_rat];
    _title.text=_topmodel.title;
    _rating.text=rating;
    NSString *uring=_topmodel.images[@"small"];
    NSURL *url=[NSURL URLWithString:uring];
    [_topimage sd_setImageWithURL:url];
    
    UIImage *imageYellow=[UIImage imageNamed:@"yellow@2x"];
    UIImage *imageGay=[UIImage imageNamed:@"gray@2x"];
    
    _gray=[[UIView alloc]initWithFrame:_starview.bounds];
    _gray.backgroundColor=[UIColor colorWithPatternImage:imageGay];
    CGAffineTransform transform=CGAffineTransformMakeScale(0.88,1.3);
    _gray.transform=transform;
    [_starview addSubview:_gray];
    
    _yellow=[[UIView alloc]initWithFrame:_starview.bounds];
    _yellow.backgroundColor=[UIColor colorWithPatternImage:imageYellow];
    
    _yellow.transform=transform;
    [_starview addSubview:_yellow];
    
    CGPoint center=CGPointMake(_starview.frame.size.width/2, _starview.frame.size.height/2);
    _yellow.center=center;
    _gray.center=center;
   
    if (_rat>=0&&_rat<=10) {
        
        _yellow.width=_gray.width*_rat/10;
    }
   

}

@end
