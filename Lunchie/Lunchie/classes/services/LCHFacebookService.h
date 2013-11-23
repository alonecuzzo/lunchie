//
//  LCHFacebookService.h
//  Lunchie
//
//  Created by Jabari on 11/22/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Social/Social.h>
#import <Accounts/Accounts.h>

@interface LCHFacebookService : NSObject

- (void)fullnameFromFacebookWithCompletionBlock:(void (^)(NSString*))completionBlock;

@end
