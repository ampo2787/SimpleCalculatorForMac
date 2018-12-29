//
//  SimpleCalculatorViewController.h
//  SimpleCalculatorForMac
//
//  Created by JihoonPark on 10/10/2018.
//  Copyright © 2018 JihoonPark. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "OrangeButton.h"
#import "LightGrayButton.h"
#import "DarkGrayButton.h"
NS_ASSUME_NONNULL_BEGIN

@interface SimpleCalculatorViewController : NSViewController
@property (weak) IBOutlet NSTextField *display;
@property (weak) IBOutlet OrangeButton *btnPlus;
@property (weak) IBOutlet OrangeButton *btnMinus;
@property (weak) IBOutlet OrangeButton *btnMulti;
@property (weak) IBOutlet OrangeButton *btnDiv;
@property (weak) IBOutlet OrangeButton *btnEqu;
@property (weak) IBOutlet DarkGrayButton *btnSqrt;


- (IBAction)operatorPressed:(id)sender;
- (IBAction)digitPressed:(id)sender;
- (IBAction)resetPressed:(NSButton *)sender;

@end

NS_ASSUME_NONNULL_END
