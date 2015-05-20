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
@property (nonatomic) NSMutableArray *accessories;
@property (nonatomic) NSString *picture;

-(instancetype)initWithFullName:(NSString *)name;
-(instancetype)initWithFullName:(NSString *)name detailDescription:(NSString *)detail;
-(instancetype)initWithFullName:(NSString *)name detailDescription:(NSString *)detail withPicture:(NSString *)picture;
-(instancetype)initWithFullName:(NSString *)name detailDescription:(NSString *)detail accesoryList:(NSMutableArray *)accessory;
-(instancetype)initWithFullName:(NSString *)name detailDescription:(NSString *)detail accesoryList:(NSMutableArray *)accessory withPicture:(NSString *)picture;

@end
