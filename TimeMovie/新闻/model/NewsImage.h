//
//  NewsImage.h
//  TimeMovie
//
//  Created by 黄翔宇 on 15/8/23.
//  Copyright (c) 2015年 黄翔宇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"
/*
 {
 "id": 2238622,
 "image": "http://img31.mtime.cn/pi/2013/03/08/144644.81111130.jpg",
 "type": 6
 }
 
 */
@interface NewsImage : BaseModel
@property(nonatomic,assign) NSNumber *imageid;
@property(nonatomic,copy)NSString *image;
@property(nonatomic,assign)NSNumber *type;
@end
