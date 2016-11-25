//
//  POITableViewCell.h
//  MeituanMVVMDemo
//
//  Created by 蔡欣东 on 2016/11/19.
//  Copyright © 2016年 蔡欣东. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface POITableViewCell : BaseTableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *POIImageView;

@property (weak, nonatomic) IBOutlet UILabel *POITitleLabel;

@property (weak, nonatomic) IBOutlet UILabel *POIPriceLabel;

@property (weak, nonatomic) IBOutlet UILabel *POICampaignLabel;

@property (weak, nonatomic) IBOutlet UILabel *POIFooterLabel;

@end
