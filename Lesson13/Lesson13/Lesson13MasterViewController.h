//
//  Lesson13MasterViewController.h
//  Lesson13
//
//  Created by Family on 28/01/13.
//  Copyright (c) 2013 com.redgreenblueapp. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Lesson13DetailViewController;

@interface Lesson13MasterViewController : UITableViewController
- (IBAction)toggleSections:(id)sender;

@property (strong, nonatomic) Lesson13DetailViewController *detailViewController;

@end
