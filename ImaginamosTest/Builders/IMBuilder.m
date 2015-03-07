//
//  IMBuilder.m
//  ImaginamosTest
//
//  Created by Gabriel Afonso on 3/6/15.
//  Copyright (c) 2015 Gabriel Afonso. All rights reserved.
//

#import "IMBuilder.h"
#import "IMObjectBuilder.h"
#import "IMCategoryBuilder.h"
#import "IMSubcategoryBuilder.h"
#import "IMItemBuilder.h"
#import "IMImageBuilder.h"

#import "IMCategory.h"
#import "IMSubcategory.h"
#import "IMCItem.h"
#import "IMImage.h"

@implementation IMBuilder

- (id)build:(NSString*)className fromDictionary:(NSDictionary*)dictionary {
    
    if (dictionary == nil) {
        return nil;
    }
    
    id<IMObjectBuilder> objectBuilder = [self builderForClass:className];
    if (!objectBuilder) return nil;
    
    return [objectBuilder buildFromDictionary:dictionary];
}

- (id)builderForClass:(NSString *)className {

    if ([className isEqualToString:NSStringFromClass([IMCategory class])]) {
        IMCategoryBuilder *categoryBuilder = [IMCategoryBuilder create];
        categoryBuilder.context = self;
        return categoryBuilder;
    } else if ([className isEqualToString:NSStringFromClass([IMSubcategory class])]) {
        IMSubcategoryBuilder *subcategoryBuilder = [IMSubcategoryBuilder create];
        subcategoryBuilder.context = self;
        return subcategoryBuilder;
    } else if ([className isEqualToString:NSStringFromClass([IMCItem class])]) {
        IMItemBuilder *itemBuilder = [IMItemBuilder create];
        itemBuilder.context = self;
        return itemBuilder;
    } else if ([className isEqualToString:NSStringFromClass([IMImage class])]) {
        IMImageBuilder *imageBuilder = [IMImageBuilder create];
        imageBuilder.context = self;
        return imageBuilder;
    }
    
    return nil;
}

@end
