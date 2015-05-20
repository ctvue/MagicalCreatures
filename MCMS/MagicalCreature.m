//
//  MagicalCreature.m
//  MCMS
//
//  Created by Chee Vue on 5/19/15.
//  Copyright (c) 2015 Chee Vue. All rights reserved.
//

#import "MagicalCreature.h"

@implementation MagicalCreature

-(instancetype)initWithFullName:(NSString *)name {
    self = [super init];
    self.name = name;

    return self;
}

-(instancetype)initWithFullName:(NSString *)name detailDescription:(NSString *)detail {
    self = [super init];
    self.name = name;
    self.detail = detail;

    return self;
}

-(instancetype)initWithFullName:(NSString *)name detailDescription:(NSString *)detail accesoryList:(NSMutableArray *)accessory{
    self = [super init];
    self.name = name;
    self.detail = detail;
    self.accessories = accessory;
    return self;
}

-(instancetype)initWithFullName:(NSString *)name detailDescription:(NSString *)detail withPicture:(NSString *)picture{
    self = [super init];
    self.name = name;
    self.detail = detail;
    self.picture = picture;
    return self;

}

-(instancetype)initWithFullName:(NSString *)name detailDescription:(NSString *)detail accesoryList:(NSMutableArray *)accessory withPicture:(NSString *)picture{
    self = [super init];
    self.name = name;
    self.detail = detail;
    self.accessories = accessory;
    self.picture = picture;
    return self;

}
@end
