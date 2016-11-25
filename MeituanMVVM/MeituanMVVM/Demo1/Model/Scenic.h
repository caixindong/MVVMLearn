//
//  Scenic.h
//  MeituanMVVM
//
//  Created by 蔡欣东 on 2016/11/20.
//  Copyright © 2016年 蔡欣东. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle/Mantle.h>

@interface Scenic : MTLModel<MTLJSONSerializing>

@property (nonatomic) NSString *campaignTag;
@property (nonatomic) double lowestPrice;
@property (nonatomic) double lng;
@property (nonatomic) double lat;
@property (nonatomic) NSInteger cityID;
@property (nonatomic) NSString *cityName;
@property (nonatomic) NSString *areaName;
@property (nonatomic) NSURL *frontImgURL;
@property (nonatomic) NSInteger solds;
@property (nonatomic) NSString *name;

@end
