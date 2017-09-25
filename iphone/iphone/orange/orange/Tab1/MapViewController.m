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
@synthesize alertViewListEmotion,txtDescription;
@synthesize myTableView;


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
    
    CLLocationCoordinate2D loc = [newLocation coordinate];
    [Global sharedInstance].strLatitude = [NSString stringWithFormat: @"%f", loc.latitude];
    [Global sharedInstance].strLongitude= [NSString stringWithFormat: @"%f", loc.longitude];
	
    
    //Current location
	//NSLog(@"----11223344-----strLatitude---strLongitude--,%@ %@",[Global sharedInstance].strLatitude,[Global sharedInstance].strLongitude);
    
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
        annotationView.pinColor = MKPinAnnotationColorRed;
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

- (void)tapPress:(UIGestureRecognizer*)gestureRecognizer{
    /*
    CGPoint touchPoint = [gestureRecognizer locationInView:self.mapView];
    
    CLLocationCoordinate2D touchMapCoordinate =
    [self.mapView convertPoint:touchPoint toCoordinateFromView:self.mapView];
    
    
    NSLog(@"touching point %f,%f",touchMapCoordinate.latitude,touchMapCoordinate.longitude);
    NSString *strLat  = [[NSNumber numberWithFloat:touchMapCoordinate.latitude] stringValue];
    NSString *strLong = [[NSNumber numberWithFloat:touchMapCoordinate.longitude] stringValue];
    
    
    [Global sharedInstance].strLatitude = strLat;
    [Global sharedInstance].strLongitude= strLong;
    */
     /*
    if (annotationa) {
        
        [self.mapView   removeAnnotation:annotationa];
        
    }
    annotationa =[[[DisplayMap alloc]  initWithCoordinate:touchMapCoordinate]  autorelease];  
    
    
    [self.mapView   addAnnotation:annotationa];
    
    */
   
    UIButton *testButton= [[UIButton alloc] init];
    [testButton addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
    [testButton sendActionsForControlEvents: UIControlEventTouchUpInside];
}



#pragma mark -
- (void)viewDidLoad {
    mapView.mapType = MKMapTypeStandard;
    [self findMe];
     [self getDataFromJSON];
    //    mapView.mapType = MKMapTypeSatellite;
    //    mapView.mapType = MKMapTypeHybrid;
    
    
    
    //NSMutableDictionary *myData = [[MyDataSource fetchLibraryInformation:kGetPointsURL] retain];
    //NSLog(@"------------------test-----------------,%d",myData.count);
    
    //[self postInfo];
    //////////////////////////////////
    UITapGestureRecognizer *mTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapPress:)];
    [self.mapView addGestureRecognizer:mTap];
        
    
}

