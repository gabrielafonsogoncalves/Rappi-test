//
//  IMCItemDetailsViewController.h
//  ImaginamosTest
//
//  Created by Gabriel Afonso on 3/7/15.
//  Copyright (c) 2015 Gabriel Afonso. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IMCItem.h"

@interface IMCItemDetailsViewController : UIViewController

@property (strong, nonatomic) IMCItem *item;
@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *avalibleLabel;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;

- (IBAction)close:(id)sender;

@end
