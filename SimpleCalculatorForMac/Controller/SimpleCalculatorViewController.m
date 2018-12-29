//
//  SimpleCalculatorViewController.m
//  SimpleCalculatorForMac
//
//  Created by JihoonPark on 10/10/2018.
//  Copyright © 2018 JihoonPark. All rights reserved.
//

#import "SimpleCalculatorViewController.h"
#import "CalculatorBrain.h"

@interface SimpleCalculatorViewController ()
@property (nonatomic) CalculatorBrain* brain;
@property (nonatomic) BOOL userIsInTheMiddleOfTypingANumber;

@end

@implementation SimpleCalculatorViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view.layer setBackgroundColor:[NSColor secondaryLabelColor].CGColor];
    [self.display setBackgroundColor:[NSColor clearColor]];
}

-(void)viewWillAppear {
    [super viewWillAppear];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(feelingNotificationHandler:) name:@"PLUS" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(feelingNotificationHandler:) name:@"MINUS" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(feelingNotificationHandler:) name:@"MULTI" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(feelingNotificationHandler:) name:@"DIVISION" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(feelingNotificationHandler:) name:@"SQRT" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(feelingNotificationHandler:) name:@"EQUAL" object:nil];
}
#pragma mark - Lazy Init

- (CalculatorBrain*) brain {
    if (_brain == nil){
        _brain = [[CalculatorBrain alloc]init];
    }
    return _brain;
}


#pragma mark - Action
- (IBAction)operatorPressed:(NSButton*)sender {
    if(self.userIsInTheMiddleOfTypingANumber){
        [self.brain setOperand:self.display.doubleValue];
        self.userIsInTheMiddleOfTypingANumber = NO;
    }
    
        NSString *operation = sender.title;
        double result = [self.brain performOperation:operation];
        self.display.stringValue = [NSString stringWithFormat:@"%g", result];
    
}

- (IBAction)digitPressed:(NSButton *)sender {
    NSString *digit = sender.title;
    if(self.userIsInTheMiddleOfTypingANumber){
        if([self.display.stringValue isEqualToString:@"0"] && [digit isEqualToString:@"0"]){
            //do Nothing
        }else if([self.display.stringValue isEqualToString:@"0"]){
            self.display.stringValue = digit;
        }else{
            self.display.stringValue = [self.display.stringValue stringByAppendingString:digit];
        }
    }else{
        self.display.stringValue = digit;
        self.userIsInTheMiddleOfTypingANumber = YES;
    }
}

- (IBAction)resetPressed:(NSButton *)sender {
    [self.brain setOperand:0];
    double result = [self.brain performOperation:@"reset"];
    self.display.stringValue = [NSString stringWithFormat:@"%g",result];
}

#pragma mark - Notification Handler

-(void)feelingNotificationHandler:(NSNotification *)noti{    
    if([noti.name isEqualToString:@"PLUS"]){
        [self operatorPressed:self.btnPlus];
    }else if([noti.name isEqualToString:@"MINUS"]){
        [self operatorPressed:self.btnMinus];
    } else if([noti.name isEqualToString:@"MULTI"]){
        [self operatorPressed:self.btnMulti];
    }else if([noti.name isEqualToString:@"DIVISION"]){
        [self operatorPressed:self.btnDiv];
    } else if([noti.name isEqualToString:@"SQRT"]){
        [self operatorPressed:self.btnSqrt];
    }else{
        [self operatorPressed:self.btnEqu];
    }
}

@end
