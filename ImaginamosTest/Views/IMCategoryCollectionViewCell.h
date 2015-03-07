//
//  IMCategoryCollectionViewCell.h
//  ImaginamosTest
//
//  Created by Gabriel Afonso on 3/6/15.
//  Copyright (c) 2015 Gabriel Afonso. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IMSubcategoryDataSource.h"

@interface IMCategoryCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *categoryImageView;
@property (weak, nonatomic) IBOutlet UITableView *subcategoriesTableView;
@property (weak, nonatomic) IBOutlet id<IMSubcategoryDataSourceDelegate> delegate;

- (void)loadSubcategoriesTableView:(NSArray *)subcategories;

@end
