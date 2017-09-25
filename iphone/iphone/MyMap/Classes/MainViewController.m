#import "MainViewController.h"
#import "MainView.h"


@implementation MainViewController

@synthesize mStoreLocationButton,mStoreLocationButton1,mStoreLocationButton2,mStoreLocationButton3;
@synthesize strLatitude,strLongitude;

 - (void)viewDidLoad {
     [super viewDidLoad];
     
     
     mapView = [[MKMapView alloc] initWithFrame:self.view.frame];
     mapView.showsUserLocation=TRUE;
     mapView.delegate=self;
     [self.view insertSubview:mapView atIndex:0];
     
     [self update];
     
     [mStoreLocationButton addTarget:self action:@selector(switchCheckState:) forControlEvents:UIControlEventTouchUpInside];
     
    


}

- (IBAction)showInfo {    
	
	FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
	controller.delegate = self;
	
	controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:controller animated:YES];
	

}


- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller {
    
	[self dismissModalViewControllerAnimated:YES];
}

- (IBAction)storeLocationInfo:(id) sender{
    BOOL b;
	if([[NSUserDefaults standardUserDefaults] boolForKey:@"isChecked"]){
		[mStoreLocationButton setImage:[UIImage imageNamed:@"checked.png"] forState:UIControlStateNormal];
        b = YES;
        [self showParking:b];
        
	}else{
		[mStoreLocationButton setImage:[UIImage imageNamed:@"unchecked.png"] forState:UIControlStateNormal];
        b = NO;
        [self showParking:b];
        
    }
	 
}

-(IBAction)switchCheckState:(id)sender
{
	if([[NSUserDefaults standardUserDefaults] boolForKey:@"isChecked"])
	{
        NSLog(@"-------");
		[[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isChecked"];
		[[[self.navigationItem.titleView subviews] lastObject] setImage:[UIImage imageNamed:@"unchecked.png"] forState:UIControlStateNormal];
	}
	else
	{
         NSLog(@"============");
		[[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isChecked"];
		[[[self.navigationItem.titleView subviews] lastObject] setImage:[UIImage imageNamed:@"checked.png"] forState:UIControlStateNormal];
	}
    
}

- (IBAction)storeLocationInfo1:(id) sender{
   
   
}
- (IBAction)storeLocationInfo2:(id) sender{
    
}
- (IBAction)storeLocationInfo3:(id) sender{
    
    
}



- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation { 
    
	
	if (wasFound) return; 
    wasFound = YES;
    
	
	CLLocationCoordinate2D loc = [newLocation coordinate];
	
	strLatitude = [NSString stringWithFormat: @"%f", loc.latitude];
	strLongitude = [NSString stringWithFormat: @"%f", loc.longitude];
	
	
	NSLog(@"---------strLatitude---strLongitude--,%@ %@",strLatitude,strLongitude);

    
	[self showInfoOfMap];
	
}



- (IBAction)update {
	locmanager = [[CLLocationManager alloc] init]; 
	[locmanager setDelegate:self]; 
	[locmanager setDesiredAccuracy:kCLLocationAccuracyBest];
	
	[locmanager startUpdatingLocation];
}

-(void)showInfoOfMap{
   	  
	NSLog(@"----f11----f22--,%@ %@",strLatitude,strLongitude);
    
	
    MKCoordinateRegion syr;
    //syr.center.latitude = 43.0480556;
    //syr.center.longitude = -76.1477778;
	
	syr.center.latitude =  [strLatitude floatValue];
    syr.center.longitude = [strLongitude floatValue];
	
	
    syr.span.latitudeDelta = 0.1;
    syr.span.longitudeDelta = 0.1;
	
	
    [mapView setRegion:syr animated:YES];
    
    mapView.showsUserLocation = YES;
    
}

-(void)showParking:(BOOL) b{
    
    
    NSMutableArray *annotations = [[NSMutableArray alloc] init];
  
    
    for (int i = 1; i <= 30; i++){
        ParkPlaceMark *annotation = [[ParkPlaceMark alloc] init];
        CLLocationCoordinate2D coordinate;
        
        if (i % 4 == 0){
            coordinate.latitude = mapView.centerCoordinate.latitude + (float)(arc4random() % 100) / 1000;
            coordinate.longitude = mapView.centerCoordinate.longitude + (float)(arc4random() % 100) / 1000;
        }else if(i % 4 == 1){
            coordinate.latitude = mapView.centerCoordinate.latitude - (float)(arc4random() % 100) / 1000;
            coordinate.longitude = mapView.centerCoordinate.longitude - (float)(arc4random() % 100) / 1000;
        }else if(i % 4 == 2){
            coordinate.latitude = mapView.centerCoordinate.latitude + (float)(arc4random() % 100) / 1000;
            coordinate.longitude = mapView.centerCoordinate.longitude - (float)(arc4random() % 100) / 1000;
        }else{
            coordinate.latitude = mapView.centerCoordinate.latitude - (float)(arc4random() % 100) / 1000;
            coordinate.longitude = mapView.centerCoordinate.longitude + (float)(arc4random() % 100) / 1000;
        }
        
        annotation.myCoordinate = coordinate;
		
		annotation.myTitle = [NSString stringWithFormat:@"Qingjie Zhao %i", i];
        annotation.mySubTitle = [NSString stringWithFormat:@"Syracuse University %i", i];
		
		
		
        [annotations addObject:annotation];
       
    }
     
    
    if (b) {
        NSLog(@"-----TRUE1-------");
        [mapView addAnnotations:annotations];
        
    }else {
        NSLog(@"-----FALSE1-------");
        NSArray *existingpoints = mapView.annotations;
        if ([existingpoints count] > 0){
            [mapView removeAnnotations:existingpoints];
        }
       
        
    }
    
    
}

- (MKAnnotationView *)mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>)annotation{
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
	
    if ([annotation isKindOfClass:[ParkPlaceMark class]]){
        static NSString *MyAnnotationIdentifier = @"myAnnotation";
        MKPinAnnotationView *pinView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:MyAnnotationIdentifier];
        
        if (!pinView){
            MKPinAnnotationView* myPinView = [[[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:MyAnnotationIdentifier] autorelease];
			myPinView.pinColor = MKPinAnnotationColorPurple;
            myPinView.animatesDrop = YES;
            myPinView.canShowCallout = YES;
			myPinView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
			
			
			myPinView.leftCalloutAccessoryView =  [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Shy.png"]] autorelease];
			myPinView.leftCalloutAccessoryView.frame = CGRectMake(0,0,37,36);
            return myPinView;
        }else{
            return pinView;

        }
		
    }
    
    return nil;
}




- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control{
	NSLog(@"---zhaoqingjie-----");
	
		
	
	
}

@end
