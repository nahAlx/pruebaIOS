//
//  Lesson31ViewController.h
//  Bounce
//
//  Created by Abhishek Mishra on 05/12/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Lesson31ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *ballImage;
@property (strong, nonatomic) NSTimer* animationTimer;

@property int velocityX;
@property int velocityY;

-(void) onTimerFired:(NSTimer*)timer;
@end
