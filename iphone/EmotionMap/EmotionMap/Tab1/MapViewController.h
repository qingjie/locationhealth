//
//  MapViewController.h
//  EmotionMap
//
//  Created by qingjie zhao on 10/2/12.
//  Copyright (c) 2012 SU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "EmotionTableController.h"
#import "FPPopoverController.h"


//#define kGetPointsURL @"http://149.119.197.172:8080/emotionmap/rest/json/meta/get"
#define kGetPointsURL @"http://149.119.197.172:8080/SpringMVC3/rest/kfc/brands/qingjiezhao"

@interface MapViewController : UIViewController 
<CLLocationManagerDelegate, MKReverseGeocoderDelegate, MKMapViewDelegate,FPPopoverControllerDelegate> {
    MKMapView           *mapView;
    UIButton            *button;    
    NSMutableData *receivedData;
    
}
@property (nonatomic, retain) IBOutlet MKMapView *mapView;
@property (nonatomic,retain) IBOutlet  UIButton *button;   
@property (nonatomic, retain) IBOutlet NSMutableData *receivedData;

- (IBAction)findMe;
- (IBAction)test:(id)sender;

@end
