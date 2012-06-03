//
//  ViewController.h
//  iDeviceConsoleTestLe
//
//  Created by zeng le on 5/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RscMgr.h"
#define BUFFER_LEN 1024
@interface ViewController : UIViewController <RscMgrDelegate, UITextFieldDelegate> {
    RscMgr *rscMgr;
    UInt8 rxBuffer[BUFFER_LEN]; 
    UInt8 txBuffer[BUFFER_LEN];
}
@property (weak, nonatomic) IBOutlet UITextField *inputText;
@property (weak, nonatomic) IBOutlet UITextView *outputResult;
- (IBAction)sendClick:(id)sender;

@end
