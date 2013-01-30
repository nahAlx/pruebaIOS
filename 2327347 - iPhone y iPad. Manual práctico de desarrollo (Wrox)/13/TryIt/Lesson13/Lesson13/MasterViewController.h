//
//  MasterViewController.h
//  Lesson13
//
//  Created by Gene Backlin on 8/8/11.
//  Copyright (c) 2011 MariZack Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@property (strong, nonatomic) NSArray *girlsArray;
@property (strong, nonatomic) NSArray *boysArray;
@property (strong, nonatomic) NSArray *sections;
@property (strong, nonatomic) NSArray *sectionsSorted;
@property (assign) BOOL sorted;


- (NSArray *)arrayForSection:(NSInteger)section;
- (NSString *)titleForSection:(NSInteger)section;

- (IBAction)toggleSections:(id)sender;

@end
