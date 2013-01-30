//
//  Lesson9ViewController.h
//  PickerTest
//
//  Created by Abhishek Mishra on 17/11/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Lesson9ViewController : UIViewController <UIPickerViewDataSource , UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *cityAndSubjectPicker;
- (IBAction)onButtonPressed:(id)sender;

@property (strong, nonatomic) NSArray* cities;
@property (strong, nonatomic) NSArray* placesOfInterest;
@end
