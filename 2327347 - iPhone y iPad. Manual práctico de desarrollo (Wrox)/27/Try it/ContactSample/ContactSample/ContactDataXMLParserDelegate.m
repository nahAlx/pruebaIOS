//
//  ContactDataXMLParserDelegate.m
//  ContactSample
//
//  Created by Abhishek Mishra on 06/12/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import "ContactDataXMLParserDelegate.h"

@implementation ContactDataXMLParserDelegate

@synthesize viewController;
@synthesize tmpContactInfo;
@synthesize currentElementValue;

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict 
{
    // clear the contents of current_element_value
    if (self.currentElementValue == nil)
        self.currentElementValue = [[NSMutableString alloc] initWithString:@""];
    else
        [currentElementValue setString:@""];
    
    // set 'tmpContactInfo' to a new ContactInfo object each time
    // the start of a 'contact' element is been encountered
    if([elementName isEqualToString:@"contact"])
    {
        self.tmpContactInfo = [[ContactData alloc] init];
        
        // read the attributes of the node here.
        NSString* szID = [attributeDict objectForKey:@"id"];
        if (szID != nil)
            self.tmpContactInfo.contactId = [szID intValue];
    } 
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string 
{
    [currentElementValue appendString:string];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName 
{
    if([elementName isEqualToString:@"first_name"])
    {
        if (tmpContactInfo.firstName == nil)
            tmpContactInfo.firstName = [[NSMutableString alloc] initWithCapacity:25];
        [tmpContactInfo.firstName setString:currentElementValue];
    } 
    
    if([elementName isEqualToString:@"last_name"])
    {
        if (tmpContactInfo.lastName == nil)
            tmpContactInfo.lastName = [[NSMutableString alloc] initWithCapacity:25];
        [tmpContactInfo.lastName setString:currentElementValue];
    } 
    
    if([elementName isEqualToString:@"address"])
    {
        if (tmpContactInfo.address == nil)
            tmpContactInfo.address = [[NSMutableString alloc] initWithCapacity:25];
        [tmpContactInfo.address setString:currentElementValue];
    } 
    
    if([elementName isEqualToString:@"phone"])
    {
        if (tmpContactInfo.phone == nil)
            tmpContactInfo.phone = [[NSMutableString alloc] initWithCapacity:25];
        [tmpContactInfo.phone setString:currentElementValue];
    } 
    
    if([elementName isEqualToString:@"contact"])
    {
        [viewController.listOfContacts addObject:tmpContactInfo];
        tmpContactInfo = nil;
    } 
}


@end
