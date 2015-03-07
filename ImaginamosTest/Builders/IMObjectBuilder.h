//
//  IMObjectBuilder.h
//  ImaginamosTest
//
//  Created by Gabriel Afonso on 3/6/15.
//  Copyright (c) 2015 Gabriel Afonso. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IMBuilder.h"

@protocol IMObjectBuilder <NSObject>

@required

@property (nonatomic, retain) IMBuilder* context;

- (id)buildFromDictionary:(NSDictionary*)dictionary;

@end
