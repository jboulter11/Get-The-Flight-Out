//
//  GTFOUberTableViewCell.m
//  GTFOButton
//
//  Created by Jim Boulter on 11/7/15.
//  Copyright © 2015 JimBoulter. All rights reserved.
//

#import "GTFOUberTableViewCell.h"

@interface GTFOUberTableViewCell()

@property UILabel* label;
@property UISwitch* uberSwitch;

@end

@implementation GTFOUberTableViewCell
@synthesize label, uberSwitch;

-(instancetype)init
{
    self = [super init];
    if(self)
    {
        uberSwitch = [[UISwitch alloc] init];
        [uberSwitch addTarget:self action:@selector(switchTriggered) forControlEvents:UIControlEventValueChanged];
        
        label = [[UILabel alloc] init];
        [label setText:@"Send Uber to pick me up!"];
        
        UIEdgeInsets padding = UIEdgeInsetsMake(10, 10, -10, -10);
        
        [self.view addSubview:uberSwitch];
        [uberSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.view.mas_right).with.offset(1.5*padding.right);
            make.centerY.equalTo(self.view.mas_centerY);
        }];
        
        [self.view addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view.mas_left).with.offset(1.5*padding.left);
            make.top.equalTo(self.view.mas_top).with.offset(padding.top);
            make.bottom.equalTo(self.view.mas_bottom).with.offset(padding.bottom);
            make.right.equalTo(uberSwitch.mas_left).with.offset(padding.right);
        }];
    }
    return self;
}

-(void)switchTriggered
{
    [[GTFOExec exec] setUber:@(uberSwitch.isOn)];
}

@end
