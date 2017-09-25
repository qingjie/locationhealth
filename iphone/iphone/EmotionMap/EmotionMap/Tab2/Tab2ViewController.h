//
//  Tab2ViewController.h
//  EmotionMap
//
//  Created by qingjie zhao on 9/27/12.
//  Copyright (c) 2012 SU. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DailyViewController;

@interface Tab2ViewController : UIViewController{
    IBOutlet UISegmentedControl *segmentedControl;
    DailyViewController *dailyViewController;
}

@property (nonatomic,retain) IBOutlet UISegmentedControl *segmentedControl;
@property (nonatomic,retain) IBOutlet DailyViewController *dailyViewController;

@end
