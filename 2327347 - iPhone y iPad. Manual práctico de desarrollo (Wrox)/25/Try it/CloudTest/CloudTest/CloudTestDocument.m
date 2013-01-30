//
//  CloudTestDocument.m
//  CloudTest
//
//  Created by Abhishek Mishra on 24/11/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import "CloudTestDocument.h"

@implementation CloudTestDocument

@synthesize documentContent;

// Called whenever the application reads data from the file system
- (BOOL)loadFromContents:(id)contents ofType:(NSString *)typeName error:(NSError **)outError
{
    if ([contents length] > 0) 
    {
        self.documentContent = [[NSString alloc] initWithBytes:[contents bytes] length:[contents length] encoding:NSUTF8StringEncoding];
        
        [[NSNotificationCenter defaultCenter] 
         postNotificationName:@"refreshDocumentPreview" 
         object:self];
    } 
    else 
    {
        self.documentContent = @"";
    }
    
    return YES;    
}

// Called whenever the application (auto)saves the content of a note
- (id)contentsForType:(NSString *)typeName error:(NSError **)outError 
{
    return [self.documentContent dataUsingEncoding:NSUTF8StringEncoding];
}


@end
