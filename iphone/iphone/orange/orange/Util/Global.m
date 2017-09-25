//
//  Global.m
//  orange
//
//  Created by qingjie zhao on 10/9/12.
//  Copyright (c) 2012 SU. All rights reserved.
//

#import "Global.h"


@implementation Global
@synthesize strLatitude;
@synthesize strLongitude;

+(Global *)sharedInstance
{
    static Global *sharedInstance;
    
    @synchronized(self)
    {
        if (!sharedInstance)
            sharedInstance = [[Global alloc] init];
        
        return sharedInstance;
    }
}



@end
