//
//  CustomPickerView.h
//  AlertPicker
//
//  Created by qingjie zhao on 4/5/11.
//  Copyright 2011 SU. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CustomPickerView : UIAlertView <UIPickerViewDataSource, UIPickerViewDelegate> {
    NSArray *majorNames;
    NSArray *grades;
    UIPickerView *selectPicker;
    int        selectedMajor;
    int        selectedGrade;
}

- (NSString *)getResult;

@end