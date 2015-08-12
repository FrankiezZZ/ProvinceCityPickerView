//
//  City.h
//  省市选择
//
//  Created by 张勇 on 15/8/10.
//  Copyright © 2015年 zmonline. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface City : NSObject
@property (copy ,nonatomic) NSString *cityName;
@property (strong ,nonatomic) NSArray *areaArray;
+ (instancetype)cityeWithDict:(NSDictionary *)dict;
@end
