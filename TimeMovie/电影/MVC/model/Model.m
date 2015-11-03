//
//  Model.m
//  TimeMovie
//
//  Created by 黄翔宇 on 15/8/21.
//  Copyright (c) 2015年 黄翔宇. All rights reserved.
//

#import "Model.h"

@implementation Model
-(id)initWithContentOfDictionary:(NSDictionary *)dictionary{
    self=[super init];
    if (self) {

        NSDictionary *subject=dictionary[@"subject"];
        _titleC=subject[@"title"];
        _titleE=subject[@"original_title"];
        NSDictionary *rationgDic=subject[@"rating"];
        NSNumber *number=rationgDic[@"average"];
        _rating=[number floatValue];
        _image=subject[@"images"];
        _year=subject[@"year"];
        
    }

    return self;
}
+(id)movieWithContentOfDictionary:(NSDictionary *)dictionary{




    return [[Model alloc]initWithContentOfDictionary:dictionary];
}
@end
