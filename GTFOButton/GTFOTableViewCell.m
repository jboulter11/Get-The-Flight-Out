//
//  GTFOTableViewCell.m
//  GTFOButton
//
//  Created by Jim Boulter on 11/7/15.
//  Copyright © 2015 JimBoulter. All rights reserved.
//

#import "GTFOTableViewCell.h"

@implementation GTFOTableViewCell
@synthesize view;

-(instancetype)init
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[self reuseIdentifier]];
    if(self)
    {
        view = self.contentView;
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
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

@end
