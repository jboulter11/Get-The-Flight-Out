//
//  GTFOPickerTableViewCell.h
//  GTFOButton
//
//  Created by Jim Boulter on 11/7/15.
//  Copyright © 2015 JimBoulter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTFOExec.h"
#import "GTFOTableViewCell.h"

typedef enum : NSUInteger {
    GTFOPickerModeFrom,
    GTFOPickerModeTo,
} GTFOPickerMode;

@interface GTFOPickerTableViewCell : GTFOTableViewCell <UIPickerViewDelegate, UIPickerViewDataSource>
@property UIView* view;

-(instancetype)initWithMode:(GTFOPickerMode)mode;
@end
