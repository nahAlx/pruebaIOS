//
//  Lesson33ViewController.h
//  UniGallery
//
//  Created by Abhishek Mishra on 01/12/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Lesson33ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *galleryImageView;

@property (strong, nonatomic) NSArray* imageFileNames;
@property int currentIndex;

- (void) handleLeftSwipe:(UIGestureRecognizer *)gestureRecognizer;
- (void) handleRightSwipe:(UIGestureRecognizer *)gestureRecognizer;

@end
