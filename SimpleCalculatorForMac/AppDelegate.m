//
//  AppDelegate.m
//  SimpleCalculatorForMac
//
//  Created by JihoonPark on 10/10/2018.
//  Copyright © 2018 JihoonPark. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (IBAction)calculateClick:(NSMenuItem *)sender {
    if([sender.title isEqualToString:@"+"]){
        [[NSNotificationCenter defaultCenter]postNotificationName:@"PLUS" object:self];
    }else if([sender.title isEqualToString:@"-"]){
        [[NSNotificationCenter defaultCenter]postNotificationName:@"MINUS" object:self];
    }else if([sender.title isEqualToString:@"*"]){
        [[NSNotificationCenter defaultCenter]postNotificationName:@"MULTI" object:self];
    }else if([sender.title isEqualToString:@"/"]){
        [[NSNotificationCenter defaultCenter]postNotificationName:@"DIVISION" object:self];
    }else if([sender.title isEqualToString:@"sqrt"]){
        [[NSNotificationCenter defaultCenter]postNotificationName:@"SQRT" object:self];
    }else{
        [[NSNotificationCenter defaultCenter]postNotificationName:@"EQUAL" object:self];
    }
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
