#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface ParkPlaceMark : NSObject <MKAnnotation> {
        CLLocationCoordinate2D myCoordinate;
        NSString *myTitle;
        NSString *mySubTitle;
        
}
    
@property(assign, nonatomic) CLLocationCoordinate2D myCoordinate;
@property(retain, nonatomic) NSString *myTitle;
@property(retain, nonatomic) NSString *mySubTitle;

-(id)initWithCoordinate:(CLLocationCoordinate2D) coordinate;

@end
