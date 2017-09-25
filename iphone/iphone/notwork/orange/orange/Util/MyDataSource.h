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

+ (NSMutableArray *)showUserInfoOnMap;
+ (NSMutableArray *)fetchLibraryInformation;
+ (NSMutableArray *)fetchDailyReport;
+ (id)fetchJSONValueForURL:(NSURL *)url;

@end
