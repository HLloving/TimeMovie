//
//  MovieJson.m
//  TimeMovie
//
//  Created by 黄翔宇 on 15/8/22.
//  Copyright (c) 2015年 黄翔宇. All rights reserved.
//

#import "MovieJson.h"

@implementation MovieJson
+(id)loadData:(NSString *)file{

    NSString *path=[[NSBundle mainBundle]pathForResource:file ofType:@"json"];
    NSData *data=[NSData dataWithContentsOfFile:path];
    id Json=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    return Json;
}
@end
