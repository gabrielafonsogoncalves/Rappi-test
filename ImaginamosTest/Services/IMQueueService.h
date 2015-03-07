//
//  IMQueueService.h
//  ImaginamosTest
//
//  Created by Gabriel Afonso on 3/6/15.
//  Copyright (c) 2015 Gabriel Afonso. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IMQueueService : NSObject

+ (dispatch_queue_t)queue:(NSString*)queueName;

@end
