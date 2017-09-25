//
//  MapViewController.m
//  EmotionMap
//
//  Created by qingjie zhao on 10/2/12.
//  Copyright (c) 2012 SU. All rights reserved.
//



#import "MapViewController.h"
#import "MapLocation.h"
#import "MyDataSource.h"


@implementation MapViewController
@synthesize mapView;
@synthesize button;
@synthesize receivedData;

#pragma mark -
- (IBAction)findMe {
    CLLocationManager *lm = [[CLLocationManager alloc] init];
    lm.delegate = self;
    lm.desiredAccuracy = kCLLocationAccuracyBest;
    [lm startUpdatingLocation];
    
    
}
- (void)openCallout:(id<MKAnnotation>)annotation {
    
    [mapView selectAnnotation:annotation animated:YES];
}
#pragma mark -
- (void)viewDidLoad {
    mapView.mapType = MKMapTypeStandard;
    [self findMe];
    //    mapView.mapType = MKMapTypeSatellite;
    //    mapView.mapType = MKMapTypeHybrid;
    
    
    
    //NSMutableDictionary *myData = [[MyDataSource fetchLibraryInformation:kGetPointsURL] retain];
    //NSLog(@"------------------test-----------------,%d",myData.count);
    
    //[self postInfo];
    
    
}



-(void) postInfo{
    
    //NSString *str1 = @"aaaaa";
    //NSString *str2 = @"bbbbb";
    //NSString *str3 = @"ccccc";
    
    NSString *urlAddress = kGetPointsURL;
    
    //urlAddress = [kPostPointsURL stringByAppendingFormat:@"param1=%@&param2=%@&param3=%@",str1,str2,str3];
   
    NSLog(@"---urlAddress---,%@",urlAddress);
    
    NSURL *url = [NSURL URLWithString:urlAddress];
    //NSLog(@"--url--,%@",url);
    
	NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    NSURLConnection *theConnection=[[NSURLConnection alloc] initWithRequest:requestObj delegate:self];
    
    NSLog(@"--theConnection---,%@",theConnection);
    
    if (theConnection) {
        NSMutableData *data = [[NSMutableData alloc] init];
        receivedData = data;
    }
   
}



#pragma mark -
#pragma mark CLLocationManagerDelegate Methods
- (void)locationManager:(CLLocationManager *)manager 
    didUpdateToLocation:(CLLocation *)newLocation 
           fromLocation:(CLLocation *)oldLocation {
    
    if ([newLocation.timestamp timeIntervalSince1970] < [NSDate timeIntervalSinceReferenceDate] - 60)
        return;
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(newLocation.coordinate, 2000, 2000); 
    MKCoordinateRegion adjustedRegion = [mapView regionThatFits:viewRegion];
    [mapView setRegion:adjustedRegion animated:YES];
    
    manager.delegate = nil;
    [manager stopUpdatingLocation];
    [manager autorelease];
    
  
    MKReverseGeocoder *geocoder = [[MKReverseGeocoder alloc] initWithCoordinate:newLocation.coordinate];
    geocoder.delegate = self;
    [geocoder start];
}
- (void)locationManager:(CLLocationManager *)manager 
       didFailWithError:(NSError *)error {
    
    NSString *errorType = (error.code == kCLErrorDenied) ? 
    NSLocalizedString(@"Access Denied", @"Access Denied") : 
    NSLocalizedString(@"Unknown Error", @"Unknown Error");
    
    UIAlertView *alert = [[UIAlertView alloc] 
                          initWithTitle:NSLocalizedString(@"Error getting Location", @"Error getting Location")
                          message:errorType 
                          delegate:self 
                          cancelButtonTitle:NSLocalizedString(@"Okay", @"Okay") 
                          otherButtonTitles:nil];
    [alert show];
    [alert release];
    [manager release];
}

