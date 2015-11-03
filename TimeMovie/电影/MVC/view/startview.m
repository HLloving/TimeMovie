//
//  startview.m
//  TimeMovie
//
//  Created by 黄翔宇 on 15/8/22.
//  Copyright (c) 2015年 黄翔宇. All rights reserved.
//

#import "startview.h"
#import "UIViewExt.h"
@interface startview ()
{
    UIView *_yellowView;    // 黄色星星视图
    UIView *_grayView;      // 灰色星星视图
}
@end
@implementation startview

-(id)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        [self creatstartview];
    }



    return self;
}



-(void)creatstartview{
    UIImage *imageYellow=[UIImage imageNamed:@"yellow@2x"];
    UIImage *imageGay=[UIImage imageNamed:@"gray@2x"];
    
    _grayView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 17.5*5, 17)];
    _grayView.backgroundColor=[UIColor colorWithPatternImage:imageGay];
    CGAffineTransform transform=CGAffineTransformMakeScale(self.frame.size.width/17.5/5, self.frame.size.height/17);
    _grayView.transform=transform;
    [self addSubview:_grayView];
    
    _yellowView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 17.5*5, 17)];
    _yellowView.backgroundColor=[UIColor colorWithPatternImage:imageYellow];
   
    _yellowView.transform=transform;
    [self addSubview:_yellowView];

    CGPoint center=CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    _grayView.center=center;
    _yellowView.center=center;


}
-(void)awakeFromNib{
    [self creatstartview];



}

-(void)setRating:(CGFloat)rating{


    if (rating>=0&&rating<=10) {
        _rating=rating;
        _yellowView.width=_grayView.width*rating/10;
    }


}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
