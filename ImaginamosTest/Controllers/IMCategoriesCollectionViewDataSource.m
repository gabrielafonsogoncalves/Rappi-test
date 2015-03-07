//
//  IMCategoriesCollectionViewDataSource.m
//  ImaginamosTest
//
//  Created by Gabriel Afonso on 3/6/15.
//  Copyright (c) 2015 Gabriel Afonso. All rights reserved.
//

#import "IMCategoriesCollectionViewDataSource.h"
#import "IMCategoryCollectionViewCell.h"
#import "IMImageService.h"
#import "IMCategory.h"
#import "IMImage.h"

@implementation IMCategoriesCollectionViewDataSource

#pragma mark UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.categories.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    IMCategoryCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"category-cell" forIndexPath:indexPath];
    IMCategory *category = self.categories[indexPath.row];
    cell.titleLabel.text = category.name;
    cell.delegate = self.delegate;
    [cell loadSubcategoriesTableView:category.subcategories.allObjects];
    cell.categoryImageView.image = [IMImageService imageFromURL:category.categoryImage.imageUrl];
    
    return cell;
}

@end
