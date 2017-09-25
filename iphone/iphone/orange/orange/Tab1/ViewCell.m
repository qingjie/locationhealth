//
//  ViewCell.m
//  EmotionMap
//
//  Created by qingjie zhao on 10/18/12.
//  Copyright (c) 2012 SU. All rights reserved.
//


#import "ViewCell.h"
#import "Global.h"

@implementation ViewCell
@synthesize btn1,btn2,btn3,btn4,btn5,btn6,lbl1,lbl2,lbl3,lbl4,lbl5,lbl6,delegate;
@synthesize receivedData;



-(IBAction)click:(id)sender{
    
	UIButton *button = (UIButton *)sender;
	int btnIndex = button.tag;
    NSLog(@"tag: %d", btnIndex);
    NSString *btnName = button.titleLabel.text;
    
    NSLog(@"======button.titleLabel.text: ========%@ ", btnName);
    NSLog(@"====count=====,%d",[[self updateTextColor:btnIndex] count]);
    
    /*
    NSLog(@"-----test------,%@,%@",[[Global sharedInstance] strLatitude],[[Global sharedInstance] strLongitude]);
    [self postDataToJSON: [[Global sharedInstance] strLatitude]:[[Global sharedInstance] strLongitude]];
	[delegate onCellItem:button.tag];
    */
}



- (NSMutableArray *) updateTextColor:(int)btnIndex{
    
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    /*
    for (int i=0; i<[appDelegate.globalarray count]; i++) {
        NSLog(@"--- count-123--,%@",[appDelegate.globalarray objectAtIndex:i]);
    }
    */
    if ([[[appDelegate globalarray] objectAtIndex:btnIndex] isEqualToString:@"0"]) {
        [appDelegate.globalarray removeObjectAtIndex:btnIndex];
        [appDelegate.globalarray insertObject:@"1" atIndex:btnIndex];
    }else if([[[appDelegate globalarray] objectAtIndex:btnIndex] isEqualToString:@"1"]){
        [appDelegate.globalarray removeObjectAtIndex:btnIndex];
        [appDelegate.globalarray insertObject:@"0" atIndex:btnIndex];
    }
    
    return appDelegate.globalarray;
}

-(void) postDataToJSON:(NSString *)str1 :(NSString *)str2{
    
     NSString *strURL = @"http://orange.ischool.syr.edu:8080/emotionmap/pages/addemotion.jsp?";
     int strUserId = 1;
     int strEmotion_selected = 6;
     NSString *strDescription = @"description1";
    
     strURL = [strURL stringByAppendingFormat:@"strUserId=%d&strLatitude=%@&strLongitude=%@&strEmotion_selected=%d&strEmotion_selected=%@",strUserId,str1,str2,strEmotion_selected,strDescription];
     
     
     //NSLog(@"---strURL---,%@",strURL);
     NSURL *url = [NSURL URLWithString:strURL];
     //NSLog(@"--url--,%@",url);
     
     NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
     
     
     NSURLConnection *theConnection=[[NSURLConnection alloc] initWithRequest:requestObj delegate:self];
     
     //NSLog(@"--theConnection---,%@",theConnection);
     
     if (theConnection) {
     NSMutableData *data = [[NSMutableData alloc] init];
     receivedData = data;
     }
     
    
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"Response Code: %d\n", [(NSHTTPURLResponse *)response statusCode]);
    NSLog(@"Content-Type: %@\n", [[(NSHTTPURLResponse *)response allHeaderFields] objectForKey:@"Content-Type"]);
    [receivedData setLength:0];
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [receivedData appendData:data];
    NSLog(@"receivedData=====,%@",receivedData );
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSString *payloadAsString = [[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding];
    NSLog(@"payloadAsString====,%@",payloadAsString );
    
}

@end
