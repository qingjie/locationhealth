//
//  Global.h
//  orange
//
//  Created by qingjie zhao on 10/9/12.
//  Copyright (c) 2012 SU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Global : NSObject{
    NSString *strLatitude;
    NSString *strLongitude;
 
}

@property (nonatomic,retain) NSString *strLatitude;
@property (nonatomic,retain) NSString *strLongitude;


+ (Global *)sharedInstance;

@end
