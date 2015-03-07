//
//  IMCItemsViewController.m
//  ImaginamosTest
//
//  Created by Gabriel Afonso on 3/7/15.
//  Copyright (c) 2015 Gabriel Afonso. All rights reserved.
//

#import "IMCItemsViewController.h"
#import "IMItemCollectionViewDataSource.h"
#import "IMCItemDetailsViewController.h"

@interface IMCItemsViewController ()

@property (strong, nonatomic) IMItemCollectionViewDataSource *itemDataSource;

@end

@implementation IMCItemsViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self loadItemsCollectionView];
}

- (void)didReceiveMemoryWarning {

    [super didReceiveMemoryWarning];
}

- (void)loadItemsCollectionView {
    
    self.subcategoryLabel.text = [NSString stringWithFormat:@"%@ (%lu)", self.subcategory.name, (unsigned long)self.subcategory.items.count];
    self.itemDataSource = [[IMItemCollectionViewDataSource alloc] init];
    self.itemDataSource.items = self.subcategory.items.allObjects;
    self.itemsCollectionView.dataSource = self.itemDataSource;
    [self.itemsCollectionView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.destinationViewController isKindOfClass:[IMCItemDetailsViewController class]]) {
        IMCItemDetailsViewController *viewController = segue.destinationViewController;
        NSIndexPath *indexPath = [[self.itemsCollectionView indexPathsForSelectedItems] firstObject];
        viewController.item = self.itemDataSource.items[indexPath.row];
    }
}

- (IBAction)close:(id)sender {

    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
