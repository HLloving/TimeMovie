//
//  TopMovieTableViewCell.m
//  TimeMovie
//
//  Created by 黄翔宇 on 15/8/28.
//  Copyright (c) 2015年 黄翔宇. All rights reserved.
//

#import "TopMovieTableViewCell.h"

@implementation TopMovieTableViewCell

- (void)awakeFromNib {
    _bgview.layer.cornerRadius = 3;
    _bgview.layer.borderColor = [UIColor redColor].CGColor;
    _bgview.layer.borderWidth = 2;
    _bgview.layer.masksToBounds = YES;
    
    // Initialization code
}
-(void)setTopMovie:(Topmovie *)topMovie{
    _topMovie=topMovie;
    _ratingLabel.text=_topMovie.rating;
    _nameLable.text=_topMovie.nickname;
  
    NSURL *url=[NSURL URLWithString:_topMovie.userImage];
    [_touxiang sd_setImageWithURL:url];
    _comentLabel.text=_topMovie.content;



}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
