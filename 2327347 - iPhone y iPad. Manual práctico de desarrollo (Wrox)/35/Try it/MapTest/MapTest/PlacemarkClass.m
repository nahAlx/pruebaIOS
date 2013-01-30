//
//  PlacemarkClass.m
//  MapTest
//
//  Created by Abhishek Mishra on 01/12/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import "PlacemarkClass.h"

@implementation PlacemarkClass

@synthesize coordinate;
@synthesize subtitle;
@synthesize title;

-(id)initWithCoordinate:(CLLocationCoordinate2D)annotCoordinate title:(NSString*)annotTitle subtitle:(NSString*)annotSubtitle
{
    self = [super init];
    if (self) 
    {
        coordinate = annotCoordinate;
        subtitle = [[NSString alloc] initWithString:annotSubtitle];
        title = [[NSString alloc] initWithString:annotTitle];
    }
    
    return self;
}

@end
