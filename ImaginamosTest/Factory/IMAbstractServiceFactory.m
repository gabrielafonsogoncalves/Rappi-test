//
//  IMAbstractServiceFactory.m
//  ImaginamosTest
//
//  Created by Gabriel Afonso on 3/6/15.
//  Copyright (c) 2015 Gabriel Afonso. All rights reserved.
//

#import "IMAbstractServiceFactory.h"

@implementation IMAbstractServiceFactory

- (id)initWithObjectContext:(NSManagedObjectContext*)managedObjectContext
{
    self = [super init];
    
    if (self) {
        self.managedObjectContext = managedObjectContext;
        self.builder = [[IMBuilder alloc] init];
        self.builder.managedObjectContext = _managedObjectContext;
    }
    
    return self;
}

@end
