//
//  LCHModel.h
//  Lunchie
//
//  Created by Jabari on 11/21/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCHModel : NSObject

@property(nonatomic) NSArray *venues;

+ (id)sharedInstance;

@end
