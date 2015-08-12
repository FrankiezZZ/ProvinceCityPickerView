//
//  Province.h
//  省市选择
//
//  Created by 张勇 on 15/8/10.
//  Copyright © 2015年 zmonline. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Province : NSObject
@property (copy ,nonatomic) NSString *provinceName;
@property (strong ,nonatomic) NSArray *cityArray;
+ (instancetype)provinceWithDict:(NSDictionary *)dict;
@end
