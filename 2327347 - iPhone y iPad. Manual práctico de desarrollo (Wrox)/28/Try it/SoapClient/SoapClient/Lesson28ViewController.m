//
//  Lesson28ViewController.m
//  SoapClient
//
//  Created by Abhishek Mishra on 25/11/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import "Lesson28ViewController.h"

@implementation Lesson28ViewController

@synthesize radiusField;
@synthesize resultView;

@synthesize connection;
@synthesize receivedData;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setRadiusField:nil];
    [self setResultView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)onButtonPressed:(id)sender 
{
    // hide keypad
    if ([radiusField isFirstResponder])
        [radiusField resignFirstResponder];
    
    // ensure valid radius is specified
    NSString* theRadius = radiusField.text;
    if ((theRadius == nil) || ([theRadius length] == 0))
    {
        UIAlertView* errorMessage = [[UIAlertView alloc] initWithTitle:nil
                                                               message:@"Radius not specified"
                                                              delegate:nil
                                                     cancelButtonTitle:@"Ok"
                                                     otherButtonTitles:nil];
        [errorMessage show];
        
        return;
    }
    
    NSString* soapMessage = 
    [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@%@",
     @"<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>",
     @"<SOAP-ENV:Envelope SOAP-ENV:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:SOAP-ENV=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:SOAP-ENC=\"http://schemas.xmlsoap.org/soap/encoding/\">",
     @"<SOAP-ENV:Body>",
     @"<ns3916:getCircleArea xmlns:ns3916=\"http://tempuri.org\">",
     @"<radius xsi:type=\"xsd:string\">",
     theRadius,
     @"</radius>",
     @"</ns3916:getCircleArea>",
     @"</SOAP-ENV:Body>",
     @"</SOAP-ENV:Envelope>"];    

    NSURL *url = [NSURL URLWithString:@"http://www.asmtechnology.com/MathService/mathService.php"];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url];
    
    // HTTP headers
    NSString *messageLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    [req addValue:@"text/xml; charset=ISO-8859-1" forHTTPHeaderField:@"Content-Type"];
    [req addValue:@"" forHTTPHeaderField:@"SOAPAction"];
    [req addValue:messageLength forHTTPHeaderField:@"Content-Length"];
    
    // method = POST
    [req setHTTPMethod:@"POST"];
    
    // BODY
    [req setHTTPBody:[soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    // send request
    self.connection = [[NSURLConnection alloc] initWithRequest:req delegate:self]; 
    if (self.connection != nil)
    { 
        self.receivedData = [NSMutableData data];
    }
    else
    {
        [[UIApplication sharedApplication]      
         setNetworkActivityIndicatorVisible:NO];
    }

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField 
{
    [textField resignFirstResponder];
    return NO;
}

-(void) connection:(NSURLConnection *) connection didReceiveResponse:(NSURLResponse *) response 
{
    [self.receivedData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.receivedData appendData:data];
}

-(void) connection:(NSURLConnection *) connection didFailWithError:(NSError *) error 
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    
    UIAlertView* errorMessage = [[UIAlertView alloc] initWithTitle:nil
                                                           message:@"Unable to connect to web service!"
                                                          delegate:nil
                                                 cancelButtonTitle:@"Ok"
                                                 otherButtonTitles:nil];
    [errorMessage show];
}

-(void) connectionDidFinishLoading:(NSURLConnection *) connection
{
    const void* receivedBytes = [self.receivedData mutableBytes];
    int dataLength = [self.receivedData length];
    NSString* theResponse = [[NSString alloc] initWithBytes:receivedBytes
                                                     length:dataLength 
                                                   encoding:NSUTF8StringEncoding];
    
    resultView.text = theResponse;
    
    NSLog(@"%@", @"Response:");
    NSLog(@"%@", theResponse);
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}


@end
