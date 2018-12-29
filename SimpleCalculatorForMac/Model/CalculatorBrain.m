//
//  CalculatorBrain.m
//  SimpleCalculator_01_201402356
//
//  Created by JihoonPark on 2018. 9. 3..
//  Copyright © 2018년 JihoonPark. All rights reserved.
//

#import "CalculatorBrain.h"

#pragma mark = "Declaration of Private mothods"

@interface CalculatorBrain()

@property (nonatomic)double operand;
@property (nonatomic)double waitingOperand;
@property (nonatomic)NSString * waitingOperation;

-(void)performWaitingOperation;

@end

#pragma mark = "Implementation"

@implementation CalculatorBrain

- (double) performOperation:(NSString *)operation{
    if([operation isEqual:@"sqrt"]){
        self.operand = sqrt(self.operand);
    }
    else if([operation isEqual:@"+/-"]){
        self.operand -= self.operand * 2;
    }
    else if([operation isEqual:@"AC"]){
        self.operand = 0;
        self.waitingOperand = 0;
        self.waitingOperation = nil;
    }
    else if(self.waitingOperation == operation){
        
    }else{
        [self performWaitingOperation];
        self.waitingOperation = operation;
        self.waitingOperand = self.operand;
    }
    return self.operand;
}


- (void)performWaitingOperation{
    if([self.waitingOperation isEqual:@"+"]){
        self.operand = self.waitingOperand + self.operand;
    }
    else if([self.waitingOperation isEqual:@"-"]){
        self.operand = self.waitingOperand - self.operand;
    }
    else if([self.waitingOperation isEqual:@"*"]){
        self.operand = self.waitingOperand * self.operand;
    }
    else if([self.waitingOperation isEqual:@"/"]){
        if(self.operand != 0){
             self.operand = self.waitingOperand / self.operand;
        }
    }
        
}

@end
