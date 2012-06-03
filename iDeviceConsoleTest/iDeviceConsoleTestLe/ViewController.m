//
//  ViewController.m
//  iDeviceConsoleTestLe
//
//  Created by zeng le on 5/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize inputText;
@synthesize outputResult;

#pragma mark - UITextFieldDelegate methods
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    return YES;
}

#pragma mark - RscMgrDelegate methods
- (void) cableConnected:(NSString *)protocol { 
    [rscMgr setBaud:9600];
    [rscMgr open]; 
}
- (void) cableDisconnected { }
- (void) portStatusChanged { }
- (void) readBytesAvailable:(UInt32)numBytes{
    int bytesRead = [rscMgr read:rxBuffer Length:numBytes]; 
    NSLog( @"Read %d bytes from serial cable.", bytesRead );
    for(int i = 0;i < numBytes;++i) {
        self.outputResult.text = [NSString stringWithFormat:@"%@%c",self.outputResult.text,((char *)rxBuffer)[i]];
    }
    [self.outputResult scrollRangeToVisible:NSMakeRange([self.outputResult.text length], 0)];
}

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
    rscMgr = [[RscMgr alloc] init];
    [rscMgr setDelegate:self];
}

- (void)viewDidUnload
{
    [self setInputText:nil];
    [self setOutputResult:nil];
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

- (IBAction)sendClick:(id)sender {
    [self.inputText resignFirstResponder];
    NSString *text = self.inputText.text;
    int bytesToWrite = text.length;
    for ( int i = 0; i < bytesToWrite; i++ ) {
        txBuffer[i] = (int)[text characterAtIndex:i]; }
}



    
@end
