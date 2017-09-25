//
//  Tab2ViewController.h
//  EmotionMap
//
//  Created by qingjie zhao on 9/27/12.
//  Copyright (c) 2012 SU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomPickerView.h"

@class DailyViewController;

@interface Tab2ViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource,UITableViewDelegate,UITableViewDataSource>{
    IBOutlet UISegmentedControl *segmentedControl;
    DailyViewController *dailyViewController;
    
    UITableView *myTableView;
	NSArray *array;
	//NSIndexPath	* lastIndexPath;
}

@property (nonatomic,retain) IBOutlet UISegmentedControl *segmentedControl;
@property (nonatomic,retain) IBOutlet DailyViewController *dailyViewController;
//@property (nonatomic, retain) NSIndexPath *lastIndexPath;

-(void) selectMajor;

@end
