//
//  GTFOButtonTableViewCell.m
//  GTFOButton
//
//  Created by Jim Boulter on 11/7/15.
//  Copyright © 2015 JimBoulter. All rights reserved.
//

#import "GTFOButtonTableViewCell.h"

@interface GTFOButtonTableViewCell ()
@property UIButton* button;
@end

@implementation GTFOButtonTableViewCell
@synthesize button;

-(instancetype)init
{
    self = [super init];
    if(self)
    {
        button = [[UIButton alloc] init];
        [button setTitle:@"Save Preferences" forState:UIControlStateNormal];
        [button.layer setCornerRadius:[GTFOExec cornerRadius]];
        button.backgroundColor = [UIColor colorWithRed:0.02 green:0.35 blue:0.66 alpha:1];
        
        [button addTarget:self action:@selector(save) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:button];
        
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(15, 15, 15, 15));
        }];
    }
    return self;
}

-(void)save
{
    [[GTFOExec exec] savePreferences];
}

@end
