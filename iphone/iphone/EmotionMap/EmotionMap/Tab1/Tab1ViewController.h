//
//  Tab1ViewController.h
//  EmotionMap
//
//  Created by qingjie zhao on 9/27/12.
//  Copyright (c) 2012 SU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FPPopoverController.h"
#import "EmotionTableController.h"

@class MapViewController;

@interface Tab1ViewController : UIViewController<FPPopoverControllerDelegate>{
    IBOutlet UISegmentedControl *segmentedControl;
    MapViewController *mapViewController;
    
}

@property (nonatomic,retain) IBOutlet UISegmentedControl *segmentedControl;
@property (nonatomic,retain) IBOutlet MapViewController *mapViewController;

@end
