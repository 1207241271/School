//
//  ViewController.m
//  School
//
//  Created by yangxu on 15/9/29.
//  Copyright (c) 2015年 yangxu. All rights reserved.
//

#import "ViewController.h"
#import "ElecticViewController.h"


@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    [self.scrollView setContentSize:CGSizeMake(320, 600)];
    _studentInfo=[[Information alloc]initWithData];

}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue destinationViewController]isKindOfClass:[ElecticViewController class]]) {
        
    }
}

@end
