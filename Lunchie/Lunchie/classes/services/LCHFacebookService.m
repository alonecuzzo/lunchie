//
//  LCHFacebookService.m
//  Lunchie
//
//  Created by Jabari on 11/22/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "LCHFacebookService.h"

@implementation LCHFacebookService

- (void)fullnameFromFacebookWithCompletionBlock:(void (^)(NSString*))completionBlock
{
    ACAccountStore *acct = [[ACAccountStore alloc] init];
    ACAccountType *acctType = [acct accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierFacebook];
    NSDictionary *options = @{
                      ACFacebookAppIdKey: @"608147799242223",
                      ACFacebookPermissionsKey: @[@"user_about_me", @"email"],
                      ACFacebookAudienceKey: ACFacebookAudienceFriends
                  };
    
    [acct requestAccessToAccountsWithType:acctType options:options completion:^(BOOL granted, NSError *error) {
        if (granted == YES) {
            NSArray *arrayOfAccts = [acct accountsWithAccountType:acctType];
            if ([arrayOfAccts count] > 0) {
                ACAccount *facebookAcct = [arrayOfAccts lastObject];
                NSURL *requestURL = [NSURL URLWithString:@"https://graph.facebook.com/me"];
                NSString *acessToken = [NSString stringWithFormat:@"%@",facebookAcct.credential.oauthToken];
                NSDictionary *parameters = @{@"access_token": acessToken};
                SLRequest *postRequest = [SLRequest requestForServiceType:SLServiceTypeFacebook requestMethod:SLRequestMethodGET URL:requestURL parameters:parameters];
                postRequest.account = facebookAcct;
                [postRequest performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
                    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error];
                    completionBlock([NSString stringWithFormat:@"%@ %@", [json objectForKey:@"first_name"], [json objectForKey:@"last_name"]]);
                }];
            }
        } else {
            NSLog(@"error.localizedDescription======= %@", error.localizedDescription);
        }
    }];
}

@end
