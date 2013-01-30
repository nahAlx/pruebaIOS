//
//  Lesson24ViewController.h
//  ImageGallery
//
//  Created by Abhishek Mishra on 23/11/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Lesson24ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) NSMutableArray* imageFileNames;
@property (nonatomic) int currentImageIndex;

- (IBAction)onPreviousImage:(id)sender;
- (IBAction)onNextImage:(id)sender;

@end
