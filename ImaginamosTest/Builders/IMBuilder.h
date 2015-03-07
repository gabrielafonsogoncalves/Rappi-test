//
//  IMBuilder.h
//  ImaginamosTest
//
//  Created by Gabriel Afonso on 3/6/15.
//  Copyright (c) 2015 Gabriel Afonso. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface IMBuilder : NSObject

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (id)build:(NSString*)className fromDictionary:(NSDictionary*)dictionary;
- (id)builderForClass:(NSString *)className;

@end
