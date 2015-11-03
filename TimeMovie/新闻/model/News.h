//
//  News.h
//  TimeMovie
//
//  Created by 黄翔宇 on 15/8/22.
//  Copyright (c) 2015年 黄翔宇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"
/*
 "id" : 1491552,
 "type" : 1,
 "image" : "http://img31.mtime.cn/mg/2012/06/28/112005.28198250.jpg",
 "title" : "《小律师有大作为》宣传海报",
 "summary" : "小律师有大作为,TNT,律政剧"
 
 */
@interface News :BaseModel
@property(nonatomic,strong)NSNumber *numberid;
@property(nonatomic,strong)NSNumber *type;
@property(nonatomic,copy)NSString *image;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *summary;


@end
