//
//  Lesson16ModelController.h
//  PageTest
//
//  Created by Abhishek Mishra on 18/11/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Lesson16DataViewController;

@interface Lesson16ModelController : NSObject <UIPageViewControllerDataSource>
- (Lesson16DataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(Lesson16DataViewController *)viewController;
@end
