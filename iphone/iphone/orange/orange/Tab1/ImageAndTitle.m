//
//  ImageAndTitle.m
//  EmotionMap
//
//  Created by qingjie zhao on 10/18/12.
//  Copyright (c) 2012 SU. All rights reserved.
//

#import "ImageAndTitle.h"

@implementation ImageAndTitle
@synthesize myImage,myTitle,myColor;

-(id)initWithImage:(NSString *)image Title:(NSString *)title Color:(NSString *)color{
    if (self == [super init]) {
        myImage = [[NSString alloc] initWithString:image];
        myTitle = [[NSString alloc] initWithString:title];
        myColor = [[NSString alloc] initWithString:color];
    }
    return self;
    
}

@end
