//
//  Tab3ViewController.h
//  EmotionMap
//
//  Created by qingjie zhao on 9/27/12.
//  Copyright (c) 2012 SU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyDataSource.h"


@interface Tab3ViewController : UIViewController<UIAlertViewDelegate>{
    IBOutlet UILabel *lblName;
    IBOutlet UILabel *lblAge;
    IBOutlet UIImageView *img;
	IBOutlet NSMutableData *receivedData;
    IBOutlet UIAlertView *myAlertView;
    IBOutlet UITextField *accoutName;
    IBOutlet UITextField *accoutPassword;
    
}

@property (nonatomic,retain) IBOutlet UILabel *lblName;
@property (nonatomic,retain) IBOutlet UILabel *lblAge;
@property (nonatomic,retain) IBOutlet NSMutableData *receivedData;
@property (nonatomic,retain) IBOutlet UIImageView *img;
@property (nonatomic,retain) IBOutlet UIAlertView *myAlertView;
@property (nonatomic,retain) IBOutlet UITextField *accoutName;
@property (nonatomic,retain) IBOutlet UITextField *accoutPassword;


- (IBAction)logout:(id)sender;


@end
