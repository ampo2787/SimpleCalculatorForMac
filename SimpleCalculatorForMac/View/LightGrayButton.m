//
//  LightGrayButton.m
//  SimpleCalculatorForMac
//
//  Created by JihoonPark on 10/10/2018.
//  Copyright © 2018 JihoonPark. All rights reserved.
//

#import "LightGrayButton.h"

@implementation LightGrayButton

- (void)awakeFromNib{
    [super awakeFromNib];
    [self setWantsLayer:YES];
    [self.layer setBackgroundColor:[NSColor lightGrayColor].CGColor];
    
    [self.layer setBorderWidth:0.5];
    [self.layer setBorderColor:[NSColor grayColor].CGColor];
}

@end
