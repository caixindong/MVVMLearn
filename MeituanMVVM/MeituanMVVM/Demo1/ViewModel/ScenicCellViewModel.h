//
//  ScenicCellViewModel.h
//  MeituanMVVM
//
//  Created by 蔡欣东 on 2016/11/24.
//  Copyright © 2016年 蔡欣东. All rights reserved.
//

#import "POICellViewModel.h"

@class Scenic;
@interface ScenicCellViewModel : POICellViewModel

@property (nonatomic) NSInteger currentCityID;

- (instancetype)initWithScenic:(Scenic *)scenic;

@end
