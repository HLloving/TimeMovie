//
//  districList.h
//  TimeMovie
//
//  Created by 黄翔宇 on 15/8/27.
//  Copyright (c) 2015年 黄翔宇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"
@interface DistricList : BaseModel
@property (nonatomic ,copy)NSString *name;
@property (nonatomic ,copy)NSString *number;
@property (nonatomic,strong)NSMutableArray *cinemas;
@property (nonatomic,assign)BOOL isShow;
@end
