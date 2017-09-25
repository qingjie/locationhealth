

#import <UIKit/UIKit.h>


@interface PieChartView : UIView 
{
	NSMutableArray* m_aPercent;
	NSMutableArray* m_aHint;

	CGPoint m_charCenter;
	CGRect m_charRect;
	CGRect m_hintRect;
	float m_r;
	float m_sperate;
}
@property(nonatomic,retain)NSMutableArray* m_aPercent;
@property(nonatomic,retain)NSMutableArray* m_aHint;
@end

