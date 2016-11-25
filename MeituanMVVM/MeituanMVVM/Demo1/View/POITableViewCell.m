//
//  POITableViewCell.m
//  MeituanMVVMDemo
//
//  Created by 蔡欣东 on 2016/11/19.
//  Copyright © 2016年 蔡欣东. All rights reserved.
//

#import "POITableViewCell.h"
#import "POICellViewModel.h"

@interface POITableViewCell()

@property (nonatomic) POICellViewModel *viewModel;

@end

@implementation POITableViewCell

- (void)bindWithViewModel:(POICellViewModel *)viewModel {
    RAC(_POITitleLabel,text) = [viewModel.titleSignal takeUntil:self.rac_prepareForReuseSignal];
    RAC(_POIPriceLabel,attributedText) = [viewModel.priceSignal takeUntil:self.rac_prepareForReuseSignal];
    RAC(_POIFooterLabel,text) = [viewModel.footerSignal takeUntil:self.rac_prepareForReuseSignal];
    RAC(_POICampaignLabel,text) = [viewModel.campaignSignal takeUntil:self.rac_prepareForReuseSignal];
    RAC(_POICampaignLabel,hidden) = [viewModel.campaignHiddenSignal takeUntil:self.rac_prepareForReuseSignal];
    RAC(_POIImageView,image) = [viewModel.imgSignal takeUntil:self.rac_prepareForReuseSignal];
    
    _viewModel = viewModel;
}

@end
