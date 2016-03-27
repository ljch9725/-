//
//  ViewController.m
//  分数计算器
//
//  Created by 李键超 on 16/3/27.
//  Copyright © 2016年 李键超. All rights reserved.
//


#import "ViewController.h"
#import "Calculator.h"
@interface ViewController ()

@end

@implementation ViewController
{
    char op;
    int currentNumber;
    BOOL firstOperand,isNumerator;
    Calculator *myCalculator;
    NSMutableString *displayString;
}


- (void)viewDidLoad {
    
    //覆盖载入程序的自定义方法
    
    firstOperand = YES;
    isNumerator = YES;
    displayString = [NSMutableString stringWithCapacity:40];
    myCalculator = [[Calculator alloc] init];
    
}

-(void) processDigit:(int) digit
{
    currentNumber = currentNumber * 10 + digit;
    
    [displayString appendString:[NSString stringWithFormat:@"%i",digit]];
    _display.text = displayString;
}

-(IBAction)ClickDigit:(UIButton *)sender
{
    int digit = sender.tag;
    
    [self processDigit:digit];
}

-(void)processOp:(char)theOp
{
    NSString *opStr;
    
    op = theOp;
    
    switch (theOp) {
        case '+':
            opStr = @"+";
            break;
        case '-':
            opStr = @"-";
            break;
        case '*':
            opStr = @"×";
            break;
        case '/':
            opStr = @"÷";
            break;
    }

    [self storeFracPart];
    firstOperand = NO;
    isNumerator = YES;

    [displayString appendString:opStr];
    _display.text = displayString;
}

-(void) storeFracPart
{
    if (firstOperand) {
        if (isNumerator) {
            myCalculator.operand1.numerator = currentNumber;
            myCalculator.operand1.denominator = 1;
        }
        else
            myCalculator.operand1.denominator = currentNumber;
    }
    else if (isNumerator){
        myCalculator.operand2.numerator = currentNumber;
        myCalculator.operand2.denominator = 1;
    }
    else{
        myCalculator.operand2.denominator = currentNumber;
        firstOperand = YES;
    }
    
    currentNumber = 0;
}

-(IBAction)clickOver
{
    [self storeFracPart];
    isNumerator = NO;
    [displayString appendString:@"/"];
    _display.text = displayString;
}

//算数操作键

-(IBAction)clickPlus
{
    [self processOp:'+'];
}

-(IBAction)clickMinus
{
    [self processOp:'-'];
}

-(IBAction)clickMultiply
{
    [self processOp:'*'];
}

-(IBAction)clickDivide
{
    [self processOp:'/'];
}

//Misc键

-(IBAction) clickEquals
{
    if (firstOperand == NO) {
        [self storeFracPart];
        [myCalculator performOperation:op];
        
        [displayString appendString:@" = "];
        [displayString appendString:[myCalculator.accumulator convertToString]];
        _display.text = displayString;
        
        currentNumber = 0;
        isNumerator = YES;
        firstOperand =YES;
        [displayString setString:@""];
    }
}

-(IBAction)clickClear
{
    isNumerator = YES;
    firstOperand = YES;
    currentNumber = 0;
    [myCalculator clear];
    
    [displayString setString:@""];
    _display.text = displayString;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
