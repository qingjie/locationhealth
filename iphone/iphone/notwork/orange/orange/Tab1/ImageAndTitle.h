//
//  ImageAndTitle.h
//  EmotionMap
//
//  Created by qingjie zhao on 10/18/12.
//  Copyright (c) 2012 SU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageAndTitle : NSObject{
    NSString *myImage;
    NSString *myTitle;
    NSString *myColor;
    
}

@property (nonatomic ,retain) NSString *myImage;
@property (nonatomic ,retain) NSString *myTitle;
@property (nonatomic ,retain) NSString *myColor;

-(id)initWithImage:(NSString *)image Title:(NSString *)title Color:(NSString *)color;

@end
