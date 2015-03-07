//
//  IMSubcategoryBuilder.m
//  ImaginamosTest
//
//  Created by Gabriel Afonso on 3/6/15.
//  Copyright (c) 2015 Gabriel Afonso. All rights reserved.
//

#import "IMSubcategoryBuilder.h"
#import "IMSubcategory.h"
#import "IMCConstants.h"
#import "IMCItem.h"

@implementation IMSubcategoryBuilder

- (id)buildFromDictionary:(NSDictionary*)dictionary {

    if (dictionary == nil) {
        return nil;
    } else if (dictionary == (NSDictionary*)[NSNull null]) {
        return nil;
    }
    
    __block NSError* error = nil;
    __block IMSubcategory* subcategory = nil;
    
    [self.context.managedObjectContext performBlockAndWait:^{
        NSEntityDescription* description = [NSEntityDescription entityForName:NSStringFromClass([IMSubcategory class]) inManagedObjectContext:self.context.managedObjectContext];
        
        NSFetchRequest* fetchRequest = [[NSFetchRequest alloc] init];
        fetchRequest.entity = description;
        fetchRequest.predicate = [NSPredicate predicateWithFormat:@"subcategoryId == %@", dictionary[kId]];
        NSArray* objects = [self.context.managedObjectContext executeFetchRequest:fetchRequest error:&error];
        
        if (objects.count == 0) {
            subcategory = [IMSubcategory createFromManagedObject:self.context.managedObjectContext];
        } else {
            subcategory = objects.firstObject;
        }
        
        subcategory.subcategoryId = [NSNumber numberWithInteger:[dictionary[kId] integerValue]];
        subcategory.name = [dictionary[kName] capitalizedString];
        
        if (dictionary[kCItems] && dictionary[kCItems] != [NSNull null]) {
            for (NSDictionary *itemsDict in dictionary[kCItems]) {
                IMCItem *item = [self.context build:NSStringFromClass([IMCItem class]) fromDictionary:itemsDict];
                if (item) {
                    [subcategory addItemsObject:item];
                }
            }
        }
        
        BOOL result = [self.context.managedObjectContext save:&error];
        
        if (!result) {
            NSLog(@"[IMSubcategoryBuilder] there was an error saving the object: %@", error);
        }
    }];
    
    return subcategory;
}

@end
