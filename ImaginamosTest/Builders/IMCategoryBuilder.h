//
//  IMCategoryBuilder.h
//  ImaginamosTest
//
//  Created by Gabriel Afonso on 3/6/15.
//  Copyright (c) 2015 Gabriel Afonso. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IMFactory.h"
#import "IMObjectBuilder.h"

@interface IMCategoryBuilder : IMFactory <IMObjectBuilder>

@property (nonatomic, retain) IMBuilder* context;

@end
