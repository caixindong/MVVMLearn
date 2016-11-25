//
//  Demo2ViewModel.m
//  MeituanMVVM
//
//  Created by 蔡欣东 on 2016/11/25.
//  Copyright © 2016年 蔡欣东. All rights reserved.
//

#import "Demo2ViewModel.h"

@interface Demo2ViewModel()

@property (nonatomic) NSString *phone;
@property (nonatomic) NSString *password;

@end

@implementation Demo2ViewModel

- (instancetype)init {
    if (self = [super init]) {
        _phone = @"186";
        _password = @"";
        
        _phoneTerminal = RACChannelTo(self,phone);
        _passwordTerminal = RACChannelTo(self,password);
        
        _outputSignal = [RACSignal combineLatest:@[RACObserve(self, phone),RACObserve(self, password)] reduce:^id(NSString *phone, NSString *password){
            return [NSString stringWithFormat:@"手机是：%@；密码是：%@。",phone,password];
        }];
        
        _verifyPhoneSignal = [RACObserve(self, phone) map:^id(NSString *value) {
            NSString *phoneRegexp = @"^1(3[0-9]|5[0-35-9]|8[0-25-9])\\d{8}$";
            NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegexp];
            return @((BOOL)[regextestmobile evaluateWithObject:value]);
        }];
        
        _verifyPasswordSignal = [RACObserve(self, password) map:^id(NSString *value) {
            return @((BOOL)(value.length >= 8));
        }];
        
        RACSignal *verifyAllSignal = [RACSignal combineLatest:@[_verifyPasswordSignal,_verifyPhoneSignal] reduce:^id(NSNumber *phone, NSNumber *pwd){
            return @([phone boolValue] && [pwd boolValue]);
        }];
        
        @weakify(self);
        _clearCommand = [[RACCommand alloc] initWithEnabled:verifyAllSignal signalBlock:^RACSignal *(id input) {
            @strongify(self);
            self.phone = @"186";
            self.password = @"";
            return [RACSignal empty];
        }];
    }
    return self;
}

@end
