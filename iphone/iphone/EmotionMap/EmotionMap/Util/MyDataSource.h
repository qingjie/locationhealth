//
//  MyDataSource.h
//  EmotionMap
//
//  Created by qingjie zhao on 10/9/12.
//  Copyright (c) 2012 SU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyDataSource : NSObject{
    
}

+ (NSMutableDictionary *)fetchLibraryInformation:(NSString *)strURL;
+ (NSString *)fetchLibraryInformation3:(NSString *)strURL;
+ (id)fetchJSONValueForURL:(NSURL *)url;

@end
