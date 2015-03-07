//
//  IMAbstractServiceFactory.h
//  ImaginamosTest
//
//  Created by Gabriel Afonso on 3/6/15.
//  Copyright (c) 2015 Gabriel Afonso. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IMBuilder.h"

@interface IMAbstractServiceFactory : NSObject

@property (nonatomic, retain) IMBuilder* builder;
@property (nonatomic, retain) NSManagedObjectContext* managedObjectContext;

- (id)initWithObjectContext:(NSManagedObjectContext*)managedObjectContext;

@end
