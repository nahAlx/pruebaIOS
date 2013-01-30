//
//  Person.m
//  Lesson14
//
//  Created by Gene Backlin on 10/2/11.
//  Copyright (c) 2011 MariZack Consulting. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize lastName = _lastName;
@synthesize firstName = _firstName;
@synthesize phone = _phone;

- (id)initWithLastName:(NSString *)lastName 
             firstName:(NSString *)firstName 
                 phone:(NSString *)phone {
    [self setLastName:lastName];
    [self setFirstName:firstName];
    [self setPhone:phone];
    
    return self;
}

@end
