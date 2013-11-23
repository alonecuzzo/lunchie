//
//  LCHSocialManager.m
//  Lunchie
//
//  Created by Jabari on 11/22/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "LCHSocialManager.h"
#import "LCHFacebookService.h"
#import "LCHTwitterService.h"


@implementation LCHSocialManager

- (void)fullnameFromFacebookWithCompletionBlock:(void (^)(NSString*))completionBlock
{
    LCHFacebookService *fbService = [[LCHFacebookService alloc] init];
    [fbService fullnameFromFacebookWithCompletionBlock:completionBlock];
}

- (void)screenameFromTwitterWithCompletionBlock:(void (^)(NSString*))completionBlock
{
    LCHTwitterService *twitterService = [[LCHTwitterService alloc] init];
    [twitterService screenameFromTwitterWithCompletionBlock:completionBlock];
}

@end
