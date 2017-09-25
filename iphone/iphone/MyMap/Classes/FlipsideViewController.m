
#import "FlipsideViewController.h"


@implementation FlipsideViewController

@synthesize delegate;


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];      
}


- (IBAction)done {
	[self.delegate flipsideViewControllerDidFinish:self];	
}




@end
