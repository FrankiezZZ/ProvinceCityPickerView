//
//  Province.m
//  省市选择
//
//  Created by 张勇 on 15/8/10.
//  Copyright © 2015年 zmonline. All rights reserved.
//

#import "Province.h"
#import "City.h"

@implementation Province
- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        self.provinceName = dict[@"state"];
        NSMutableArray *arrayM = [NSMutableArray array];
        for (NSDictionary *dic in (NSArray *)dict[@"cities"]) {
            City *city = [City cityeWithDict:dic];
            [arrayM addObject:city];
        }
        self.cityArray = arrayM.copy;
    }
    return self;
}

+ (instancetype)provinceWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}
@end
