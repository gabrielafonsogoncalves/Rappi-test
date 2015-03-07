//
//  IMSubcategoryBuilder.h
//  ImaginamosTest
//
//  Created by Gabriel Afonso on 3/6/15.
//  Copyright (c) 2015 Gabriel Afonso. All rights reserved.
//

#import "IMObjectBuilder.h"
#import "IMBuilder.h"
#import "IMFactory.h"

@interface IMSubcategoryBuilder : IMFactory <IMObjectBuilder>

@property (nonatomic, retain) IMBuilder* context;

@end
