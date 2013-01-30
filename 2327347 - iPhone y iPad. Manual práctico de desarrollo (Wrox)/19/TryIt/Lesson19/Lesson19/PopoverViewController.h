//
//  PopoverViewController.h
//  Lesson19
//
//  Created by Gene Backlin on 10/11/11.
//  Copyright (c) 2011 MariZack Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopoverViewController : UIViewController

@property (strong, nonatomic) id delegate;
@property (weak, nonatomic) IBOutlet UISegmentedControl *modalTypeSegmentedController;

- (IBAction)showModalView:(id)sender;

@end
