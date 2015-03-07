//
//  IMCItemDetailsViewController.m
//  ImaginamosTest
//
//  Created by Gabriel Afonso on 3/7/15.
//  Copyright (c) 2015 Gabriel Afonso. All rights reserved.
//

#import "IMCItemDetailsViewController.h"
#import "IMImageService.h"
#import "IMImage.h"

@interface IMCItemDetailsViewController ()

@end

@implementation IMCItemDetailsViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self loadItemDetails];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

- (void)loadItemDetails {
    
    self.itemImageView.image = [IMImageService imageFromURL:self.item.itemImage.imageUrl];
    self.nameLabel.text = self.item.name;
    self.descriptionTextView.text = [self.item itemDescriptionCleaned];
    
    //ToDo: should be tanslated in future versions
    if (self.item.itemEnabled) {
        self.avalibleLabel.text = NSLocalizedString(@"Disponible", nil);
        self.avalibleLabel.textColor = [UIColor greenColor];
    } else {
        self.avalibleLabel.text = NSLocalizedString(@"Agotado", nil);
        self.avalibleLabel.textColor = [UIColor redColor];
    }
}

- (IBAction)close:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
