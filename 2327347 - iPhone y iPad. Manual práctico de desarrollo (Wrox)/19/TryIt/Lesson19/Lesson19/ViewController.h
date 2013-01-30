//
//  ViewController.h
//  Lesson19
//
//  Created by Gene Backlin on 10/11/11.
//  Copyright (c) 2011 MariZack Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) UIPopoverController *modalTypePopoverController;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *modalButton;

- (IBAction)selectModalType:(id)sender;

- (void)showModalView:(UISegmentedControl *)sender;
- (void)dismissPopover:(UIPopoverController *)popoverController;

@end