#pragma mark -
#pragma mark Reverse Geocoder Delegate Methods
- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFailWithError:(NSError *)error {
    UIAlertView *alert = [[UIAlertView alloc] 
                          initWithTitle:NSLocalizedString(@"Error translating coordinates into location", @"Error translating coordinates into location")
                          message:NSLocalizedString(@"Geocoder did not recognize coordinates", @"Geocoder did not recognize coordinates") 
                          delegate:self 
                          cancelButtonTitle:NSLocalizedString(@"Okay", @"Okay") 
                          otherButtonTitles:nil];
    [alert show];
    [alert release];
    
    geocoder.delegate = nil;
    [geocoder autorelease];
}
- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFindPlacemark:(MKPlacemark *)placemark {
     
    MapLocation *annotation = [[MapLocation alloc] init];
    annotation.streetAddress = placemark.thoroughfare;
    annotation.city = placemark.locality;
    annotation.state = placemark.administrativeArea;
    annotation.zip = placemark.postalCode;
    annotation.coordinate = geocoder.coordinate;
    
    [mapView addAnnotation:annotation];
    
    
    [annotation release];
    
    geocoder.delegate = nil;
    [geocoder autorelease];
}
#pragma mark -
#pragma mark Map View Delegate Methods
- (MKAnnotationView *) mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>) annotation {
    static NSString *placemarkIdentifier = @"Map Location Identifier";
    if ([annotation isKindOfClass:[MapLocation class]]) {
        MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[theMapView dequeueReusableAnnotationViewWithIdentifier:placemarkIdentifier];
        if (annotationView == nil)  {
            annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:placemarkIdentifier];
        }            
        else 
            annotationView.annotation = annotation;
        
        annotationView.enabled = YES;
        annotationView.animatesDrop = YES;
        annotationView.pinColor = MKPinAnnotationColorPurple;
        annotationView.canShowCallout = YES;
        [self performSelector:@selector(openCallout:) withObject:annotation afterDelay:0.5];
        
      
        return annotationView;
    }
    return nil;
}
- (void)mapViewDidFailLoadingMap:(MKMapView *)theMapView withError:(NSError *)error {
    UIAlertView *alert = [[UIAlertView alloc] 
                          initWithTitle:NSLocalizedString(@"Error loading map", @"Error loading map")
                          message:[error localizedDescription] 
                          delegate:nil 
                          cancelButtonTitle:NSLocalizedString(@"Okay", @"Okay") 
                          otherButtonTitles:nil];
    [alert show];
    [alert release];
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"Response Code: %d\n", [(NSHTTPURLResponse *)response statusCode]);
    NSLog(@"Content-Type: %@\n", [[(NSHTTPURLResponse *)response allHeaderFields] objectForKey:@"Content-Type"]);
    [receivedData setLength:0];
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [receivedData appendData:data];
    //NSLog(@"receivedData=====,%@",receivedData );
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
    
    NSString *loadAsString = [[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding];
    //[webView loadHTMLString:payloadAsString baseURL:[NSURL URLWithString:kFormURL]];
    NSLog(@"loadAsString====,%@",loadAsString );
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"---test--");
    UITouch *touch = [touches anyObject];    
    CGPoint touchPoint = [touch locationInView:self.view];
    NSLog(@"----latitude and longtitude--,%f,%f",touchPoint.x,touchPoint.y);  
    float xw = [self.view bounds].size.width;
    float yw = [self.view bounds].size.height;
    NSLog(@"touch -- %f %f", touchPoint.x / xw, touchPoint.y / yw);
}

- (IBAction)test:(id)sender
{
	NSLog(@"UIButton was clicked");
    //[self popover:sender];
    [self popover:sender];
}


-(void)popover:(id)sender
{
    //the controller we want to present as a popover
    EmotionTableController *controller = [[EmotionTableController alloc] initWithStyle:UITableViewStylePlain];
    
    FPPopoverController *popover = [[FPPopoverController alloc] initWithViewController:controller];
    [controller release];
    
    //popover.arrowDirection = FPPopoverArrowDirectionAny;
    popover.tint = FPPopoverDefaultTint;
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        popover.contentSize = CGSizeMake(200, 300);
    }
    popover.arrowDirection = FPPopoverArrowDirectionAny;
    
    //sender is the UIButton view
    [popover presentPopoverFromView:sender]; 
}


- (void)presentedNewPopoverController:(FPPopoverController *)newPopoverController 
          shouldDismissVisiblePopover:(FPPopoverController*)visiblePopoverController
{
    [visiblePopoverController dismissPopoverAnimated:YES];
    [visiblePopoverController autorelease];
}

@end
