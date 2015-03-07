//
//  IMControllersDelegate.h
//  ImaginamosTest
//
//  Created by Gabriel Afonso on 3/6/15.
//  Copyright (c) 2015 Gabriel Afonso. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IMControllersDelegate <NSObject>

@required

- (void)finishedResponse:(NSArray *)objects error:(NSError *)error;

@end
