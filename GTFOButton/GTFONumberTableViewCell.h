//
//  GTFONumberTableViewCell.h
//  GTFOButton
//
//  Created by Jim Boulter on 11/7/15.
//  Copyright © 2015 JimBoulter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTFOTableViewCell.h"

typedef enum : NSUInteger {
    GTFONumberModeNights,
    GTFONumberModePrice,
} GTFONumberMode;

@interface GTFONumberTableViewCell : GTFOTableViewCell <UITextFieldDelegate>

-(instancetype)initWithMode:(GTFONumberMode)mode;

@end
