//
//  InterfaceController.m
//  GTFOButton WatchKit Extension
//
//  Created by Jim Boulter on 11/7/15.
//  Copyright © 2015 JimBoulter. All rights reserved.
//

#import "InterfaceController.h"
#import "AFNetworking.h"

#define AF_APP_EXTENSIONS

@interface InterfaceController()

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (IBAction)gtfo
{
    //THIS IS NOT A DRILL
    
    AFHTTPSessionManager* netExec = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://gettheflightout.azurewebsites.net/api/"]];
    netExec.responseSerializer = [AFJSONResponseSerializer serializer];
    netExec.responseSerializer.acceptableContentTypes = [netExec.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    securityPolicy.allowInvalidCertificates = YES;
    netExec.securityPolicy = securityPolicy;
    
    [netExec GET:@"flights/getaway" parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        //yay
        NSLog(@"YAY");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //noooo
        NSLog(@"%@", task.response);
    }];
}

@end



