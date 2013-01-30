//
//  ThirdViewController.h
//  Lesson15
//
//  Created by Gene Backlin on 10/13/11.
//  Copyright (c) 2011 MariZack Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThirdViewController : UITableViewController

@property (strong, nonatomic) NSArray *paintings;

- (NSArray *)getPaintingsFromDictionary:(NSDictionary *)artists;
- (void)alert:(NSString *)aMessage;

@end
