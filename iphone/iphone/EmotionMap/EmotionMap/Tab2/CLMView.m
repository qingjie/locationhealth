

#import "CLMView.h"



#define K_PI 3.1415
#define KDGREED(x) ((x)  * K_PI * 2)


@implementation CLMView
@synthesize spaceHeight, scaleY;
@synthesize titleArr, valueArr, colorArr;


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
		self.backgroundColor = [UIColor grayColor];
		
		spaceHeight = 40;
		scaleY = 0.4;
		
				
    }
    return self;
}


- (void)drawRect:(CGRect)rect 
{
	CGContextRef context = UIGraphicsGetCurrentContext();
	//cgcontextsets
	

	CGContextSetAllowsAntialiasing(context, TRUE);
	
//	int arr[5] = {20, 15, 35, 85 ,60};
	
	float sum = 0;
	
	
	for(int j=0;j< [valueArr count]; j++)
	{
		sum	 += [[valueArr objectAtIndex:j] floatValue];
	}
	
	
	CGContextMoveToPoint(context, 160, 230);
	
	float currentangel = 0;
	

	CGContextSaveGState(context);
	CGContextScaleCTM(context, 1.0, scaleY);

	currentangel = 0;
	
	for(int i = 0; i< [valueArr count]; i++)
	{

		float startAngle = KDGREED(currentangel);
		
		currentangel += [[valueArr objectAtIndex:i] floatValue] / sum;
		
		float endAngle = KDGREED(currentangel);
		

		CGContextMoveToPoint(context, 160, 230);
		
		[[colorArr objectAtIndex:i %  [valueArr count]] setFill];
		
		[[UIColor colorWithWhite:1.0 alpha:0.8] setStroke];
		
		CGContextAddArc(context, 160, 230, 150, startAngle, endAngle, 0);
		
		CGContextClosePath(context);
		CGContextDrawPath(context, kCGPathFill);
		
		

		float starx = cos(startAngle) * 150  +160;
		float stary = sin(startAngle) * 150 + 230;
		
		float endx = cos(endAngle) * 150 + 160;
		float endy = sin(endAngle) * 150 + 230;
		
		//float starty1 = stary + spaceHeight;
		float endy1 = endy + spaceHeight;
		
		
		if(endAngle < K_PI)
		{
		}

		else if(startAngle < K_PI)
		{
			endAngle = K_PI;
			endx = 10;
			endy1 = 230+spaceHeight;
		}
		
		else
			break;
		 
		
		//CGContextSetBlendMode(context, kCGBlendModeMultiply);
		
		

		CGMutablePathRef path = CGPathCreateMutable();
		CGPathMoveToPoint(path, nil, starx, stary);
		CGPathAddArc(path, nil, 160, 230, 150, startAngle, endAngle, 0);
		CGPathAddLineToPoint(path, nil, endx, endy1);
		
		CGPathAddArc(path, nil, 160, 230 + spaceHeight, 150, endAngle, startAngle, 1);
		CGContextAddPath(context, path);
		
		[[colorArr objectAtIndex:i %  [valueArr count]] setFill];
		[[UIColor colorWithWhite:0.9 alpha:1.0] setStroke];
		
		CGContextDrawPath(context, kCGPathFill);
		
		[[UIColor colorWithWhite:0.1 alpha:0.4] setFill];
		CGContextAddPath(context, path);
		CGContextDrawPath(context, kCGPathFill);


			
		

	}
	
	

	CGFloat componets [] = {0.0, 0.0, 0.0, 0.5,0.0,0.0,0.0,0.1};
	
	CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
	
	CGGradientRef gradient = CGGradientCreateWithColorComponents(colorspace, componets, nil, 2);
	
	CGContextDrawRadialGradient(context, gradient, CGPointMake(160,230), 0, CGPointMake(160,230), 150, 0 );
	
	CFRelease(colorspace);
	CGGradientRelease(gradient);
	
	
	CGContextRestoreGState(context);

	
	for(int i = 0; i< [valueArr count]; i++)
	{
		float origionx = 50 ;
		float origiony = i * 30 + 200;
		
		[[colorArr objectAtIndex:i %  [valueArr count]] setFill];
		
		CGContextFillRect(context, CGRectMake(origionx, origiony, 20, 20));
		CGContextDrawPath(context, kCGPathFill);
		
		
		if(i< [titleArr count])
		{
			NSString *title = [ titleArr objectAtIndex:i];
			[title drawAtPoint:CGPointMake(origionx + 50, origiony) withFont:[UIFont systemFontOfSize:16]];
		}
		
	}
	
}


- (void)dealloc {
	[titleArr release];
	[valueArr release];
	[colorArr release];
    [super dealloc];
}


@end
