//
//  IMImageService.h
//  ImaginamosTest
//
//  Created by Gabriel Afonso on 3/7/15.
//  Copyright (c) 2015 Gabriel Afonso. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "IMAbstractServiceFactory.h"
#import "IMControllersDelegate.h"
#import "IMServiceDelegate.h"

@interface IMImageService : IMAbstractServiceFactory <IMServiceDelegate>

@property (strong, nonatomic) id<IMControllersDelegate> delegate;

- (void)downloadImagesFromCategories:(NSArray *)categories;
+ (UIImage *)imageFromURL:(NSString *)url;

@end
