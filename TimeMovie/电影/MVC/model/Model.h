//
//  Model.h
//  TimeMovie
//
//  Created by 黄翔宇 on 15/8/21.
//  Copyright (c) 2015年 黄翔宇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
@interface Model : NSObject
@property(nonatomic,copy)NSString *titleC;
@property(nonatomic,copy)NSString *titleE;
@property(nonatomic,copy)NSString *year;
@property(nonatomic,copy)NSDictionary *image;
@property(nonatomic,assign)CGFloat rating;
-(id)initWithContentOfDictionary:(NSDictionary *)dictionary;
+(id)movieWithContentOfDictionary:(NSDictionary *)dictionary;
@end
