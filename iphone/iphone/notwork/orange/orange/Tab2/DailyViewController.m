//
//  DailyViewController.m
//  EmotionMap
//
//  Created by qingjie zhao on 10/10/12.
//  Copyright (c) 2012 SU. All rights reserved.
//

#import "DailyViewController.h"

@interface DailyViewController ()

@end

@implementation DailyViewController
@synthesize itemArray;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    itemArray = [MyDataSource fetchDailyReport];
    
    for(int i=0;i<[itemArray count]; i++){
        NSString *strName = [[itemArray objectAtIndex:i] objectForKey:@"name"];
        NSString *strValue = [[itemArray objectAtIndex:i] objectForKey:@"value"];
        NSString *strId = [[itemArray objectAtIndex:i] objectForKey:@"id"];
        NSString *strDesc = [[itemArray objectAtIndex:i] objectForKey:@"description"];
        NSString *strUserId = [[itemArray objectAtIndex:i] objectForKey:@"userId"];
        NSString *strCurrentTime = [[itemArray objectAtIndex:i] objectForKey:@"currentTime"];
        
        NSLog(@"----------,%@,%@,%@,%@,%@,%@",strName,strValue,strId,strDesc,strUserId,strCurrentTime);
        
        
    }
    
    lineChartView = [[LineChartView alloc]initWithFrame:CGRectMake(0, 0, 320, 367)];
    
    
    NSMutableArray *pointArr = [[NSMutableArray alloc]init];
    
    for (int i=0; i<([itemArray count]-1); i++) {
        NSString *strValue = [[itemArray objectAtIndex:i] objectForKey:@"value"];
        NSLog(@"--------strValue----------,%@",strValue);
        [pointArr addObject:[NSValue valueWithCGPoint:CGPointMake(50*i, [strValue intValue]*10)]];
        
    }
    //生成随机点
    /*
    [pointArr addObject:[NSValue valueWithCGPoint:CGPointMake(50*0, 0)]];
    [pointArr addObject:[NSValue valueWithCGPoint:CGPointMake(50*1, 40)]];
    [pointArr addObject:[NSValue valueWithCGPoint:CGPointMake(50*2, 70)]];
    [pointArr addObject:[NSValue valueWithCGPoint:CGPointMake(50*3, 30)]];
    [pointArr addObject:[NSValue valueWithCGPoint:CGPointMake(50*4, 20)]];
    [pointArr addObject:[NSValue valueWithCGPoint:CGPointMake(50*5, 100)]];
    [pointArr addObject:[NSValue valueWithCGPoint:CGPointMake(50*6, 80)]];
    */
    //竖轴
    NSMutableArray *vArr = [[NSMutableArray alloc]initWithCapacity:pointArr.count-1];
    for (int i=0; i<9; i++) {
        [vArr addObject:[NSString stringWithFormat:@"%d",i*2]];
    }
    
    //横轴
    NSMutableArray *hArr = [[NSMutableArray alloc]initWithCapacity:pointArr.count-1];
    
 
    [hArr addObject:@"4"];
    [hArr addObject:@"8"];
    [hArr addObject:@"12"];
    [hArr addObject:@"16"];
    [hArr addObject:@"20"];
    [hArr addObject:@"24"];
    
    [lineChartView setHDesc:hArr];
    [lineChartView setVDesc:vArr];
    [lineChartView setArray:pointArr];
    [self.view addSubview:lineChartView];
}





@end
