//
//  Demo2ViewModel.h
//  MeituanMVVM
//
//  Created by 蔡欣东 on 2016/11/25.
//  Copyright © 2016年 蔡欣东. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface Demo2ViewModel : NSObject

@property (nonatomic) RACChannelTerminal *phoneTerminal;

@property (nonatomic) RACChannelTerminal *passwordTerminal;

@property (nonatomic) RACSignal *verifyPhoneSignal;

@property (nonatomic) RACSignal *verifyPasswordSignal;

@property (nonatomic) RACSignal *outputSignal;

@property (nonatomic) RACCommand *clearCommand;

@end
