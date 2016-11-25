//
//  Demo1ViewController.m
//  MeituanMVVM
//
//  Created by 蔡欣东 on 2016/11/20.
//  Copyright © 2016年 蔡欣东. All rights reserved.
//

#import "Demo1ViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "BaseCellViewModel.h"
#import "BaseTableViewCell.h"
#import "Demo1ViewModel.h"

@interface Demo1ViewController ()
@property (nonatomic) Demo1ViewModel *viewModel;
@property (nonatomic) NSArray *cellViewModelArray;
@end

@implementation Demo1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _viewModel = [[Demo1ViewModel alloc] init];
    [self.tableView registerNib:[UINib nibWithNibName:@"POITableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"POITableViewCell"];
    self.refreshControl.rac_command = _viewModel.loadDataCommand;
    [self.refreshControl beginRefreshing];
    
    [self rac_liftSelector:@selector(showError:) withSignals:_viewModel.errorSignal, nil];
    [self rac_liftSelector:@selector(refreshTableView:) withSignals:_viewModel.dataSignal, nil];

    [_viewModel.loadDataCommand execute:nil];
}

- (void)showError:(NSError *)error {
    [self.refreshControl endRefreshing];
    self.cellViewModelArray = nil;
    [self.tableView reloadData];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:error.description preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction *_Nonnull action) {
    }]];
    
    [self presentViewController:alertController animated:YES completion:^{
    }];
    
}

- (void)refreshTableView:(NSArray *)cellViewModelArray {
    self.cellViewModelArray = cellViewModelArray;
    [self.tableView reloadData];
    [self.refreshControl endRefreshing];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _cellViewModelArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BaseCellViewModel *cellViewModel = self.cellViewModelArray[indexPath.row];
    NSString *cellName = cellViewModel.cellName;
    BaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    [cell bindWithViewModel:cellViewModel];
    
    return cell;
}




@end
