//
//  Demo1Model.h
//  MeituanMVVM
//
//  Created by 蔡欣东 on 2016/11/20.
//  Copyright © 2016年 蔡欣东. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface Demo1Model : NSObject

- (RACSignal *)loadTravelData;
- (RACSignal *)loadHotelData;

@end
