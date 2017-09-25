#import "FlipsideViewController.h"
#import "ParkPlaceMark.h"
#import <MapKit/MapKit.h>
#import <MapKit/MKReverseGeocoder.h>
#import <CoreLocation/CoreLocation.h>

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, MKMapViewDelegate, CLLocationManagerDelegate> {
	MKMapView *mapView;
	MKPlacemark *mPlacemark;
	CLLocationCoordinate2D location;
	IBOutlet UIButton *mStoreLocationButton;
    IBOutlet UIButton *mStoreLocationButton1;
    IBOutlet UIButton *mStoreLocationButton2;
    IBOutlet UIButton *mStoreLocationButton3;
    IBOutlet NSString *strLatitude;
	IBOutlet NSString *strLongitude;
    CLLocationManager  *locmanager; 
	BOOL wasFound;
}

@property(nonatomic,retain) IBOutlet UIButton *mStoreLocationButton;
@property(nonatomic,retain) IBOutlet UIButton *mStoreLocationButton1;
@property(nonatomic,retain) IBOutlet UIButton *mStoreLocationButton2;
@property(nonatomic,retain) IBOutlet UIButton *mStoreLocationButton3;
@property (nonatomic,retain) NSString *strLatitude;
@property (nonatomic,retain) NSString *strLongitude;


- (IBAction)showInfo;
- (void)showInfoOfMap;
- (IBAction)update;
- (void)showParking:(BOOL) b;
- (IBAction)storeLocationInfo:(id) sender;
- (IBAction)storeLocationInfo1:(id) sender;
- (IBAction)storeLocationInfo2:(id) sender;
- (IBAction)storeLocationInfo3:(id) sender;
@end
