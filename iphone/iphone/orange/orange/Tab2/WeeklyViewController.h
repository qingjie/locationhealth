//
//  WeeklyViewController.h
//  EmotionMap
//
//  Created by qingjie zhao on 10/10/12.
//  Copyright (c) 2012 SU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PieChartView.h"
#import "MyDataSource.h"

@interface WeeklyViewController : UIViewController{
    PieChartView *pieChartView;
    NSMutableArray *itemArray;
}

@property (nonatomic,retain) NSMutableArray *itemArray;

@end
