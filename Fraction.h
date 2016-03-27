//
//  Fraction.h
//  分数计算器
//
//  Created by 李键超 on 16/3/27.
//  Copyright © 2016年 李键超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fraction : NSObject

@property int numerator,denominator;

-(void)        print;
-(void)        setTo:(int) n over:(int) d;
-(Fraction *)  add:(Fraction *)f;
-(Fraction *)  subtract:(Fraction *)f;
-(Fraction *)  multiply:(Fraction *)f;
-(Fraction *)  divide:(Fraction *)f;
-(void)        reduce;
-(double)      convertToNum;
-(NSString *)  convertToString;

@end
