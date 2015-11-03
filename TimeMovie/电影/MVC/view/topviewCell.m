//
//  topviewCell.m
//  TimeMovie
//
//  Created by 黄翔宇 on 15/8/27.
//  Copyright (c) 2015年 黄翔宇. All rights reserved.
//

#import "topviewCell.h"
#import "Model.h"
@implementation topviewCell
-(void)setModel:(Model *)model{
    _model=model;
    NSURL *url=[NSURL URLWithString:_model.image[@"large"]];
    
    UIImageView *imageview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    
    [imageview sd_setImageWithURL:url];
    
    [self.contentView addSubview:imageview];


}
@end
