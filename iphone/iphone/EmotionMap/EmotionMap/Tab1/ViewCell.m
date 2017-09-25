//
//  ViewCell.m
//  EmotionMap
//
//  Created by qingjie zhao on 10/18/12.
//  Copyright (c) 2012 SU. All rights reserved.
//


#import "ViewCell.h"


@implementation ViewCell
@synthesize btn1,btn2,btn3,btn4,btn5,btn6,lbl1,lbl2,lbl3,lbl4,lbl5,lbl6,delegate;


-(IBAction)click:(id)sender{
	UIButton *button = (UIButton *)sender;
	NSLog(@"tag:%d",button.tag);
	[delegate onCellItem:button.tag];
}



@end
