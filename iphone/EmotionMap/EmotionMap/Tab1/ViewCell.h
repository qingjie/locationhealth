//
//  ViewCell.h
//  EmotionMap
//
//  Created by qingjie zhao on 10/18/12.
//  Copyright (c) 2012 SU. All rights reserved.
//


#import <UIKit/UIKit.h>


@interface ViewCell : UITableViewCell {
	IBOutlet UIButton *btn1;
	IBOutlet UIButton *btn2;
	IBOutlet UIButton *btn3;
    IBOutlet UIButton *btn4;
    IBOutlet UIButton *btn5;
    IBOutlet UIButton *btn6;
    
	IBOutlet UILabel *lbl1;
	IBOutlet UILabel *lbl2;
	IBOutlet UILabel *lbl3;
    IBOutlet UILabel *lbl4;
	IBOutlet UILabel *lbl5;
	IBOutlet UILabel *lbl6;
	id delegate;
}
@property (assign) id delegate;
@property (nonatomic,retain) UIButton *btn1;
@property (nonatomic,retain) UIButton *btn2;
@property (nonatomic,retain) UIButton *btn3;
@property (nonatomic,retain) UIButton *btn4;
@property (nonatomic,retain) UIButton *btn5;
@property (nonatomic,retain) UIButton *btn6;
@property (nonatomic,retain) UILabel *lbl1;
@property (nonatomic,retain) UILabel *lbl2;
@property (nonatomic,retain) UILabel *lbl3;
@property (nonatomic,retain) UILabel *lbl4;
@property (nonatomic,retain) UILabel *lbl5;
@property (nonatomic,retain) UILabel *lbl6;

-(IBAction)click:(id)sender;
@end

@protocol cellItemDelegate

@optional
-(void)onCellItem:(int)index;

@end
