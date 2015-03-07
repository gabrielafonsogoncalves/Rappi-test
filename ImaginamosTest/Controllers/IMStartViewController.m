//
//  IMStartViewController.m
//  ImaginamosTest
//
//  Created by Gabriel Afonso on 3/6/15.
//  Copyright (c) 2015 Gabriel Afonso. All rights reserved.
//

#import <AFNetworking/AFNetworkReachabilityManager.h>
#import "IMStartViewController.h"
#import "IMCategoryService.h"
#import "IMQueueService.h"
#import "IMCategoriesViewController.h"

@implementation IMStartViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    [self checkInternetConnectionToContinue];
}

- (void)checkInternetConnectionToContinue {
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (status == AFNetworkReachabilityStatusNotReachable || status == AFNetworkReachabilityStatusUnknown) {
            self.noInternetConnectionLabel.hidden = NO;
            [self finishedResponse:nil error:nil];
        } else {
            [self loadInformation];
        }
    }];
}

- (void)loadInformation {

    self.enterStoreButton.hidden = YES;
    self.startLabel.hidden = NO;
    [self.startActivityIndicator startAnimating];
    IMCategoryService *categoryService = [[IMCategoryService alloc] initWithObjectContext:self.managedObjectContext];
    categoryService.delegate = self;
    [categoryService updateCategories];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.destinationViewController isKindOfClass:[IMCategoriesViewController class]]) {
        IMCategoriesViewController *viewController = segue.destinationViewController;
        viewController.managedObjectContext = self.managedObjectContext;
    }
}

#pragma mark IMControllersDelegate

- (void)finishedResponse:(NSArray *)objects error:(NSError *)error
{
    [self.startActivityIndicator stopAnimating];
    self.startLabel.hidden = YES;
    self.enterStoreButton.hidden = NO;
}

@end
