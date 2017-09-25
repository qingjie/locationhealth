
#import "ParkPlaceMark.h"

@implementation ParkPlaceMark

@synthesize myCoordinate, myTitle, mySubTitle;


- (CLLocationCoordinate2D)coordinate;
{
    return self.myCoordinate;
}

- (NSString *)title
{
    return self.myTitle;
}

- (NSString *)subtitle
{
    return self.mySubTitle;
}

-(id)initWithCoordinate:(CLLocationCoordinate2D) coordinate{
	myCoordinate=coordinate;
	NSLog(@"%f,%f",myCoordinate.latitude,myCoordinate.longitude);
	return self;
}

@end