//
//  Demo2ViewController.m
//  MeituanMVVM
//
//  Created by 蔡欣东 on 2016/11/25.
//  Copyright © 2016年 蔡欣东. All rights reserved.
//

#import "Demo2ViewController.h"
#import "Demo2ViewModel.h"

@interface Demo2ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *clearButton;
@property (weak, nonatomic) IBOutlet UILabel *outputLable;

@property (nonatomic) Demo2ViewModel *viewModel;

@end

@implementation Demo2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _viewModel = [[Demo2ViewModel alloc] init];
    
    RACChannelTerminal *phoneTerminal = [_phoneTextField rac_newTextChannel];
    [_viewModel.phoneTerminal subscribe:phoneTerminal];
    [phoneTerminal subscribe:_viewModel.phoneTerminal];
    
    RACChannelTerminal *passwordTerminal = [_passwordTextField rac_newTextChannel];
    [_viewModel.passwordTerminal subscribe:passwordTerminal];
    [passwordTerminal subscribe:_viewModel.passwordTerminal];
    
    RAC(_outputLable,text) = _viewModel.outputSignal;
    
    _clearButton.rac_command = _viewModel.clearCommand;
    
    UIColor *(^colorChangeBlock)(NSNumber *) = ^(NSNumber *pass) {
        return [pass boolValue]? [UIColor blackColor] : [UIColor redColor];
    };
    
    RAC(_passwordTextField,textColor) = [[_viewModel.verifyPasswordSignal distinctUntilChanged] map:colorChangeBlock];
    
    RAC(_phoneTextField,textColor) = [[_viewModel.verifyPhoneSignal distinctUntilChanged] map:colorChangeBlock];
}



@end
