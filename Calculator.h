//
//  Calculator.h
//  分数计算器
//
//  Created by 李键超 on 16/3/27.
//  Copyright © 2016年 李键超. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fraction.h"

@interface Calculator :NSObject

@property(strong,nonatomic) Fraction *operand1;
@property(strong,nonatomic) Fraction *operand2;
@property(strong,nonatomic) Fraction *accumulator;

-(Fraction *)performOperation:(char) op;
-(void)clear;

@end
