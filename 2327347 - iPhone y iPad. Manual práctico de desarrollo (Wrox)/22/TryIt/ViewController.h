//
//  ViewController.h
//  Lesson22
//
//  Created by Gene Backlin on 10/9/11.
//  Copyright (c) 2011 MariZack Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UITableViewController

@property (strong, nonatomic) NSArray *nameArray;

#pragma mark - Alert methods

- (void)alert:(NSString *)aMessage;

#pragma mark - Property List methods

- (NSArray *)readFromPropertyList:(NSString *)filename;


@end
