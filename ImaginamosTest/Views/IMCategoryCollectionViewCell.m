//
//  IMCategoryCollectionViewCell.m
//  ImaginamosTest
//
//  Created by Gabriel Afonso on 3/6/15.
//  Copyright (c) 2015 Gabriel Afonso. All rights reserved.
//

#import "IMCategoryCollectionViewCell.h"
#import "IMSubcategoryDataSource.h"

@interface IMCategoryCollectionViewCell ()

@property (strong, nonatomic) IMSubcategoryDataSource *subcategoryDataSource;

@end

@implementation IMCategoryCollectionViewCell

- (void)loadSubcategoriesTableView:(NSArray *)subcategories {

    self.subcategoryDataSource = [[IMSubcategoryDataSource alloc] init];
    self.subcategoryDataSource.subcategories = subcategories;
    self.subcategoryDataSource.delegate = self.delegate;
    self.subcategoriesTableView.dataSource = self.subcategoryDataSource;
    self.subcategoriesTableView.delegate = self.subcategoryDataSource;
    [self.subcategoriesTableView reloadData];
}

@end
