//
//  NewsTableViewCell.m
//  TimeMovie
//
//  Created by 黄翔宇 on 15/8/22.
//  Copyright (c) 2015年 黄翔宇. All rights reserved.
//

#import "NewsTableViewCell.h"
#import "News.h"
#import "NesColletion.h"
@implementation NewsTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setNews:(News *)news{
    _news=news;
    _title.text=news.title;
    _summary.text=news.summary;
    NSString *urling=_news.image;
    NSURL *url=[NSURL URLWithString:urling];
    [_imageview sd_setImageWithURL:url];
    int type=[news.type intValue];
    if (type==1) {
        _type.image=[UIImage imageNamed:@"sctpxw@2x"];
      
        
        
        
        
    }else if(type==2){
    
        _type.image=[UIImage imageNamed:@"scspxw@2x"];
    
    }



}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
