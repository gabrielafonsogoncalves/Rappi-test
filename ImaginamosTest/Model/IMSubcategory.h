//
//  IMSubcategory.h
//  ImaginamosTest
//
//  Created by Gabriel Afonso on 3/6/15.
//  Copyright (c) 2015 Gabriel Afonso. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "IMManagedObjectFactory.h"

@class IMCategory, IMCItem;

@interface IMSubcategory : IMManagedObjectFactory

@property (nonatomic, retain) NSNumber * enabled;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * subcategoryId;
@property (nonatomic, retain) IMCategory *category;
@property (nonatomic, retain) NSSet *items;
@end

@interface IMSubcategory (CoreDataGeneratedAccessors)

- (void)addItemsObject:(IMCItem *)value;
- (void)removeItemsObject:(IMCItem *)value;
- (void)addItems:(NSSet *)values;
- (void)removeItems:(NSSet *)values;

@end
