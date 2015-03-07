//
//  IMSubcategoryDataSource.h
//  ImaginamosTest
//
//  Created by Gabriel Afonso on 3/6/15.
//  Copyright (c) 2015 Gabriel Afonso. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IMSubcategory.h"

@protocol IMSubcategoryDataSourceDelegate <NSObject>

- (void)subcategoryClicked:(IMSubcategory *)subcategory;

@end

@interface IMSubcategoryDataSource : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *subcategories;
@property (strong, nonatomic) id<IMSubcategoryDataSourceDelegate> delegate;

@end
