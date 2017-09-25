//
//  EmotionTableController.h
//  EmotionMap
//
//  Created by qingjie zhao on 10/18/12.
//  Copyright (c) 2012 SU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageAndTitle.h"
#import "ViewCell.h"

@class ViewCell;
@interface EmotionTableController : UITableViewController{
    ViewCell *viewCell;
    NSMutableArray *itemArray;
    NSArray * titleArray;
    NSArray * imageArray;
}

@property(nonatomic, retain) ViewCell *viewCell;
@property(nonatomic, retain) NSMutableArray *itemArray;

-(void)setItem:(NSArray *)tempArray;
-(void)addItem:(ImageAndTitle *)iat;

@end
