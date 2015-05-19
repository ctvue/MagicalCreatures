//
//  MagicalCreature.h
//  MCMS
//
//  Created by Chee Vue on 5/19/15.
//  Copyright (c) 2015 Chee Vue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MagicalCreature : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *detail;

-(instancetype)initWithFullName:(NSString *)name;
-(instancetype)initWithFullName:(NSString *)name detailDescription:(NSString *)detail;

@end
