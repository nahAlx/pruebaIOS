//
//  AppDelegate.m
//  Lesson15
//
//  Created by Gene Backlin on 10/12/11.
//  Copyright (c) 2011 MariZack Consulting. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize names = _names;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self setNames:[self createDictionaryOfArtists]];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

#pragma mark - Utility methods

- (NSDictionary *)createDictionaryOfArtists {    
    NSDictionary *artists = [NSDictionary dictionaryWithObjectsAndKeys:
                             [NSArray arrayWithObjects:@"Mona Lisa", @"Last Supper", nil], @"da Vinci", 
                             [NSArray arrayWithObjects:@"Self-Portrait", @"Starry Night", nil], @"van Gogh", 
                             [NSArray arrayWithObjects:@"Tragedy", @"Guernica", nil], @"Picasso", 
                             [NSArray arrayWithObjects:@"Naked Maya", @"Dancing-Banks Mazanare", nil], @"de Goya", 
                             [NSArray arrayWithObjects:@"Impression At Sunrise", @"Waterlilies", nil], @"Monet", 
                             nil];
    return artists;
}


@end
