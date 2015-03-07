//
//  IMCategoryBuilder.m
//  ImaginamosTest
//
//  Created by Gabriel Afonso on 3/6/15.
//  Copyright (c) 2015 Gabriel Afonso. All rights reserved.
//

#import "IMCategoryBuilder.h"
#import "IMCategory.h"
#import "IMCConstants.h"
#import "IMImage.h"
#import "IMImageBuilder.h"
#import "IMCItem.h"
#import "IMSubcategory.h"
#import "IMConnectionService.h"

@implementation IMCategoryBuilder

- (id)buildFromDictionary:(NSDictionary*)dictionary {

    if (dictionary == nil) {
        return nil;
    } else if (dictionary == (NSDictionary*)[NSNull null]) {
        return nil;
    }
    
    __block NSError* error = nil;
    __block IMCategory* category = nil;
    
    [self.context.managedObjectContext performBlockAndWait:^{
        NSEntityDescription* description = [NSEntityDescription entityForName:NSStringFromClass([IMCategory class]) inManagedObjectContext:self.context.managedObjectContext];
        
        NSFetchRequest* fetchRequest = [[NSFetchRequest alloc] init];
        fetchRequest.entity = description;
        fetchRequest.predicate = [NSPredicate predicateWithFormat:@"categoryId == %@", dictionary[kId]];
        NSArray* objects = [self.context.managedObjectContext executeFetchRequest:fetchRequest error:&error];
        
        if (objects.count == 0) {
            category = [IMCategory createFromManagedObject:self.context.managedObjectContext];
        } else {
            category = objects.firstObject;
        }

        category.categoryId = [NSNumber numberWithInteger:[dictionary[kId] integerValue]];
        category.name = [dictionary[kName] capitalizedString];
        
        if (dictionary[kImagePath] && dictionary[kImagePath] != [NSNull null]) {
            category.categoryImage = [self.context build:NSStringFromClass([IMImage class]) fromDictionary:dictionary];
        }
        
        if (dictionary[kSubcategory] && dictionary[kSubcategory] != [NSNull null]) {
            for (NSDictionary *subcategoryDict in dictionary[kSubcategory]) {
                IMSubcategory *subcategory = [self.context build:NSStringFromClass([IMSubcategory class]) fromDictionary:subcategoryDict];
                if (subcategory) {
                    [category addSubcategoriesObject:subcategory];
                }
            }
        }
        
        BOOL result = [self.context.managedObjectContext save:&error];
        
        if (!result) {
            NSLog(@"[IMCategoryBuilder] there was an error saving the object: %@", error);
        }
    }];
    
    return category;
}

@end
