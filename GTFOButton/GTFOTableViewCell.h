//
//  GTFOTableViewCell.h
//  GTFOButton
//
//  Created by Jim Boulter on 11/7/15.
//  Copyright © 2015 JimBoulter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTFOExec.h"

@interface GTFOTableViewCell : UITableViewCell
@property UIView* view;

+(NSString*)classString;
-(NSString *)reuseIdentifier;
@end
