//
//  IMManagedObjectFactory.h
//  ImaginamosTest
//
//  Created by Gabriel Afonso on 3/6/15.
//  Copyright (c) 2015 Gabriel Afonso. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface IMManagedObjectFactory : NSManagedObject

+ (id)createFromManagedObject:(NSManagedObjectContext *)managedObjectContext;

@end
