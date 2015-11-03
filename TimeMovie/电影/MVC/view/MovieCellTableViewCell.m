//
//  MovieCellTableViewCell.m
//  TimeMovie/Users/hxy/Desktop/项目一所有资料/资料/Common
//
//  Created by 黄/Users/hxy/Desktop/项目一所有资料/资料/Common翔宇 on 15/8/21.
//  Copyright (c) 2015年 黄翔宇. All rights reserved.
//

#import "MovieCellTableViewCell.h"
#import "Model.h"
#import "startview.h"
@implementation MovieCellTableViewCell
{
    UIImageView *startimage;


}
- (void)awakeFromNib {
    // Initialization code
}
-(void)setModel:(Model *)model{

    _model=model;
    
    _movieName.text=_model.titleC;
    _year.text=[NSString stringWithFormat:@"上映年份:%@",_model.year];
    _rating.text=[NSString stringWithFormat:@"%.1f",_model.rating];

    NSString *urling=_model.image[@"small"];
    NSURL *url=[NSURL URLWithString:urling];
    [_movieImage sd_setImageWithURL:url];
    startview *starview=[[startview alloc]initWithFrame:CGRectMake(0, 0, 143, 25)];
    
    starview.rating=_model.rating;
    
    [_start addSubview:starview];
    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
