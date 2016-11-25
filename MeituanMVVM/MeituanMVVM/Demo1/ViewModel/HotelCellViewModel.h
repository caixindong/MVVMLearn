//
//  HotelCellViewModel.h
//  MeituanMVVM
//
//  Created by 蔡欣东 on 2016/11/20.
//  Copyright © 2016年 蔡欣东. All rights reserved.
//

#import "POICellViewModel.h"

@class Hotel;
@interface HotelCellViewModel : POICellViewModel

- (instancetype)initWithHotel:(Hotel *)hotel;

@end
