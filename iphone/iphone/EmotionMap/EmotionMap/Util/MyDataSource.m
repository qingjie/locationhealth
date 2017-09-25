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

+ (NSMutableDictionary *)fetchLibraryInformation:(NSString *)strURL
{
    //NSString *urlString = [NSString stringWithFormat:@"http://localhost/hello.jison"];
    //NSString *urlString = [NSString stringWithFormat:@"http://108.171.176.192:4000/artists.json"];
    //NSString *urlString = [NSString stringWithFormat:@"http://192.168.1.4:4000/artists.json"];
    
    NSString *urlString = [NSString stringWithFormat:strURL];
    
    NSLog(@"---urlString---,  %@ ",urlString);
    
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    
    NSMutableDictionary *myData = [self fetchJSONValueForURL:url];
    
    NSLog(@"---myData---,  %@",myData);
    
    
    return myData;
}

+ (NSString *)fetchLibraryInformation3:(NSString *)strURL
{
    //NSString *urlString = [NSString stringWithFormat:@"http://localhost/hello.jison"];
    //NSString *urlString = [NSString stringWithFormat:@"http://108.171.176.192:4000/artists.json"];
    //NSString *urlString = [NSString stringWithFormat:@"http://192.168.1.4:4000/artists.json"];
    
    NSString *urlString = [NSString stringWithFormat:strURL];
    
    NSLog(@"---urlString---,  %@ ",urlString);
    
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    
    NSString *myData = [self fetchJSONValueForURL:url];
    
    NSLog(@"---myData---,  %@",myData);
    
    
    return myData;
}


+ (id)fetchJSONValueForURL:(NSURL *)url
{
    NSString *jsonString = [[NSString alloc] initWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
	
    id jsonValue = [jsonString JSONValue];
    
    return jsonValue;
}


@end
