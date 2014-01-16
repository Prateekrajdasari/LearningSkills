//
//  ViewController.m
//  paging
//
//  Created by Prateek Raj Dasari on 11/28/13.
//  Copyright (c) 2013 Prateek Raj Dasari. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface ViewController ()
{

    int globalStartPoint;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    
    [self createLayoutFrom:0];
    
}

-(void)createLayoutFrom:(int)startPoint
{
    globalStartPoint = startPoint;
    
    int pageCount = 10;

    NSArray *arr = [self.view subviews];

    for (int i=0; i<[arr count]; i++) {
        
        if ([arr[i] isKindOfClass:[UIButton class]]) {
            [arr[i] removeFromSuperview];
        }
    }
    
    int xValues = 0;
    
    for (int i=startPoint; i<startPoint+pageCount; i++) {
        
        UIButton *btt = [[UIButton alloc] initWithFrame:CGRectMake((xValues*60)+20, 100, 50, 50)];
        
        [btt setTitle:[NSString stringWithFormat:@"%d",i+1] forState:UIControlStateNormal];
        
        [btt setBackgroundColor:[UIColor grayColor]];
        
        btt.tag = xValues+1;
        
        [self.view addSubview:btt];
        
        btt.layer.borderWidth = 2;
        
        [btt addTarget:self action:@selector(actionForButton:) forControlEvents:UIControlEventTouchUpInside];
        
        xValues++;
    }
}


-(void)actionForButton:(id)sender
{
    UIButton *button = sender;

    int difference = globalStartPoint + (button.tag%10 == 0 ? 5 : button.tag%10 - 5);
    
    if (difference < 0)
        difference = 0;

    [self createLayoutFrom:difference];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
