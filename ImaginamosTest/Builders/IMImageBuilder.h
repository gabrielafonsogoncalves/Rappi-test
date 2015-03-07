//
//  IMImageBuilder.h
//  ImaginamosTest
//
//  Created by Gabriel Afonso on 3/6/15.
//  Copyright (c) 2015 Gabriel Afonso. All rights reserved.
//

#import "IMFactory.h"
#import "IMBuilder.h"
#import "IMObjectBuilder.h"

@interface IMImageBuilder : IMFactory <IMObjectBuilder>

@property (nonatomic, retain) IMBuilder* context;

@end
