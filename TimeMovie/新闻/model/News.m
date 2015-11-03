//
//  News.m
//  TimeMovie
//
//  Created by 黄翔宇 on 15/8/22.
//  Copyright (c) 2015年 黄翔宇. All rights reserved.
//

#import "News.h"

@implementation News
//-(id)initWithContentOfDictionary:(NSDictionary *)dic{
//    self=[super init];
//    if (self) {
//        _numberid=dic[@"id"];
//        _type=dic[@"type"];
//        _image=dic[@"image"];
//        _title=dic[@"title"];
//        _summary=dic[@"summary"];
//        
//    }
//    
//    return self;
//}
//+(id)newsWithContentOfDictionary:(NSDictionary *)dic{
//    
//    
//    
//    
//    return [[News alloc]initWithContentOfDictionary:dic];
//}
- (NSDictionary *)attributeMapDictionary:(NSDictionary *)jsonDic {
    
    NSMutableDictionary *mapDic = [NSMutableDictionary dictionary];
    
    for (id key in jsonDic) {
        [mapDic setObject:key forKey:key];
    }
     [mapDic setObject:@"numberid" forKey:@"id"];
    
    return mapDic;
}

@end
