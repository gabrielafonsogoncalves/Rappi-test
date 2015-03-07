//
//  IMConnectionService.m
//  ImaginamosTest
//
//  Created by Gabriel Afonso on 3/6/15.
//  Copyright (c) 2015 Gabriel Afonso. All rights reserved.
//

#import <AFNetworking/AFHTTPRequestOperationManager.h>
#import <AFNetworking/AFURLSessionManager.h>
#import "IMConnectionService.h"
#import "IMServiceDelegate.h"
#import "IMImage.h"

@implementation IMConnectionService

NSString* const EDHostname = @"http://192.237.180.31/archies/public/";

- (void)sendGETRequestForURL:(NSString *)relativeUrl delegate:(id<IMServiceDelegate>)delegate {

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:[self absolutePathBy:relativeUrl] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        if (delegate) {
            [delegate requestFinishedResponse:responseObject error:nil];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        if (delegate) {
            [delegate requestFinishedResponse:nil error:error];
        }
    }];
}

- (void)downloadImage:(IMImage *)image delegate:(id<IMServiceDelegate>)delegate {
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:[self absolutePathBy:image.imageUrl]];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSArray *components = [image.imageUrl componentsSeparatedByString:@"/"];
    __block NSString *imageName = @"";
    if (components.count > 0) {
        imageName = components.lastObject;
    }
    
    if (imageName && ![@"" isEqualToString:imageName] && !image.downloaded) {
        NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
            NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSCachesDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
            
            return [documentsDirectoryURL URLByAppendingPathComponent:imageName];
        } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
            NSLog(@"[IMConnectionService] File downloaded?: %@ %@", error.description, filePath);
            image.downloaded = (error == nil);
            [delegate requestFinishedResponse:image error:nil];
        }];
        [downloadTask resume];
    } else {
        [delegate requestFinishedResponse:image error:nil];
    }
}

- (NSString *)absolutePathBy:(NSString *)relativePath {

    return [NSString stringWithFormat:@"%@%@", EDHostname, relativePath];
}

@end
