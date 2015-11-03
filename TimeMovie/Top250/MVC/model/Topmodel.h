//
//  Topmodel.h
//  TimeMovie
//
//  Created by 黄翔宇 on 15/8/24.
//  Copyright (c) 2015年 黄翔宇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"
@interface Topmodel : BaseModel
@property (nonatomic)NSDictionary *rating;
@property (nonatomic)NSDictionary *images;
@property (nonatomic ,copy)NSString *title;
@end
