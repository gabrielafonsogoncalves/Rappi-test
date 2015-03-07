//
//  IMSubcategoryService.m
//  ImaginamosTest
//
//  Created by Gabriel Afonso on 3/7/15.
//  Copyright (c) 2015 Gabriel Afonso. All rights reserved.
//

#import "IMSubcategoryService.h"
#import "IMConnectionService.h"
#import "IMCategory.h"
#import "IMImageService.h"

@interface IMSubcategoryService ()

@property (nonatomic) int counter;
@property (strong, nonatomic) NSArray *totalCategories;

@end

@implementation IMSubcategoryService

- (id)initWithObjectContext:(NSManagedObjectContext *)managedObjectContext {
    self = [super initWithObjectContext:managedObjectContext];
    
    if (self) {
        self.counter = 0;
    }
    
    return self;
}

- (void)updateSubcategoriesByCategories:(NSArray *)categories {
    self.totalCategories = categories;
    for (IMCategory *category in categories) {
        [self fetchSubcategoryDetailsByCategory:category];
    }
}

- (void)fetchSubcategoryDetailsByCategory:(IMCategory *)category {
    
    IMConnectionService *connectionService = [IMConnectionService create];
    [connectionService sendGETRequestForURL:[NSString stringWithFormat:@"category/details/%@", category.categoryId] delegate:self];
}

- (NSArray *)parseCategoriesResponse:(id)response {
    
    @synchronized(self) {
        if (!response) return nil;
        
        NSMutableArray *result = [[NSMutableArray alloc] init];
        
        @try {
            IMCategory *category = [self.builder build:NSStringFromClass([IMCategory class]) fromDictionary:response];
            if (category) {
                [result addObject:category];
            }
        }
        @catch (NSException *exception) {
            NSLog(@"[IMSubcategoryService] something happend in subcategory service %@", exception.description);
        }
        
        self.counter++;
        return result;
    }
}

#pragma mark IMServiceDelegate

- (void)requestFinishedResponse:(id)response error:(NSError *)error {
    
    [self parseCategoriesResponse:response];
    if (self.counter >= self.totalCategories.count) {
        IMImageService *imageService = [[IMImageService alloc] initWithObjectContext:self.managedObjectContext];
        imageService.delegate = self.delegate;
        [imageService downloadImagesFromCategories:self.totalCategories];
    }
}

@end
