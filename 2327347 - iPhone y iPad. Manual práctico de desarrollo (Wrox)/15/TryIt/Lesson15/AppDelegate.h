//
//  AppDelegate.h
//  Lesson15
//
//  Created by Gene Backlin on 10/12/11.
//  Copyright (c) 2011 MariZack Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSDictionary *names;

- (NSDictionary *)createDictionaryOfArtists;

@end
