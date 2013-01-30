//
//  ViewController.h
//  Lesson29
//
//  Created by Gene Backlin on 11/23/11.
//  Copyright (c) 2011 MariZack Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIGestureRecognizerDelegate> {
    
}

@property (weak, nonatomic) IBOutlet UILabel *phaseLabel;
@property (weak, nonatomic) IBOutlet UILabel *tapCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *touchCountLabel;
@property (weak, nonatomic) IBOutlet UIView *touchView;

#pragma mark - Create Gesture Recognizers

- (void)createGestureRecognizers;
- (void)createSingleTapRecognizer;
- (void)createDoubleTapRecognizer;
- (void)createPinchRecognizer;
- (void)createSwipeRecognizers;
- (void)createSwipeRecognizer:(UISwipeGestureRecognizerDirection)direction;

#pragma mark - Event Handlers

- (void)handleSingleTapEvent:(UITapGestureRecognizer *)recognizer;
- (void)handleDoubleTapEvent:(UITapGestureRecognizer *)recognizer;
- (void)handlePinchEvent:(UIPinchGestureRecognizer *)recognizer;
- (void)handleSwipeEvent:(UISwipeGestureRecognizer *)recognizer;

#pragma mark - Utility methods

- (void)updateDisplayWithPhase:(NSString *)phase 
                      tapCount:(int)tapCount 
                    touchCount:(int)touchCount;
- (void)moveImage:(UIGestureRecognizer *)recognizer;

@end
