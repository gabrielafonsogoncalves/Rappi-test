//
//  IMCItemsViewController.h
//  ImaginamosTest
//
//  Created by Gabriel Afonso on 3/7/15.
//  Copyright (c) 2015 Gabriel Afonso. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IMSubcategory.h"
#import "IMControllersDelegate.h"

@interface IMCItemsViewController : UIViewController

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) IMSubcategory *subcategory;
@property (weak, nonatomic) IBOutlet UILabel *subcategoryLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *itemsCollectionView;

- (IBAction)close:(id)sender;

@end
