//
//  RadiusViewController.h
//  EmotionMap
//
//  Created by qingjie zhao on 10/20/12.
//  Copyright (c) 2012 SU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RadiusViewController : UITableViewController{
    NSDictionary *tableContents;
    NSArray *sortedKeys;
}

@property (nonatomic,retain) NSDictionary *tableContents;
@property (nonatomic,retain) NSArray *sortedKeys;


@end