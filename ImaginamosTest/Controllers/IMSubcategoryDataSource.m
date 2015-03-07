//
//  IMSubcategoryDataSource.m
//  ImaginamosTest
//
//  Created by Gabriel Afonso on 3/6/15.
//  Copyright (c) 2015 Gabriel Afonso. All rights reserved.
//

#import "IMSubcategoryDataSource.h"
#import "IMSubcategoryTableViewCell.h"
#import "IMSubcategory.h"

@implementation IMSubcategoryDataSource

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.subcategories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    IMSubcategoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"subcategory-cell"];
    IMSubcategory *subcategory = self.subcategories[indexPath.row];
    cell.subcategoryLabel.text = subcategory.name;
    
    return cell;
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
 
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.delegate subcategoryClicked:self.subcategories[indexPath.row]];
}

@end
