//
//  IMCItem.h
//  ImaginamosTest
//
//  Created by Gabriel Afonso on 3/6/15.
//  Copyright (c) 2015 Gabriel Afonso. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "IMManagedObjectFactory.h"

@class IMImage, IMSubcategory;

@interface IMCItem : IMManagedObjectFactory

@property (nonatomic, retain) NSString * itemDescription;
@property (nonatomic, retain) NSNumber * itemId;
@property (nonatomic, retain) NSString * name;
@property (nonatomic) BOOL itemEnabled;
@property (nonatomic, retain) IMImage *itemImage;
@property (nonatomic, retain) IMSubcategory *subcategory;

- (NSString *)itemDescriptionCleaned;

@end
