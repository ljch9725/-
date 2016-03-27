//
//  ViewController.h
//  分数计算器
//
//  Created by 李键超 on 16/3/27.
//  Copyright © 2016年 李键超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong,nonatomic)IBOutlet UILabel *display;

-(void) processDigit:(int) digit;
-(void) processOp:(char) theOp;
-(void) storeFracPart;

//数字键

-(IBAction)ClickDigit:(UIButton *)sender;

//算数操作键

-(IBAction) clickPlus;
-(IBAction) clickMinus;
-(IBAction) clickMultiply;
-(IBAction) clickDivide;

//Misc键

-(IBAction) clickOver;
-(IBAction) clickEquals;
-(IBAction) clickClear;

@end

