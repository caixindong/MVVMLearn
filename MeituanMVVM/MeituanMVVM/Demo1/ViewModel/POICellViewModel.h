//
//  POICellViewModel.h
//  MeituanMVVMDemo
//
//  Created by 蔡欣东 on 2016/11/19.
//  Copyright © 2016年 蔡欣东. All rights reserved.
//

#import "BaseCellViewModel.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface POICellViewModel : BaseCellViewModel

@property (nonatomic) RACSignal *imgSignal;

@property (nonatomic) RACSignal *titleSignal;

@property (nonatomic) RACSignal *priceSignal;

@property (nonatomic) RACSignal *campaignSignal;

@property (nonatomic) RACSignal *campaignHiddenSignal;

@property (nonatomic) RACSignal *footerSignal;

@end
