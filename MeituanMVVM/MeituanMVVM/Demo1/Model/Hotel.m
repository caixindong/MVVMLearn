//
//  Hotel.m
//  MeituanMVVM
//
//  Created by 蔡欣东 on 2016/11/20.
//  Copyright © 2016年 蔡欣东. All rights reserved.
//

#import "Hotel.h"

@implementation Hotel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"poiAttrTagList" : @"poiAttrTagList",
             @"lowestPrice" : @"lowestPrice",
             @"scoreIntro" : @"scoreIntro",
             @"avgScore" : @"avgScore",
             @"lng" : @"lng",
             @"lat" : @"lat",
             @"positionDescription" : @"posdescr",
             @"frontImageURL" : @"frontImg",
             @"name" : @"name",
             @"saleTag" : @"poiSaleAndSpanTag",
             @"lastOrderTime" : @"poiLastOrderTime"};
}

+ (NSValueTransformer *)frontImageURLJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

@end
