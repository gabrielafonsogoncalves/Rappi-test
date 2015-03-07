//
//  IMItemBuilder.m
//  ImaginamosTest
//
//  Created by Gabriel Afonso on 3/6/15.
//  Copyright (c) 2015 Gabriel Afonso. All rights reserved.
//

#import "IMItemBuilder.h"
#import "IMCItem.h"
#import "IMCConstants.h"
#import "IMImage.h"

@implementation IMItemBuilder

- (id)buildFromDictionary:(NSDictionary*)dictionary {
    
    if (dictionary == nil) {
        return nil;
    } else if (dictionary == (NSDictionary*)[NSNull null]) {
        return nil;
    }
    
    __block NSError* error = nil;
    __block IMCItem* item = nil;
    
    [self.context.managedObjectContext performBlockAndWait:^{
        NSEntityDescription* description = [NSEntityDescription entityForName:NSStringFromClass([IMCItem class]) inManagedObjectContext:self.context.managedObjectContext];
        
        NSFetchRequest* fetchRequest = [[NSFetchRequest alloc] init];
        fetchRequest.entity = description;
        fetchRequest.predicate = [NSPredicate predicateWithFormat:@"itemId == %@", dictionary[kId]];
        NSArray* objects = [self.context.managedObjectContext executeFetchRequest:fetchRequest error:&error];
        
        if (objects.count == 0) {
            item = [IMCItem createFromManagedObject:self.context.managedObjectContext];
        } else {
            item = objects.firstObject;
        }
        
        item.itemId = [NSNumber numberWithInteger:[dictionary[kId] integerValue]];
        item.name = [dictionary[kName] capitalizedString];
        item.itemDescription = dictionary[kDescription];
        item.itemEnabled = dictionary[kEnabled];
        
        if (dictionary[kImagePath] && dictionary[kImagePath] != [NSNull null]) {
            item.itemImage = [self.context build:NSStringFromClass([IMImage class]) fromDictionary:dictionary];
        }
        
        BOOL result = [self.context.managedObjectContext save:&error];
        
        if (!result) {
            NSLog(@"[IMSubcategoryBuilder] there was an error saving the object: %@", error);
        }
    }];
    
    return item;
}

@end
