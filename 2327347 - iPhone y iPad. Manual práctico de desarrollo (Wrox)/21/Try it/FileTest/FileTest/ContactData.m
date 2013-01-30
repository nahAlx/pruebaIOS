//
//  ContactData.m
//  FileTest
//
//  Created by Abhishek Mishra on 23/11/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import "ContactData.h"

@implementation ContactData
@synthesize contactName;
@synthesize phoneNumber;

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:contactName forKey:@"name"]; 
    [encoder encodeObject:phoneNumber forKey:@"phone"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) 
    { 
        contactName = [decoder decodeObjectForKey:@"name"]; 
        phoneNumber = [decoder decodeObjectForKey:@"phone"];
    } 
    return self;
}

@end
