//
//  Lesson36ViewController.m
//  ImagePicker
//
//  Created by Abhishek Mishra on 03/12/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import "Lesson36ViewController.h"

@implementation Lesson36ViewController
@synthesize imageView;
@synthesize cameraButton;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    BOOL hasCamera = [UIImagePickerController 
                      isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
    if (hasCamera == NO)
        [cameraButton setHidden:YES];
}

- (void)viewDidUnload
{
    [self setImageView:nil];
    [self setCameraButton:nil];
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

- (IBAction)onCamera:(id)sender {
    UIImagePickerController* imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self; 
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentModalViewController:imagePicker animated:YES];
}

- (IBAction)onPhotoLibrary:(id)sender {
    UIImagePickerController* imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self; 
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentModalViewController:imagePicker animated:YES];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissModalViewControllerAnimated:YES];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info 
{
    UIImage* image = (UIImage *) [info valueForKey: 
                                  UIImagePickerControllerOriginalImage];
    imageView.image = image;
    [picker dismissModalViewControllerAnimated:YES];
}

@end
