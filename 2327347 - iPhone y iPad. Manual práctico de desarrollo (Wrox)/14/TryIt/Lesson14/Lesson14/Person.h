//
//  Person.h
//  Lesson14
//
//  Created by Gene Backlin on 10/2/11.
//  Copyright (c) 2011 MariZack Consulting. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *phone;

- (id)initWithLastName:(NSString *)lastName 
             firstName:(NSString *)firstName 
                 phone:(NSString *)phone;

@end
