//
//  Lesson8ViewController.h
//  TreasureHunt
//
//  Created by Abhishek Mishra on 16/11/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Lesson8ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *largeImage;
@property (weak, nonatomic) IBOutlet UIImageView *animatedImage;
- (void) handleTap:(UITapGestureRecognizer*)sender;
@end
