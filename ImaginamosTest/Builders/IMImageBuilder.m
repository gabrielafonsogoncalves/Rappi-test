//
//  IMImageBuilder.m
//  ImaginamosTest
//
//  Created by Gabriel Afonso on 3/6/15.
//  Copyright (c) 2015 Gabriel Afonso. All rights reserved.
//

#import "IMImageBuilder.h"
#import "IMImage.h"
#import "IMCConstants.h"

@implementation IMImageBuilder

- (id)buildFromDictionary:(NSDictionary*)dictionary {

    if (dictionary == nil) {
        return nil;
    } else if (dictionary == (NSDictionary*)[NSNull null]) {
        return nil;
    }
    
    __block NSError* error = nil;
    __block IMImage* image = nil;
    
    [self.context.managedObjectContext performBlockAndWait:^{
        NSEntityDescription* description = [NSEntityDescription entityForName:NSStringFromClass([IMImage class]) inManagedObjectContext:self.context.managedObjectContext];
        
        NSFetchRequest* fetchRequest = [[NSFetchRequest alloc] init];
        fetchRequest.entity = description;
        fetchRequest.predicate = [NSPredicate predicateWithFormat:@"imageUrl == %@", dictionary[kImagePath]];
        NSArray* objects = [self.context.managedObjectContext executeFetchRequest:fetchRequest error:&error];
        
        if (objects.count == 0) {
            image = [IMImage createFromManagedObject:self.context.managedObjectContext];
        } else {
            image = objects.firstObject;
        }
        
        image.imageUrl = dictionary[kImagePath];
        BOOL result = [self.context.managedObjectContext save:&error];
        
        if (!result) {
            NSLog(@"[IMImageBuilder] there was an error saving the object: %@", error);
        }
    }];
    
    return image;
}

@end
