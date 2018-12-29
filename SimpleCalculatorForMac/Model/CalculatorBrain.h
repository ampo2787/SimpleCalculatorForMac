//
//  CalculatorBrain.h
//  SimpleCalculator_01_201402356
//
//  Created by JihoonPark on 2018. 9. 3..
//  Copyright © 2018년 JihoonPark. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

- (void) setOperand:(double) newOperand;
- (double) performOperation:(NSString *) operation;

@end
