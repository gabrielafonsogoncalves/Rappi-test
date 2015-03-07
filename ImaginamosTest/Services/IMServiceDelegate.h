//
//  IMServiceDelegate.h
//  ImaginamosTest
//
//  Created by Gabriel Afonso on 3/6/15.
//  Copyright (c) 2015 Gabriel Afonso. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IMServiceDelegate <NSObject>

@required
- (void)requestFinishedResponse:(id)response error:(NSError *)error;

@end
