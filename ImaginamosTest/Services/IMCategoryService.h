//
//  IMCategoryService.h
//  ImaginamosTest
//
//  Created by Gabriel Afonso on 3/6/15.
//  Copyright (c) 2015 Gabriel Afonso. All rights reserved.
//

#import "IMAbstractServiceFactory.h"
#import "IMServiceDelegate.h"
#import "IMControllersDelegate.h"

@interface IMCategoryService : IMAbstractServiceFactory <IMServiceDelegate>

@property (strong, nonatomic) id<IMControllersDelegate> delegate;

- (void)updateCategories;
- (NSArray *)loadCategoriesFromDataBase;

@end
