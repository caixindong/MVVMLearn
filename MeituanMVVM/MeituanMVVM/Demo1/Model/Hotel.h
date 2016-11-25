//
//  Hotel.h
//  MeituanMVVM
//
//  Created by 蔡欣东 on 2016/11/20.
//  Copyright © 2016年 蔡欣东. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle/Mantle.h>

@interface Hotel : MTLModel<MTLJSONSerializing>

@property (nonatomic) NSArray *poiAttrTagList;
@property (nonatomic) NSString *scoreIntro;
@property (nonatomic) double avgScore;
@property (nonatomic) double lowestPrice;
@property (nonatomic) double lng;
@property (nonatomic) double lat;
@property (nonatomic) NSString *lastOrderTime;
@property (nonatomic) NSString *saleTag;
@property (nonatomic) NSString *positionDescription;
@property (nonatomic) NSString *name;
@property (nonatomic) NSURL *frontImageURL;


@end
