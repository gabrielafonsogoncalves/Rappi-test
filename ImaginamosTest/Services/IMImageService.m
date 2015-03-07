//
//  IMImageService.m
//  ImaginamosTest
//
//  Created by Gabriel Afonso on 3/7/15.
//  Copyright (c) 2015 Gabriel Afonso. All rights reserved.
//

#import "IMImageService.h"
#import "IMConnectionService.h"
#import "IMImage.h"
#import "IMCategory.h"
#import "IMSubcategory.h"
#import "IMCItem.h"

@interface IMImageService ()

@property (nonatomic) int counter;
@property (nonatomic) int totalImages;
@property (nonatomic) NSArray *totalCategories;

@end

@implementation IMImageService

- (id)initWithObjectContext:(NSManagedObjectContext *)managedObjectContext {
    self = [super initWithObjectContext:managedObjectContext];
    
    if (self) {
        self.counter = 0;
        self.totalImages = 0;
    }
    
    return self;
}

- (void)downloadImagesFromCategories:(NSArray *)categories {

    self.totalCategories = categories;
    IMConnectionService *connectionService = [IMConnectionService create];
    for (IMCategory *category in categories) {
        [connectionService downloadImage:category.categoryImage delegate:self];
        self.totalImages++;
        for (IMSubcategory *subcategory in category.subcategories) {
            for (IMCItem *item in subcategory.items) {
                [connectionService downloadImage:item.itemImage delegate:self];
                self.totalImages++;
            }
        }
    }
}

+ (UIImage *)imageFromURL:(NSString *)url {

    NSArray *components = [url componentsSeparatedByString:@"/"];
    __block NSString *imageName = @"";
    if (components.count > 0) {
        imageName = components.lastObject;
    }
    
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:imageName];
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfFile:path]];
    
    if (!image) {
        image = [UIImage imageNamed:@"ic_no_image"];
    }
    
    return image;
}

#pragma mark IMServiceDelegate

- (void)requestFinishedResponse:(id)response error:(NSError *)error {
    self.counter ++;
    [self.managedObjectContext save:&error];
    
    NSLog(@"File downloaded %d = %d total", self.counter, self.totalImages);
    
    if (self.counter >= self.totalImages) {
        if (!self.delegate) {
            return;
        }
        [self.delegate finishedResponse:self.totalCategories error:error];
    }
}

@end
