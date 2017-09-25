//
//  Tab3ViewController.h
//  EmotionMap
//
//  Created by qingjie zhao on 9/27/12.
//  Copyright (c) 2012 SU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Tab3ViewController : UIViewController{
    IBOutlet UILabel *lblName;
	IBOutlet UILabel *lblAge;
    IBOutlet UILabel *lblNameValue;
    IBOutlet UILabel *lblAgeValue;
	
}

@property (nonatomic,retain) IBOutlet UILabel *lblName;
@property (nonatomic,retain) IBOutlet UILabel *lblAge;
@property (nonatomic,retain) IBOutlet UILabel *lblNameValue;
@property (nonatomic,retain) IBOutlet UILabel *lblAgeValue;

- (IBAction)loginFacebook:(id)sender;

@end
