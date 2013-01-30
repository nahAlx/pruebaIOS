//
//  DetailViewController.h
//  Lesson14
//
//  Created by Gene Backlin on 10/2/11.
//  Copyright (c) 2011 MariZack Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Person;

@interface DetailViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UITableViewCell *lastName;
@property (strong, nonatomic) IBOutlet UITableViewCell *firstName;
@property (strong, nonatomic) IBOutlet UITableViewCell *phone;
@property (strong, nonatomic) Person *person;

@end
