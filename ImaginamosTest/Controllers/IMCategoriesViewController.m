//
//  IMCategoriesViewController.m
//  ImaginamosTest
//
//  Created by Gabriel Afonso on 3/6/15.
//  Copyright (c) 2015 Gabriel Afonso. All rights reserved.
//

#import "IMCategoriesViewController.h"
#import "IMCategoriesCollectionViewDataSource.h"
#import "IMCategoryService.h"
#import "IMSubcategory.h"
#import "IMCItemsViewController.h"
#import "IMCConstants.h"

@interface IMCategoriesViewController ()

@property (strong, nonatomic) IMCategoriesCollectionViewDataSource *categoryDataSource;
@property (strong, nonatomic) IMSubcategory *subcategorySelected;

@end

@implementation IMCategoriesViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    [self loadCategories];
}

- (void)viewDidDisappear:(BOOL)animated {

    [super viewDidDisappear:animated];
    self.subcategorySelected = nil;
}

- (void)didReceiveMemoryWarning {

    [super didReceiveMemoryWarning];
}

- (void)loadCategories {

    self.categoryDataSource = [[IMCategoriesCollectionViewDataSource alloc] init];
    self.categoryCollectionView.dataSource = self.categoryDataSource;
    self.categoryDataSource.delegate = self;
    IMCategoryService *categoryService = [[IMCategoryService alloc] initWithObjectContext:self.managedObjectContext];
    self.categoryDataSource.categories = [categoryService loadCategoriesFromDataBase];
    [self.categoryCollectionView reloadData];
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {

    return [identifier isEqualToString:kSubcategorySegue] && self.subcategorySelected;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([segue.destinationViewController isKindOfClass:[IMCItemsViewController class]]) {
        IMCItemsViewController *viewController = segue.destinationViewController;
        viewController.managedObjectContext = self.managedObjectContext;
        viewController.subcategory = self.subcategorySelected;
    }
}

#pragma mark IMSubcategoryDataSourceDelegate

- (void)subcategoryClicked:(IMSubcategory *)subcategory {

    self.subcategorySelected = subcategory;
    [self performSegueWithIdentifier:kSubcategorySegue sender:self];
}

@end
