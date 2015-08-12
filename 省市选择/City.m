//
//  City.m
//  省市选择
//
//  Created by 张勇 on 15/8/10.
//  Copyright © 2015年 zmonline. All rights reserved.
//

#import "City.h"

@implementation City
- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        self.cityName = dict[@"city"];
        self.areaArray = dict[@"areas"];
    }
    return self;
}

+ (instancetype)cityeWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}
@end
