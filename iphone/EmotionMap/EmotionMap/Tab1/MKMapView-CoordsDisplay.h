//
//  MKMapView-CoordsDisplay.h
//  EmotionMap
//
//  Created by qingjie zhao on 10/3/12.
//  Copyright (c) 2012 SU. All rights reserved.
//

#import <MapKit/MapKit.h>


@interface MKMapView(CoordsDisplay)
- (BOOL)coordinatesInRegion:(CLLocationCoordinate2D)coords;
@end