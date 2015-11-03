//
//  PosCollectionViewCell.m
//  TimeMovie
//
//  Created by 黄翔宇 on 15/8/26.
//  Copyright (c) 2015年 黄翔宇. All rights reserved.
//

#import "PosCollectionViewCell.h"
#import "Model.h"
@implementation PosCollectionViewCell

-(void)setModel:(Model *)model{
    _model=model;
    _titleC.text=_model.titleC;
    _titleE.text=_model.titleE;
    _year.text=_model.year;
    NSURL *url=[NSURL URLWithString:_model.image[@"large"]];
    [_smallImage sd_setImageWithURL:url];
    [_bigImage sd_setImageWithURL:url];

    _starview.rating=_model.rating;



}
-(void)filpCell{
    [UIView transitionWithView:self duration:.3 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        _bigImage.hidden=!_bigImage.hidden;
    
    
    } completion:nil];


}
-(void)backCell{
    /*
    [UIView transitionWithView:self duration:.3 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        _bigImage.hidden=NO;
        
        
    } completion:nil];*/
    _bigImage.hidden=NO;

}
- (void)awakeFromNib {
    
    // Initialization code
}

@end
