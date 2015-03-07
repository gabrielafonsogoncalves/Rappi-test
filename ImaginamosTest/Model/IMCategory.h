//
//  IMCategory.h
//  ImaginamosTest
//
//  Created by Gabriel Afonso on 3/6/15.
//  Copyright (c) 2015 Gabriel Afonso. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "IMManagedObjectFactory.h"

@class IMImage;

@interface IMCategory : IMManagedObjectFactory

@property (nonatomic, retain) NSNumber * categoryId;
@property (nonatomic, retain) NSNumber * enabled;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) IMImage *categoryImage;
@property (nonatomic, retain) NSSet *subcategories;
@end

@interface IMCategory (CoreDataGeneratedAccessors)

- (void)addSubcategoriesObject:(NSManagedObject *)value;
- (void)removeSubcategoriesObject:(NSManagedObject *)value;
- (void)addSubcategories:(NSSet *)values;
- (void)removeSubcategories:(NSSet *)values;

@end
