//
//  Cinema.h
//  TimeMovie
//
//  Created by 黄翔宇 on 15/8/27.
//  Copyright (c) 2015年 黄翔宇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"

@interface Cinema : BaseModel
@property (nonatomic ,copy)NSString *name;
@property (nonatomic ,copy)NSString *address;
@property (nonatomic ,copy)NSString *lowPrice;
@property (nonatomic ,copy)NSString *isSeatSupport;
@property (nonatomic ,copy)NSString *isCouponSupport;
@property (nonatomic ,copy)NSString *isImaxSupport;
@property (nonatomic ,copy)NSString *isGroupBuySupport;
@property (nonatomic ,copy)NSString *districtId;
@property (nonatomic,copy) NSString *grade;
@end
