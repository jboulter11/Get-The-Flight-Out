//
//  GTFOExec.h
//  GTFOButton
//
//  Created by Jim Boulter on 11/7/15.
//  Copyright © 2015 JimBoulter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "Masonry.h"


@interface GTFOExec : NSObject

@property NSArray* origins;
@property NSString* dest;
@property NSNumber* nights;
@property NSNumber* price;
@property NSNumber* uber;

+(GTFOExec*)exec;
+(AFHTTPSessionManager*)sessionManager;
+(NSInteger)cornerRadius;

-(void)savePreferences;

@end
