//
//  IMManagedObjectFactory.m
//  ImaginamosTest
//
//  Created by Gabriel Afonso on 3/6/15.
//  Copyright (c) 2015 Gabriel Afonso. All rights reserved.
//

#import "IMManagedObjectFactory.h"

@implementation IMManagedObjectFactory

+ (id)createFromManagedObject:(NSManagedObjectContext *)managedObjectContext {

    NSEntityDescription* description = [NSEntityDescription entityForName:NSStringFromClass([self class]) inManagedObjectContext:managedObjectContext];
    return [[self alloc] initWithEntity:description insertIntoManagedObjectContext:managedObjectContext];
}

@end
