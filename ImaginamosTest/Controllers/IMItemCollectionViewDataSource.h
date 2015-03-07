//
//  IMItemCollectionViewDataSource.h
//  ImaginamosTest
//
//  Created by Gabriel Afonso on 3/7/15.
//  Copyright (c) 2015 Gabriel Afonso. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IMItemCollectionViewDataSource : NSObject <UICollectionViewDataSource>

@property (strong, nonatomic) NSArray *items;

@end
