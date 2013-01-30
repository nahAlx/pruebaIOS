//
//  Lesson10ViewController.h
//  DateSample
//
//  Created by Abhishek Mishra on 04/12/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Lesson10ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@property (weak, nonatomic) IBOutlet UILabel *topLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomLabel;

- (IBAction)onValueChanged:(id)sender;
@end
