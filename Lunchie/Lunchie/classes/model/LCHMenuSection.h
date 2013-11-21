//
//  LCHMenuSection.h
//  Lunchie
//
//  Created by Jabari on 11/21/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCHMenuSection : NSObject

- (instancetype)initWithDictionary:(NSDictionary*)dict;

@property(nonatomic) NSString *sectionName;
@property(nonatomic) NSString *sectionID;
@property(nonatomic) NSArray *entries;

@end
