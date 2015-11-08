//
//  GTFOExec.m
//  GTFOButton
//
//  Created by Jim Boulter on 11/7/15.
//  Copyright © 2015 JimBoulter. All rights reserved.
//

#import "GTFOExec.h"

@interface GTFOExec ()

@end

@implementation GTFOExec
@synthesize origins, dest, nights, price, uber;

+(GTFOExec*) exec
{
    static GTFOExec* exec = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        exec = [[GTFOExec alloc] init];
        exec.origins = @[@"BOS"];
        exec.dest = nil;
        exec.nights = @7;
        exec.price = @2000;
        exec.uber = @1;
    });
    return exec;
}

+(AFHTTPSessionManager*)sessionManager
{
    static AFHTTPSessionManager* netExec = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        netExec = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://gettheflightout.azurewebsites.net/api/"]];
        netExec.responseSerializer = [AFJSONResponseSerializer serializer];
        netExec.responseSerializer.acceptableContentTypes = [netExec.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
        AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        securityPolicy.allowInvalidCertificates = YES;
        netExec.securityPolicy = securityPolicy;
    });
    return netExec;
}

+(NSInteger)cornerRadius
{
    return 6;
}

#pragma mark - Networking

-(void)savePreferences
{
    //Send request
    [[GTFOExec sessionManager] PUT:@"users/prefs" parameters:@{@"origin":origins, @"maxNights":nights, @"maxPrice":price} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        //yay
        NSLog(@"Success");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //oh damn
        NSLog(@"%@", task.response);
    }];
}

@end
