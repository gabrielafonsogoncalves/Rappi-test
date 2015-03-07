//
//  IMItemCollectionViewDataSource.m
//  ImaginamosTest
//
//  Created by Gabriel Afonso on 3/7/15.
//  Copyright (c) 2015 Gabriel Afonso. All rights reserved.
//

#import "IMItemCollectionViewDataSource.h"
#import "IMCItemCollectionViewCell.h"
#import "IMImageService.h"
#import "IMCItem.h"
#import "IMImage.h"

@implementation IMItemCollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.items.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    IMCItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"items-cell" forIndexPath:indexPath];
    IMCItem *item = self.items[indexPath.row];
    cell.itemLabel.text = item.name;
    cell.itemDescriptionTextView.text = item.itemDescription;
    cell.itemImageView.image = [IMImageService imageFromURL:item.itemImage.imageUrl];
    
    return cell;
}

@end
