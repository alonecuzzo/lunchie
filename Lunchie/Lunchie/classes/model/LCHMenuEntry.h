//
//  LCHMenuItem.h
//  Lunchie
//
//  Created by Jabari on 11/21/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCHMenuEntry : NSObject

- (instancetype)initWithDictionary:(NSDictionary*)dict;

@property(nonatomic) NSString *entryName;
@property(nonatomic) NSString *entryID;
@property(nonatomic) NSString *entryDescription;
@property(nonatomic) NSString *price;

@end
