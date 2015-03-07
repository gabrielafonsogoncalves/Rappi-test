//
//  IMCategoriesViewController.h
//  ImaginamosTest
//
//  Created by Gabriel Afonso on 3/6/15.
//  Copyright (c) 2015 Gabriel Afonso. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IMControllersDelegate.h"
#import "IMCategoryCollectionViewCell.h"

@interface IMCategoriesViewController : UIViewController <IMSubcategoryDataSourceDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (weak, nonatomic) IBOutlet UICollectionView *categoryCollectionView;

@end
