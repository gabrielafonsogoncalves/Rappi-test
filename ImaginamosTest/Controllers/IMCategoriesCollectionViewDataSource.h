//
//  IMCategoriesCollectionViewDataSource.h
//  ImaginamosTest
//
//  Created by Gabriel Afonso on 3/6/15.
//  Copyright (c) 2015 Gabriel Afonso. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IMSubcategoryDataSource.h"

@interface IMCategoriesCollectionViewDataSource : NSObject <UICollectionViewDataSource>

@property (strong, nonatomic) NSArray *categories;
@property (strong, nonatomic) id<IMSubcategoryDataSourceDelegate> delegate;

@end
