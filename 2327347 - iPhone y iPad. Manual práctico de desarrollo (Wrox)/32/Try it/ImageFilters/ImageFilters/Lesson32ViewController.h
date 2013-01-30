//
//  Lesson32ViewController.h
//  ImageFilters
//
//  Created by Abhishek Mishra on 01/12/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreImage/CoreImage.h> 

@interface Lesson32ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)onHueAdjust:(id)sender;

- (IBAction)onSepia:(id)sender;
@end
