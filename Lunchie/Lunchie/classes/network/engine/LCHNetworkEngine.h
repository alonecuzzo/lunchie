//
//  LCHNetworkEngine.h
//  Lunchie
//
//  Created by Jabari on 11/20/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "RSOAuthEngine/RSOAuthEngine.h"

@interface LCHNetworkEngine : RSOAuthEngine

- (NSString*)consumerKey;
- (NSString*)consumerSecret;
- (NSString*)token;
- (NSString*)tokenSecret;

@end
