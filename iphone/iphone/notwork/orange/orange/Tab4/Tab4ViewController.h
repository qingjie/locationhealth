//
//  Tab4ViewController.h
//  EmotionMap
//
//  Created by qingjie zhao on 9/27/12.
//  Copyright (c) 2012 SU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimeViewController.h"
#import "RadiusViewController.h"
#import "ChartViewController.h"
#import "PolicyViewController.h"

@interface Tab4ViewController : UIViewController{
    NSDictionary *tableContents;
    NSArray *sortedKeys;
  
    


}

@property (nonatomic,retain) NSDictionary *tableContents;
@property (nonatomic,retain) NSArray *sortedKeys;


@end
