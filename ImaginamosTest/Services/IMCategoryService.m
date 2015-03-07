//
//  IMCategoryService.m
//  ImaginamosTest
//
//  Created by Gabriel Afonso on 3/6/15.
//  Copyright (c) 2015 Gabriel Afonso. All rights reserved.
//

#import "IMCategoryService.h"
#import "IMConnectionService.h"
#import "IMSubcategoryService.h"
#import "IMCategory.h"

@interface IMCategoryService ()

@property (strong, nonatomic) IMSubcategoryService *subcategoryService;

@end

@implementation IMCategoryService

- (void)fetchAllCategories {
    
    IMConnectionService *connectionService = [IMConnectionService create];
    [connectionService sendGETRequestForURL:@"category" delegate:self];
}

- (void)fetchCategoryDetailsForCategories:(NSArray *)categories {
    
}

- (NSArray *)parseCategoriesResponse:(id)response {
    
    if (!response) return nil;

    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    @try {
        for (NSDictionary *categoryDict in response) {
            IMCategory *category = [self.builder build:NSStringFromClass([IMCategory class]) fromDictionary:categoryDict];
            if (category) {
                [result addObject:category];
            }
        }
    }
    @catch (NSException *exception) {
        NSLog(@"[IMCategoryService] something happend in category service %@", exception.description);
    }
    
    return result;
}

- (void)updateCategories
{
    [self fetchAllCategories];
}

- (NSArray *)loadCategoriesFromDataBase
{
    __block NSError *error = nil;
    NSEntityDescription* description = [NSEntityDescription entityForName:NSStringFromClass([IMCategory class]) inManagedObjectContext:self.managedObjectContext];
    NSFetchRequest* fetchRequest = [[NSFetchRequest alloc] init];
    fetchRequest.entity = description;
    __block NSArray* objects;
    
    [self.managedObjectContext performBlockAndWait:^{
        objects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    }];
    
    return objects;
}

#pragma mark IMServiceDelegate

- (void)requestFinishedResponse:(id)response error:(NSError *)error {
    
    NSArray *categories = [self parseCategoriesResponse:response];    
    self.subcategoryService = [[IMSubcategoryService alloc] initWithObjectContext:self.managedObjectContext];
    self.subcategoryService.delegate = self.delegate;
    [self.subcategoryService updateSubcategoriesByCategories:categories];
}

@end
