//
//  LCHMenu.h
//  Lunchie
//
//  Created by Jabari on 11/21/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCHMenu : NSObject

@property(nonatomic) NSString *menuName;
@property(nonatomic) NSString *menuID;
@property(nonatomic) NSArray *sections;

- (instancetype)initWithDictionary:(NSDictionary*)dict;

@end
