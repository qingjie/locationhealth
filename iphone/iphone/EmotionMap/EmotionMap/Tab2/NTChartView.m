

#import "NTChartView.h"

static int MARGIN_LEFT = 50;
static int MARGIN_BOTTOM = 30;
static int MARGIN_TOP = 20;
static int SHOW_SCALE_NUM = 5; 


@interface NTChartView(private)
-(void)drawColumn:(CGContextRef)context rect:(CGRect)_rect;
-(void)drawScale:(CGContextRef)context rect:(CGRect)_rect;
-(void)calcScales:(CGRect)_rect;
@end

@implementation NTChartView
@synthesize groupData;


- (void) dealloc
{
	[groupData release];
	[super dealloc];
}


-(void)drawRect:(CGRect)_rect{
	
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
	CGContextFillRect(context, _rect);
	
	[self calcScales:_rect];
	
	[self drawScale:context rect:_rect];

	[self drawColumn:context rect:_rect];
		
}

-(void)drawScale:(CGContextRef)context rect:(CGRect)_rect{
	CGPoint points[3];
	points[0] = CGPointMake(MARGIN_LEFT - 10, MARGIN_TOP);
	points[1] = CGPointMake(MARGIN_LEFT -10, _rect.size.height - MARGIN_BOTTOM + 1);
	points[2] = CGPointMake(_rect.size.width - 10, _rect.size.height - MARGIN_BOTTOM + 1);
	CGContextSetAllowsAntialiasing(context, NO);
	CGContextAddLines(context, points, 3);
	
	
	CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor); 
	
	for(int i=0;i<SHOW_SCALE_NUM + 1; i++){
		maxScaleHeight = (_rect.size.height - MARGIN_BOTTOM) * ( i ) / (SHOW_SCALE_NUM + 1);
		int vScal = ceil(1.0 * maxScaleValue / (SHOW_SCALE_NUM ) * (i ));
		float y = (_rect.size.height - MARGIN_BOTTOM) -
			maxScaleHeight;
		
		NSString *scaleStr = [NSString stringWithFormat:@"%d",vScal];
		[scaleStr
			drawAtPoint:CGPointMake(MARGIN_LEFT - 20 - [scaleStr sizeWithFont:[UIFont systemFontOfSize:12]].width, y - 10) withFont:[UIFont systemFontOfSize:12]];
		points[0] = CGPointMake(MARGIN_LEFT - 10, y);
		points[1] = CGPointMake(MARGIN_LEFT - 13, y);
		CGContextSetLineDash(context, 0, NULL, 0);
		CGContextAddLines(context, points, 2);
		CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);

		CGContextDrawPath(context, kCGPathStroke);

		
		points[0] = CGPointMake(MARGIN_LEFT - 10, y);
		points[1] = CGPointMake(_rect.size.width - 10 , y);
		float partren[] = {2,3};
		CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:.7 green:.7 blue:.7 alpha:1].CGColor);

		CGContextSetLineDash(context, 0,partren , 2);
		CGContextAddLines(context, points, 2);
		CGContextDrawPath(context, kCGPathStroke);
		
	}
	
	CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);

	CGContextDrawPath(context, kCGPathStroke);
	CGContextSetAllowsAntialiasing(context, YES);

	
}

-(void)drawColumn:(CGContextRef)context rect:(CGRect)_rect{
	int gNumber = 0, vNumber = 0;
	int baseGroundY = _rect.size.height - MARGIN_BOTTOM, baseGroundX = MARGIN_LEFT;
	CGPoint points[4];
	
	UIColor *columnColor = [UIColor redColor];
	
	CGContextSetFillColorWithColor(context, columnColor.CGColor);
	CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
	
	for(NSArray *g in groupData){
		vNumber = 0;
		for(NSNumber *v in g){

			float columnHeight = [v floatValue] / maxScaleValue * maxScaleHeight ;

			CGContextSetFillColorWithColor(context, columnColor.CGColor);
			CGContextAddRect(context, CGRectMake(vNumber * 20 + baseGroundX + columnWidth * vNumber
												 , baseGroundY - columnHeight 
												 , columnWidth
												 , columnHeight));
			CGContextDrawPath(context, kCGPathFill);
			NSLog(@"columnHeight:%f, (_rect.size.height - MARGIN_TOP - MARGIN_BOTTOM ):%f",columnHeight,(_rect.size.height - MARGIN_TOP - MARGIN_BOTTOM ));

			if(columnHeight < 10){
				vNumber++;
				continue;
			}
			

			CGContextSetFillColorWithColor(context, [UIColor colorWithRed:.9 green:0 blue:0 alpha:1].CGColor);
			points[0] = CGPointMake(vNumber * 20 + baseGroundX + columnWidth * vNumber + columnWidth, baseGroundY - columnHeight -10);
			points[1] = CGPointMake(vNumber * 20 + baseGroundX + columnWidth * vNumber + columnWidth + sideWidth, baseGroundY - columnHeight -10 );
			points[2] = CGPointMake(vNumber * 20 + baseGroundX + columnWidth * vNumber + columnWidth + sideWidth, baseGroundY );
			points[3] = CGPointMake(vNumber * 20 + baseGroundX + columnWidth * vNumber + columnWidth, baseGroundY );
			
			CGContextAddLines(context, points, 4);
			CGContextDrawPath(context, kCGPathFill);
			

			CGContextSetFillColorWithColor(context, [UIColor colorWithRed:1 green:.4 blue:.4 alpha:1].CGColor);
			points[0] = CGPointMake(vNumber * 20 + baseGroundX + columnWidth * vNumber , baseGroundY - columnHeight );
			points[1] = CGPointMake(vNumber * 20 + baseGroundX + columnWidth * vNumber + sideWidth, baseGroundY - columnHeight -10 );
			points[2] = CGPointMake(vNumber * 20 + baseGroundX + columnWidth * vNumber + columnWidth + sideWidth , baseGroundY - columnHeight -10 );
			points[3] = CGPointMake(vNumber * 20 + baseGroundX + columnWidth * vNumber + columnWidth, baseGroundY - columnHeight );
			
			CGContextAddLines(context, points, 4);
			CGContextDrawPath(context, kCGPathFill);
			
			
			vNumber++;
		}
		gNumber ++; 
	}
	
	
}

-(void)calcScales:(CGRect)_rect{
	int columnCount = 0;
	for(NSArray *g in groupData){
		for(NSNumber *v in g){
			if(maxValue<[v floatValue]) maxValue = [v floatValue];
			if(minValue>[v floatValue]) minValue = [v floatValue];
			columnCount++;
		}
	}
	
	maxScaleValue = ((int)ceil(maxValue) + (SHOW_SCALE_NUM - (int)ceil(maxValue) % SHOW_SCALE_NUM));
	
	columnWidth = (_rect.size.width - MARGIN_LEFT * 2) / (columnCount + 1);
	sideWidth = columnWidth *.2;
	columnWidth *= .8;	
}

@end
