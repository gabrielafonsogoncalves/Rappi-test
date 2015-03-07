//
//  IMImage.h
//  ImaginamosTest
//
//  Created by Gabriel Afonso on 3/6/15.
//  Copyright (c) 2015 Gabriel Afonso. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "IMManagedObjectFactory.h"

@class IMCategory, IMCItem;

@interface IMImage : IMManagedObjectFactory

@property (nonatomic, retain) NSNumber * imageId;
@property (nonatomic, retain) NSString * imageLocalPath;
@property (nonatomic, retain) NSString * imageUrl;
@property (nonatomic) BOOL downloaded;
@property (nonatomic, retain) IMCategory *category;
@property (nonatomic, retain) IMCItem *item;

@end
