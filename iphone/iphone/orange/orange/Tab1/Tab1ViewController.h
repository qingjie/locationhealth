//
//  Tab1ViewController.h
//  EmotionMap
//
//  Created by qingjie zhao on 9/27/12.
//  Copyright (c) 2012 SU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageAndTitle.h"
#import "ViewCell.h"
#import "Global.h"

@class ViewCell;
@class MapViewController;

@interface Tab1ViewController : UIViewController<UIAlertViewDelegate,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate> {
    IBOutlet UISegmentedControl *segmentedControl;
    MapViewController *mapViewController;
    
    ViewCell *viewCell;
    NSMutableArray *itemArray;
    NSArray * titleArray;
    NSArray * imageArray;
    UIAlertView *alertViewListEmotion;
    
   
    
}

@property (nonatomic,retain) IBOutlet UISegmentedControl *segmentedControl;
@property (nonatomic,retain) IBOutlet MapViewController *mapViewController;
@property (nonatomic,retain) IBOutlet UIAlertView *alertViewListEmotion;

-(void)setItem:(NSArray *)tempArray;
-(void)addItem:(ImageAndTitle *)iat;

@end
