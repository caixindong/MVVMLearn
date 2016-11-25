//
//  Scenic.m
//  MeituanMVVM
//
//  Created by 蔡欣东 on 2016/11/20.
//  Copyright © 2016年 蔡欣东. All rights reserved.
//

#import "Scenic.h"

@implementation Scenic

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"campaignTag" : @"campaignTag",
             @"lowestPrice" : @"lowestPrice",
             @"lng" : @"lng",
             @"lat" : @"lat",
             @"cityID" : @"cityId",
             @"cityName" : @"cityName",
             @"areaName" : @"areaName",
             @"frontImgURL" : @"frontImg",
             @"solds" : @"solds",
             @"name" : @"name", };
}

+ (NSValueTransformer *)frontImgURLJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

@end
