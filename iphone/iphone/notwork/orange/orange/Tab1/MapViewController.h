//
//  MapViewController.h
//  EmotionMap
//
//  Created by qingjie zhao on 10/2/12.
//  Copyright (c) 2012 SU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <MapKit/MKReverseGeocoder.h>
#import <CoreLocation/CoreLocation.h>
#import "EmotionTableController.h"
#import "ViewCell.h"
#import "ImageAndTitle.h"
#import "Global.h"
#import "AppDelegate.h"
#import "ParkPlaceMark.h"


//#define kGetPointsURL @"http://149.119.197.172:8080/emotionmap/rest/json/meta/get"
#define kGetPointsURL @"http://192.168.0.103:8080/SpringMVC3/rest/kfc/brands/qingjiezhao"
@class ViewCell;
@interface MapViewController : UIViewController 
<CLLocationManagerDelegate, MKReverseGeocoderDelegate, MKMapViewDelegate,UIAlertViewDelegate,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UIAlertViewDelegate> {
    MKMapView           *mapView;
    MKPlacemark *mPlacemark;
    CLLocationManager  *locmanager;
    NSString *strLatitude;
    NSString *strLongitude;
    UIButton            *button;    
    NSMutableData *receivedData;
    ViewCell *viewCell;
    NSMutableArray *itemArray;
    NSArray * titleArray;
    NSArray * imageArray;
    UIAlertView *alertViewListEmotion;
    UITextField *txtDescription;
    UITableView *myTableView;
    
}
@property (nonatomic, retain) IBOutlet MKMapView *mapView;
@property (nonatomic, retain) IBOutlet UIButton *button;   
@property (nonatomic, retain) IBOutlet NSMutableData *receivedData;
@property (nonatomic, retain) IBOutlet UIAlertView *alertViewListEmotion;
@property (nonatomic, retain) IBOutlet UITextField *txtDescription;
@property (nonatomic, retain) IBOutlet UITableView *myTableView;
@property (nonatomic, retain) IBOutlet NSString *strLatitude;
@property (nonatomic, retain) IBOutlet NSString *strLongitude;

- (IBAction)findMe;
- (IBAction)test:(id)sender;
-(void)setItem:(NSArray *)tempArray;
-(void)addItem:(ImageAndTitle *)iat;

- (void)showUserInfo;
- (IBAction)update;
- (void)showInfoOfMap;

@end
