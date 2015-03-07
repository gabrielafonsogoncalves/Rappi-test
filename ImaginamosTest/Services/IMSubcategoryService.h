//
//  IMSubcategoryService.h
//  ImaginamosTest
//
//  Created by Gabriel Afonso on 3/7/15.
//  Copyright (c) 2015 Gabriel Afonso. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IMAbstractServiceFactory.h"
#import "IMServiceDelegate.h"
#import "IMControllersDelegate.h"

@interface IMSubcategoryService : IMAbstractServiceFactory <IMServiceDelegate>

@property (strong, nonatomic) id<IMControllersDelegate> delegate;

- (void)updateSubcategoriesByCategories:(NSArray *)categories;

@end
