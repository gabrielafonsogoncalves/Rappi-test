//
//  IMCItem.m
//  ImaginamosTest
//
//  Created by Gabriel Afonso on 3/6/15.
//  Copyright (c) 2015 Gabriel Afonso. All rights reserved.
//

#import "IMCItem.h"
#import "IMImage.h"
#import "IMSubcategory.h"


@implementation IMCItem

@dynamic itemDescription;
@dynamic itemId;
@dynamic name;
@dynamic itemEnabled;
@dynamic itemImage;
@dynamic subcategory;

- (NSString *)itemDescriptionCleaned {
    
    if (self.itemDescription && ![@"" isEqualToString:self.itemDescription]) {
        return self.itemDescription;
    }
    
    return NSLocalizedString(@"No se posee información", nil);
}

@end
