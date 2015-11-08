//
//  GTFOPickerTableViewCell.m
//  GTFOButton
//
//  Created by Jim Boulter on 11/7/15.
//  Copyright © 2015 JimBoulter. All rights reserved.
//

#import "GTFOPickerTableViewCell.h"

@interface GTFOPickerTableViewCell()
@property UIPickerView* picker;
@property UILabel* label;
@property NSArray* data;
@end

@implementation GTFOPickerTableViewCell
@synthesize picker, view, label, data;

-(instancetype)initWithMode:(GTFOPickerMode)mode
{
    self = [super init];
    if(self)
    {
        view = self.contentView;
        
        data = (mode ? @[@"Surprise me!"] : @[@"ABQ", @"ACK", @"ANC", @"AUA", @"AUS", @"AZS", @"BDA", @"BDL", @"BGI", @"BOG", @"BOS", @"BQN", @"BTV", @"BUF", @"BUR", @"BWI", @"CHS", @"CLE", @"CLT", @"CTG", @"CUN", @"CUR", @"DCA", @"DEN", @"DFW", @"DTW", @"EWR", @"FLL", @"GCM", @"GND", @"HOU", @"HPN", @"HYA", @"IAD", @"JAX", @"JFK", @"KIN", @"LAS", @"LAX", @"LGA", @"LGB", @"LIM", @"LIR", @"LRM", @"MBJ", @"MCO", @"MDE", @"MSY", @"MVY", @"NAS", @"OAK", @"ORD", @"ORH", @"PAP", @"PBI", @"PDX", @"PHL", @"PHX", @"PIT", @"PLS", @"POP", @"POS", @"PSE", @"PUJ", @"PVD", @"PWM", @"RDU", @"RIC", @"RNO", @"ROC", @"RSW", @"SAV", @"SDQ", @"SEA", @"SFO", @"SJC", @"SJO", @"SJU", @"SLC", @"SMF", @"SRQ", @"STI", @"STT", @"STX", @"SWF", @"SXM", @"SYR", @"TPA", @" UV"]);
        
        label = [[UILabel alloc] init];
        [label setText:(mode ? @"Where to:" : @"Where from:")];
        
        picker = [[UIPickerView alloc] init];
        picker.delegate = self;
        picker.dataSource = self;
        
        [self.view addSubview:label];
        [self.view addSubview:picker];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view.mas_top).with.offset(15);
            make.left.equalTo(self.view.mas_left).with.offset(15);
            make.right.equalTo(self.view.mas_right);
            make.bottom.equalTo(picker.mas_top);
        }];
        
        [picker mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(label.mas_bottom);
            make.left.equalTo(self.view.mas_left);
            make.right.equalTo(self.view.mas_right);
            make.bottom.equalTo(self.view.mas_bottom);
        }];
    }
    
    return self;
}

+(NSString*)classString
{
    return NSStringFromClass([self class]);
}

-(NSString *)reuseIdentifier
{
    return NSStringFromClass([self class]);
}

#pragma mark - UIPickerViewDelegate

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 25.0f;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return (self.view.bounds.size.width - 30.0f) / [self numberOfComponentsInPickerView:picker];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return data[row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if([label.text isEqualToString:@"Where from:"])
    {
        [[GTFOExec exec] setOrigins:@[data[row]]];
    }
}

#pragma mark - UIPickerViewDataSource

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return data.count;
}

@end
