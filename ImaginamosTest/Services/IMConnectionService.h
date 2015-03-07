//
//  IMConnectionService.h
//  ImaginamosTest
//
//  Created by Gabriel Afonso on 3/6/15.
//  Copyright (c) 2015 Gabriel Afonso. All rights reserved.
//

#import "IMFactory.h"
#import "IMServiceDelegate.h"
#import "IMImage.h"

@interface IMConnectionService : IMFactory

- (void)sendGETRequestForURL:(NSString *)relativeUrl delegate:(id<IMServiceDelegate>)delegate;
- (void)downloadImage:(IMImage *)image delegate:(id<IMServiceDelegate>)delegate;

@end
