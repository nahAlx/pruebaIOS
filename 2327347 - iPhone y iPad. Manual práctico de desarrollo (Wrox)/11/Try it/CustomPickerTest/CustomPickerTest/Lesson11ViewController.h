//
//  Lesson11ViewController.h
//  CustomPickerTest
//
//  Created by Abhishek Mishra on 17/11/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Lesson11ViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *fruitPicker;

@property (strong, nonatomic) NSArray* dataForComponent1;
@property (strong, nonatomic) NSArray* dataForComponent2;
@property (strong, nonatomic) NSArray* dataForComponent3;

@property (strong, nonatomic) NSDictionary* nameToImageMapping;
@end
