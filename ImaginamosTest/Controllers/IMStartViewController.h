//
//  IMStartViewController.h
//  ImaginamosTest
//
//  Created by Gabriel Afonso on 3/6/15.
//  Copyright (c) 2015 Gabriel Afonso. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IMControllersDelegate.h"

@interface IMStartViewController : UIViewController <IMControllersDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *startActivityIndicator;
@property (weak, nonatomic) IBOutlet UILabel *startLabel;
@property (weak, nonatomic) IBOutlet UILabel *noInternetConnectionLabel;
@property (weak, nonatomic) IBOutlet UIButton *enterStoreButton;

@end
