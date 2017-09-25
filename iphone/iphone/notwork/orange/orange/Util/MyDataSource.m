//
//  MyDataSource.m
//  EmotionMap
//
//  Created by qingjie zhao on 10/9/12.
//  Copyright (c) 2012 SU. All rights reserved.
//

#import "MyDataSource.h"
#import "JSON.h"

@implementation MyDataSource

+ (NSMutableArray *)showUserInfoOnMap
{
    NSString *userId = @"1";
    
    NSString *urlString = [NSString stringWithFormat:@"http://localhost:8080/emotionmap/pages/getLocationsByUserId/%@",userId];
    
    NSURL *url = [NSURL URLWithString:urlString];
   
    NSMutableArray *strJson = [self fetchJSONValueForURL:url];
    
    return strJson;
}

+ (NSMutableArray *)fetchLibraryInformation
{
    NSString *userId = @"2";
    //NSString *param = @"zhaoqingjie";
    NSString *urlString = [NSString stringWithFormat:@"http://orange.ischool.syr.edu:8080/emotionmap/pages/listEmotion/%@",userId];
    
    //urlString = [urlString stringByAppendingFormat:@"%d",user];
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSMutableArray *strJson = [self fetchJSONValueForURL:url];
    
    return strJson;
}

+ (NSMutableArray *)fetchDailyReport
{
    int userId = 2;
    //NSString *urlString = [NSString stringWithFormat:@"http://192.168.0.100:8080/emotionmap/pages/dailyReport/%d",userId];
    
    NSString *urlString = [NSString stringWithFormat:@"http://orange.ischool.syr.edu:8080/emotionmap/pages/dailyReport/%d",userId];
    
    //urlString = [urlString stringByAppendingFormat:@"%d",user];
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSMutableArray *strJson = [self fetchJSONValueForURL:url];
    
    return strJson;
}


+ (id)fetchJSONValueForURL:(NSURL *)url
{
    NSString *jsonString = [[NSString alloc] initWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
	
    
    id jsonValue = [jsonString JSONValue];
    
    return jsonValue;
}





@end
