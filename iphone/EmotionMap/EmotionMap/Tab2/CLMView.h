
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


@interface CLMView : UIView 
{

	float spaceHeight;
	float scaleY ; 
	NSArray *titleArr ; 
	NSArray *valueArr; 
	NSArray	*colorArr; 
}

@property(nonatomic, assign)  float spaceHeight;
@property(nonatomic, assign) float scaleY;
@property(nonatomic, retain) NSArray *titleArr;
@property(nonatomic, retain) NSArray *valueArr;
@property(nonatomic, retain) NSArray *colorArr;

@end
