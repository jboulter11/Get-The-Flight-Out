//
//  GTFONumberTableViewCell.m
//  GTFOButton
//
//  Created by Jim Boulter on 11/7/15.
//  Copyright © 2015 JimBoulter. All rights reserved.
//

#import "GTFONumberTableViewCell.h"

@interface GTFONumberTableViewCell()
@property UITextField* entryTextField;
@property UILabel* label;
@property GTFONumberMode mode;
@end

@implementation GTFONumberTableViewCell
@synthesize entryTextField, label;

-(instancetype)initWithMode:(GTFONumberMode)mode
{
    self = [super init];
    if(self)
    {
        self.mode = mode;
        
        entryTextField = [[UITextField alloc] init];
        [entryTextField setText:(!mode ? @"7" : @"1000")];
        [entryTextField setTextAlignment:NSTextAlignmentCenter];
        [entryTextField setDelegate:self];
        
        label = [[UILabel alloc] init];
        [label setText:(!mode ? @"Max nights:" : @"Max Price ($):")];
        
        [self.view addSubview:entryTextField];
        [self.view addSubview:label];
        
        [entryTextField.layer setBorderColor:[[UIColor lightGrayColor] CGColor]];
        [entryTextField.layer setBorderWidth:2.0f];
        [entryTextField.layer setCornerRadius:[GTFOExec cornerRadius]];
        
        [entryTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view.mas_centerX);
            make.centerY.equalTo(self.view.mas_centerY);
            make.height.equalTo(@44);
            make.width.equalTo(@80);
        }];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view.mas_top).with.offset(15);
            make.left.equalTo(self.view.mas_left).with.offset(15);
        }];
    }
    return self;
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if(self.mode == GTFONumberModePrice)[[GTFOExec exec] setNights:@([textField.text intValue])];
    else [[GTFOExec exec] setPrice:@([textField.text intValue])];
    
}
@end
