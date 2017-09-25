//
//  Tab3ViewController.m
//  EmotionMap
//
//  Created by qingjie zhao on 9/27/12.
//  Copyright (c) 2012 SU. All rights reserved.
//

#import "Tab3ViewController.h"
#import "JSON.h"

@implementation Tab3ViewController
@synthesize lblName;
@synthesize lblAge;
@synthesize img;
@synthesize receivedData;
@synthesize myAlertView,accoutName,accoutPassword;


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Profile";
    
    myAlertView=[[UIAlertView alloc] initWithTitle:@"Logout" message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Submit",nil];
    myAlertView.tag = 100;
    [myAlertView show];
    
    
    UIBarButtonItem *logoutButton = [[UIBarButtonItem alloc] initWithTitle:@"Logout" 
                                                                   style:UIBarButtonItemStylePlain 
                                                                  target:self 
                                                                  action:@selector(logout:)];
    
    
    self.navigationItem.rightBarButtonItem = logoutButton;


    
}


- (void)willPresentAlertView:(UIAlertView *)alertView
{
	CGRect frame = alertView.frame;
	if( alertView==myAlertView )
	{
		frame.origin.y -= 120;
		frame.size.height += 80;
		alertView.frame = frame;
		for( UIView * view in alertView.subviews )
		{
			if( ![view isKindOfClass:[UILabel class]] )
			{

                if (view.tag==1)
                {
                   	CGRect btnFrame1 =CGRectMake(30, frame.size.height-65, 105, 40);
                    view.frame = btnFrame1;
                    
                } else if  (view.tag==2){
                    CGRect btnFrame2 =CGRectMake(142, frame.size.height-65, 105, 40);
                    view.frame = btnFrame2;
                }
			}
		}
		
     
        
        accoutName = [[UITextField alloc] initWithFrame: CGRectMake(30, 50,220, 30 )];
        accoutName.placeholder = @"Username";
        accoutName.borderStyle=UITextBorderStyleRoundedRect;
        accoutName.clearButtonMode = UITextFieldViewModeWhileEditing;
        accoutName.text = @"huangyun";
        
        accoutPassword = [[UITextField alloc] initWithFrame: CGRectMake(30, 85,220, 30 )];
        accoutPassword.placeholder = @"Password";
        accoutPassword.borderStyle=UITextBorderStyleRoundedRect;
        accoutPassword.clearButtonMode = UITextFieldViewModeWhileEditing;
        accoutPassword.secureTextEntry=YES;
        accoutPassword.text = @"666666";

		[alertView addSubview:accoutName];
		[alertView addSubview:accoutPassword];
	}
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
	//printf("User Pressed Button %d\n",buttonIndex+1);
	switch (buttonIndex) {
        case 0:
            if(alertView.tag == 100){
                NSLog(@"---Cancel----");
                exit(0);
                
            }else if(alertView.tag == 200){
                NSLog(@"---NO----");
               
            }
            
            break;
        case 1:
            if(alertView.tag == 100){
                
                NSLog(@"---Submit--accoutName--accoutPassword-,%@,%@",accoutName.text,accoutPassword.text);
                [self login:accoutName.text :accoutPassword.text];
            }else if(alertView.tag == 200){
                NSLog(@"---YES----");
                exit(0);
            }
            			
            break;
        default:
            break;
    }
}

- (void) login:(NSString *)strUsername :(NSString *)strPassword{
    
    NSString *strURL = @"http://orange.ischool.syr.edu:8080/emotionmap/pages/login.jsp?";
    
    strURL = [strURL stringByAppendingFormat:@"strUserName=%@&strPassword=%@",strUsername,strPassword];
    
    NSURL *url = [NSURL URLWithString:strURL];
   
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    NSURLConnection *theConnection=[[NSURLConnection alloc] initWithRequest:requestObj delegate:self];
    
    if (theConnection) {
        NSMutableData *data = [[NSMutableData alloc] init];
        receivedData = data;
    }    
}



- (IBAction)logout:(id)sender{
     
    UIAlertView *logoutAlert=[[UIAlertView alloc] initWithTitle:@"Logout" message:@"Do you want to logout?"  delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"YES",nil];
    logoutAlert.tag = 200;
    [logoutAlert show];
     
}




- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"Response Code: %d\n", [(NSHTTPURLResponse *)response statusCode]);
    NSLog(@"Content-Type: %@\n", [[(NSHTTPURLResponse *)response allHeaderFields] objectForKey:@"Content-Type"]);
    [receivedData setLength:0];
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [receivedData appendData:data];
    NSLog(@"====receivedData=====,%@",receivedData );
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSString *payloadAsString = [[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding];
    
    NSLog(@"=====payloadAsString====,%@",payloadAsString);
    
    NSError *error = nil; 
    SBJsonParser *parser = [[SBJsonParser alloc] init]; 
    NSDictionary *rootDic = [parser objectWithString:payloadAsString error:&error];
    NSLog(@"-----name-----,%@",[rootDic objectForKey:@"username"]);
    NSLog(@"-----age-----,%@",[rootDic objectForKey:@"age"]);
    lblName.text = [rootDic objectForKey:@"username"];
    lblAge.text = [rootDic objectForKey:@"age"];
 
}


@end
