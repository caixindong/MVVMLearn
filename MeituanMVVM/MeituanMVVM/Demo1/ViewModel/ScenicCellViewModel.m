//
//  ScenicCellViewModel.m
//  MeituanMVVM
//
//  Created by 蔡欣东 on 2016/11/24.
//  Copyright © 2016年 蔡欣东. All rights reserved.
//

#import "ScenicCellViewModel.h"
#import "Scenic.h"

@interface ScenicCellViewModel()

@property (nonatomic) Scenic *scenic;

@end

@implementation ScenicCellViewModel

- (instancetype)initWithScenic:(Scenic *)scenic {
    if (self = [super init]) {
        self.cellName = @"POITableViewCell";
        _scenic = scenic;
        [self bindSignals];
    }
    return self;
}

- (void)bindSignals {
    RACSignal *scenicSignal = [RACSignal return:self.scenic];
    
    self.titleSignal = [scenicSignal map:^id(Scenic *value) {
        return value.name;
    }];
    
    self.priceSignal = [scenicSignal map:^id(Scenic *value) {
        NSString *priceString = [NSString stringWithFormat:@"$%.2f起",value.lowestPrice];
        NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:priceString attributes:@{NSForegroundColorAttributeName : [UIColor blueColor]}];
        [attributeString setAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:10],
                                         NSForegroundColorAttributeName : [UIColor blueColor]} range:NSMakeRange([priceString length]-1, 1)];
        return [attributeString copy];
    }];
    
    self.campaignSignal = [scenicSignal map:^id(Scenic *value) {
        return value.campaignTag;
    }];
    
    self.campaignHiddenSignal = [scenicSignal map:^id (Scenic *scenic) {
        return @([scenic.campaignTag length] == 0);
    }];
    
    self.imgSignal = [[[scenicSignal map:^id(Scenic *value) {
        NSData *data = [NSData dataWithContentsOfURL:value.frontImgURL];
        return [UIImage imageWithData:data];
    }] subscribeOn:[RACScheduler schedulerWithPriority:RACSchedulerPriorityBackground]]
    deliverOnMainThread];
    
    self.footerSignal = [RACSignal combineLatest:@[scenicSignal, RACObserve(self, currentCityID) ] reduce:^id (Scenic *scenic, NSNumber *currentCityID){
        if ([currentCityID integerValue] == scenic.cityID) {
            return scenic.areaName;
        }else {
            return scenic.cityName;
        }
    }];
}

@end
