//
//  LCHSocialManager.h
//  Lunchie
//
//  Created by Jabari on 11/22/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCHSocialManager : NSObject

- (void)fullnameFromFacebookWithCompletionBlock:(void (^)(NSString*))completionBlock;
- (void)screenameFromTwitterWithCompletionBlock:(void (^)(NSString*))completionBlock;

@end
