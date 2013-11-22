//
//  LCHTwitterService.m
//  Lunchie
//
//  Created by Jabari on 11/22/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "LCHTwitterService.h"

@implementation LCHTwitterService

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)screenameFromTwitterWithCompletionBlock:(void (^)(NSString*))completionBlock
{
    ACAccountStore *acct = [[ACAccountStore alloc] init];
    ACAccountType *acctType = [acct accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    
    [acct requestAccessToAccountsWithType:acctType options:nil completion:^(BOOL granted, NSError *error) {
        if (granted == YES) {
            NSArray *arrayOfAccts = [acct accountsWithAccountType:acctType];
            if ([arrayOfAccts count] > 0) {
                ACAccount *twitterAcct = [arrayOfAccts lastObject];
                NSURL *requestURL = [NSURL URLWithString:@"https://api.twitter.com/1.1/account/settings.json"];
                
                SLRequest *postRequest = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodGET URL:requestURL parameters:nil];
                postRequest.account = twitterAcct;
                [postRequest performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
                    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error];
                    completionBlock([json objectForKey:@"screen_name"]);
                }];
            }
        }
    }];
}

@end
