//
//  CustomPickerView.m
//  AlertPicker
//
//  Created by qingjie zhao on 4/5/11.
//  Copyright 2011 SU. All rights reserved.
//

#import "CustomPickerView.h"
#define componentCount 2
#define majorComponent 0
#define gradeComponent 1
#define majorComponentWidth 165
#define gradeComponentWidth 70

@implementation CustomPickerView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        majorNames=[[NSArray alloc]initWithObjects:@"Daily", @"Weekly", @"Monthly",nil ];
        grades=[[NSArray alloc]initWithObjects:@"Line",@"Pie",nil];
        
		
        selectPicker = [[UIPickerView alloc] initWithFrame:CGRectMake(0,0,320,216)];
        selectPicker.showsSelectionIndicator = YES;
        selectPicker.delegate = self;
        selectPicker.dataSource = self;        
        selectPicker.opaque = YES;
        
		//        [selectPicker addTarget:self action:@selector(selectPickerValueChanged:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:selectPicker]; 
    }
    return self;
}        

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return componentCount;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component==majorComponent) {
        return [majorNames count];
    } else {
        return [grades count];
    }
}
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    UILabel *printString;
    if (component==majorComponent) {
        printString= [[UILabel alloc] initWithFrame:CGRectMake(5,0,majorComponentWidth,32)];
        printString.text = [majorNames objectAtIndex:row];
        //[printString setFont:[UIFont fontWithName:@"Georgia" size:12.0f]];
    } else {
        printString= [[UILabel alloc] initWithFrame:CGRectMake(5,0,gradeComponentWidth,32)];
        printString.text = [grades objectAtIndex:row];
    }
    [printString autorelease];
    printString.backgroundColor=[UIColor clearColor];
    printString.textAlignment=NSTextAlignmentCenter;
    
    return printString;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 45.0;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    if (component==majorComponent) {
        return majorComponentWidth;
    } else {
        return gradeComponentWidth;
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    NSLog(@"Major [%d] -- Grade [%d]", [pickerView selectedRowInComponent:majorComponent], [pickerView selectedRowInComponent:gradeComponent]);
    selectedMajor = [pickerView selectedRowInComponent:majorComponent];
    selectedGrade = [pickerView selectedRowInComponent:gradeComponent];
}    

- (void)setFrame:(CGRect)rect {         
    [super setFrame:CGRectMake(0, 0, rect.size.width, 330)];         
    self.center = CGPointMake(320/2, 480/2); 
}

- (void)layoutSubviews {             
    selectPicker.frame = CGRectMake(10,45,self.frame.size.width - 52,self.frame.size.height-50); 
    
    for (UIView *view in self.subviews) {
        //NSLog(@"-----test-----,%@",[[view class] description]);
        if ([[[view class] description] isEqualToString:@"UIAlertButton"]) {
            view.frame = CGRectMake(view.frame.origin.x, self.bounds.size.height - view.frame.size.height - 15, view.frame.size.width, view.frame.size.height);
        }
    }
}

- (NSString *)getResult {         
    NSLog(@"Major [%d] -- Grade [%d]", selectedMajor, selectedGrade);
    return [NSString stringWithFormat:@"Major [%d] -- Grade [%d]",selectedMajor, selectedGrade];
}

- (void)dealloc {
    [super dealloc];
}

@end
