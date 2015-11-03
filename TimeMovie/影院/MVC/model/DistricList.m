//
//  districList.m
//  TimeMovie
//
//  Created by 黄翔宇 on 15/8/27.
//  Copyright (c) 2015年 黄翔宇. All rights reserved.
//

#import "DistricList.h"

@implementation DistricList
- (NSDictionary *)attributeMapDictionary:(NSDictionary *)jsonDic {
    
    NSMutableDictionary *mapDic = [NSMutableDictionary dictionary];
    
    for (id key in jsonDic) {
        [mapDic setObject:key forKey:key];
    }
    [mapDic setObject:@"number" forKey:@"id"];
    _cinemas=[[NSMutableArray alloc]init];
    return mapDic;
}
@end
