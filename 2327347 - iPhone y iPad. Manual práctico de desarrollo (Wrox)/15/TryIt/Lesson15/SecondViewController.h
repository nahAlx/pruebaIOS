//
//  SecondViewController.h
//  Lesson15
//
//  Created by Gene Backlin on 10/12/11.
//  Copyright (c) 2011 MariZack Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    
}

@property (strong, nonatomic) NSDictionary *artists;
@property (weak, nonatomic) IBOutlet UITableView *artistTableView;

@end
