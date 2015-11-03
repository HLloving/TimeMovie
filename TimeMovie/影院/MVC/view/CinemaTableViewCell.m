//
//  CinemaTableViewCell.m
//  TimeMovie
//
//  Created by 黄翔宇 on 15/8/29.
//  Copyright (c) 2015年 黄翔宇. All rights reserved.
//

#import "CinemaTableViewCell.h"
#import "Cinema.h"
@implementation CinemaTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)setCinema:(Cinema *)cinema{
    _cinema=cinema;
    _cinemaName.text=_cinema.name;
    _adress.text=_cinema.address;
    if (_cinema.lowPrice.length==0) {
        _price.text=@"免费";
    }else{
        NSString *s=[NSString stringWithFormat:@"￥%@",_cinema.lowPrice];
        _price.text=s;
    }
    if ([_cinema.isGroupBuySupport isEqualToString:@"0"]) {
        _group.hidden=YES;
    }if ([_cinema.isImaxSupport isEqualToString:@"0"]) {
        _iMax.hidden=YES;
    }if ([_cinema.isCouponSupport isEqualToString:@"0"]) {
        _Mark.hidden=YES;
    }if ([_cinema.isSeatSupport isEqualToString:@"0"]) {
        _set.hidden=YES;
    }
    _rating.text=_cinema.grade;



}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