-(void) initColor{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    appDelegate.globalarray = [[NSMutableArray alloc] initWithObjects:@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0", nil];
}



-(void) loadData{
    
   
    
    
    itemArray=[[NSMutableArray alloc]init];
    NSMutableArray *itemarray=[[NSMutableArray alloc]init];
    NSMutableArray *displayedObjects1 = [MyDataSource fetchLibraryInformation];
    
    
    [self initColor];
    
    
    
    /*NSLog(@"--- count-123--,%@", [appDelege globalarray]);
    for (int i=0; i<[appDelege.globalarray count]; i++) {
        NSLog(@"--- count-123--,%@",[appDelege.globalarray objectAtIndex:i]);
    }
    */
    
    for(int i=0;i<[displayedObjects1 count]; i++){
        NSString *strName = [[displayedObjects1 objectAtIndex:i] objectForKey:@"name"];
        //NSLog(@"---strName--,%@",strName);
        NSString *strImgName = [strName stringByAppendingString:@".png"];
        
        //[itemarray addObject:[[ImageAndTitle alloc] initWithImage:strImgName Title:strName Color:[appDelegate.globalarray objectAtIndex:i]]];
        [itemarray addObject:[[ImageAndTitle alloc] initWithImage:strImgName Title:strName Color:@"0"]];
    }
    
	[self setItem:itemarray];
    
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


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
	printf("User Pressed Button %d\n",buttonIndex+1);
	switch (buttonIndex) {
        case 0:
            //Cancel
            NSLog(@"---Cancel----");
            //[self.myTableView reloadData];
            break;
        case 1:
            NSLog(@"---Submit----");
            //Set
            //NSLog(@"%@",[(CustomPickerView *)alertView getResult]);
			
            
			if (alertView.tag == 888) {
                NSLog(@"");
                AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
                NSLog(@"===========---------==========,%@",appDelegate.globalarray);
				NSLog(@"----888----,%@" , txtDescription.text);
                [self submitDataToJSON:appDelegate.globalarray:txtDescription.text];
			}
			
            break;
        default:
            break;
    }
}


-(void) submitDataToJSON:(NSMutableArray *)mArray :(NSString *)desc{
    
    int strUserId = 1;
    
    NSMutableString * mString = [[NSMutableString alloc] init];
    for (int i=0; i<[mArray count]; i++) {
        [mString appendString:[mArray objectAtIndex:i]];
    }
    /*
    NSLog(@"===strLatitude====,%@",[[Global sharedInstance] strLatitude]);
    NSLog(@"===strLongitude====,%@",[[Global sharedInstance] strLongitude]);
    NSLog(@"---mArray----,%@",mString);
    NSLog(@"===desc====,%@",desc);
    */
    
    //NSString *strURL = @"http://192.168.0.100:8080/emotionmap/pages/addemotion.jsp?";
    NSString *strURL = @"http://orange.ischool.syr.edu:8080/emotionmap/pages/addemotion.jsp?";
    
    strURL = [strURL stringByAppendingFormat:@"strUserId=%d&strLatitude=%@&strLongitude=%@&strEmotion_selected=%@&strDesc=%@",strUserId,[[Global sharedInstance] strLatitude],[[Global sharedInstance] strLongitude],mString,desc];
    
    
    //NSLog(@"---strURL---,%@",strURL);
    NSURL *url = [NSURL URLWithString:strURL];
    //NSLog(@"--url--,%@",url);
    
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    
    NSURLConnection *theConnection=[[NSURLConnection alloc] initWithRequest:requestObj delegate:self];
    
    //NSLog(@"--theConnection---,%@",theConnection);
    
    if (theConnection) {
        NSMutableData *data = [[NSMutableData alloc] init];
        receivedData = data;
    }

    
}



- (void)textFieldDidBeginEditing:(UITextField *)textField{
	
	switch (textField.tag) {
		case 888:
			NSLog(@"========hello1============");
			//[textField becomeFirstResponder];
			
			
			break;
		default:
			break;
	}
    
}


- (void)action:(id)sender
{
	
    alertViewListEmotion=[[UIAlertView alloc] initWithTitle: @"Add Your Emotion" message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Submit",nil];
    alertViewListEmotion.tag = 888;
	[alertViewListEmotion show];
}



- (void)willPresentAlertView:(UIAlertView *)alertView{
    
    [self loadData];
    
    CGRect frame = alertView.frame;
    
    if( alertView == alertViewListEmotion)
	{
		frame.origin.y = 70;
		frame.size.height = 280;
		alertView.frame = frame;
		for( UIView * view in alertView.subviews )
		{
			if( ![view isKindOfClass:[UILabel class]] )
			{
                if (view.tag==1)
                {
                   	CGRect btnFrame1 =CGRectMake(15, frame.size.height-65, 105, 40);
					view.frame = btnFrame1;
					
                } else if  (view.tag==2){
                    
                    CGRect btnFrame2 =CGRectMake(162, frame.size.height-65, 105, 40);
                    view.frame = btnFrame2;
                }
			}
		}
		
        // accoutName = [[UITextView alloc] initWithFrame: CGRectMake( 30, 50,220, 90 )];
		//[alertView addSubview:accoutName];
		
		myTableView = [[[UITableView alloc] initWithFrame:CGRectMake(10, 40, 264, 140)
                                                            style:UITableViewStylePlain] autorelease];
        myTableView.delegate = self;
        myTableView.dataSource = self;
        
        
        txtDescription = [[UITextField alloc] initWithFrame: CGRectMake( 10, 184,264, 30 )];
        txtDescription.placeholder = @"Description";
        txtDescription.borderStyle=UITextBorderStyleRoundedRect;
		txtDescription.clearButtonMode = UITextFieldViewModeWhileEditing;
		txtDescription.delegate = self;
        txtDescription.tag=667;
        
        [alertView addSubview:myTableView];
        [alertView addSubview:txtDescription];
        
	}
    
    
    
}




- (void) getDataFromJSON{
  
    NSMutableArray *displayedObjects1 = [MyDataSource showUserInfoOnMap];
    NSLog(@"test------,%@",displayedObjects1);
    
    
    
    for (int i=0; i<[displayedObjects1 count]; i++) {
        
        NSString *strDescription = [[displayedObjects1 objectAtIndex:i] objectForKey:@"description"];
        NSLog(@"---strDescription--,%@",strDescription);
        
        NSString *strLatitude = [[displayedObjects1 objectAtIndex:i] objectForKey:@"latitude"];
        NSLog(@"---strLatitude--,%@",strLatitude);
        
        NSString *strLongitude = [[displayedObjects1 objectAtIndex:i] objectForKey:@"longitude"];
        NSLog(@"---strLongitude--,%@",strLongitude);
        
        NSString *strEmotion_selected = [[displayedObjects1 objectAtIndex:i] objectForKey:@"emotion_selected"];
        NSLog(@"---strEmotion_selected--,%@",strEmotion_selected);
        
    }
    
    
}


-(void)setItem:(NSArray *)tempArray{
	[itemArray addObjectsFromArray:tempArray];
    
}

-(void)addItem:(ImageAndTitle *)iat{
	[itemArray addObject:iat];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	
    return 71;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    int i=[itemArray count]/4;
	//i++;
	return i;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
	static NSString *cellIdentifier = @"ViewCell";
	ViewCell *cell = (ViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
       
    
	if (cell == nil) {
		[[NSBundle mainBundle] loadNibNamed:@"ViewCell" owner:self options:nil];
		cell = viewCell;
	}
    
  	if ((indexPath.row*4)<=([itemArray count]-1)) {
		ImageAndTitle * i=[itemArray objectAtIndex:indexPath.row*4];
		cell.lbl1.text=[NSString stringWithFormat:@"%@",i.myTitle];
        
        if ([i.myColor isEqualToString:@"1"]) {
            cell.lbl1.textColor = [UIColor redColor];
        }
        
        [cell.btn1 addTarget:self action:@selector(refreshButton:) forControlEvents:UIControlEventTouchUpInside];
        
        [cell.btn1 setTitle:[NSString stringWithFormat:@"%@", i.myTitle] forState:UIControlStateNormal];
        
		[cell.btn1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",i.myImage]] forState:UIControlStateNormal];
		//[cell.btn1 setHighlighted:YES];
        [cell.btn1 setTag:indexPath.row*4];
        
        
	}
	if ((indexPath.row*4+1)<=([itemArray count]-1)) {
		ImageAndTitle * i=[itemArray objectAtIndex:indexPath.row*4+1];
		cell.lbl2.text=[NSString stringWithFormat:@"%@",i.myTitle];
        
        if ([i.myColor isEqualToString:@"1"]) {
            cell.lbl2.textColor = [UIColor redColor];
        }
         
        [cell.btn2 addTarget:self action:@selector(refreshButton:) forControlEvents:UIControlEventTouchUpInside];
        
        [cell.btn2 setTitle:[NSString stringWithFormat:@"%@", i.myTitle] forState:UIControlStateNormal];
		[cell.btn2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",i.myImage]] forState:UIControlStateNormal];
		[cell.btn2 setTag:indexPath.row*4+1];
        
	}
	if ((indexPath.row*4+2)<=([itemArray count]-1)) {
		ImageAndTitle * i=[itemArray objectAtIndex:indexPath.row*4+2];
		cell.lbl3.text=[NSString stringWithFormat:@"%@",i.myTitle];
       
		if ([i.myColor isEqualToString:@"1"]) {
            cell.lbl3.textColor = [UIColor redColor];
        }
        
        [cell.btn3 addTarget:self action:@selector(refreshButton:) forControlEvents:UIControlEventTouchUpInside];
        [cell.btn3 setTitle:[NSString stringWithFormat:@"%@", i.myTitle] forState:UIControlStateNormal];
        [cell.btn3 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",i.myImage]] forState:UIControlStateNormal];
		[cell.btn3 setTag:indexPath.row*4+2];
        
	}
    if ((indexPath.row*4+3)<=([itemArray count]-1)) {
		ImageAndTitle * i=[itemArray objectAtIndex:indexPath.row*4+3];
		cell.lbl4.text=[NSString stringWithFormat:@"%@",i.myTitle];
        
		if ([i.myColor isEqualToString:@"1"]) {
            cell.lbl4.textColor = [UIColor redColor];
        }
        
        [cell.btn4 addTarget:self action:@selector(refreshButton:) forControlEvents:UIControlEventTouchUpInside];
        [cell.btn4 setTitle:[NSString stringWithFormat:@"%@", i.myTitle] forState:UIControlStateNormal];
        [cell.btn4 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",i.myImage]] forState:UIControlStateNormal];
		[cell.btn4 setTag:indexPath.row*4+3];
        
	}
    
    return cell;
    
    
}


- (void)refreshButton:(NSString *)str {
    
    //[self loadData];
        itemArray=[[NSMutableArray alloc]init];
        NSMutableArray *itemarray=[[NSMutableArray alloc]init];
        NSMutableArray *displayedObjects1 = [MyDataSource fetchLibraryInformation];
    
        AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        //NSLog(@"===========---------==========,%@",appDelegate.globalarray);
        
        for(int i=0;i<[displayedObjects1 count]; i++){
            NSString *strName = [[displayedObjects1 objectAtIndex:i] objectForKey:@"name"];
            //NSLog(@"---strName--,%@",strName);
            NSString *strImgName = [strName stringByAppendingString:@".png"];
            
            [itemarray addObject:[[ImageAndTitle alloc] initWithImage:strImgName Title:strName Color:[appDelegate.globalarray objectAtIndex:i]]];
            //[itemarray addObject:[[ImageAndTitle alloc] initWithImage:strImgName Title:strName Color:@"0"]];
        }
        
        [self setItem:itemarray];
        
    
    [self.myTableView reloadData];
   
}


@end
