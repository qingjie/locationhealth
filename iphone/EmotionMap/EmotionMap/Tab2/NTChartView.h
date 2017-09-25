

#import <Foundation/Foundation.h>


@interface NTChartView : UIView {
	
	NSArray *groupData;
	
	float maxValue,minValue,columnWidth,sideWidth,maxScaleValue,maxScaleHeight;
	
	
}

@property(retain,nonatomic) NSArray *groupData;
@end
