//
//  ViewController.m
//  CodeView
//
//  Created by my on 16/5/18.
//  Copyright © 2016年 MS. All rights reserved.
//

#import "ViewController.h"
#import "CodeView.h"

@interface ViewController ()
{
    CodeView *v;
    NSInteger i;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addView];
}


- (void)addView {
    
    i = 0;
    v = [[CodeView alloc] initWithFrame:CGRectMake(0, 60 + 80 * 1, self.view.frame.size.width - 10, 60)
                                              num:6
                                        lineColor:[UIColor blackColor]
                                         textFont:50];
    v.content = @"";
    //下划线
    v.hasUnderLine = YES;
    //输入风格
    v.codeType = CodeViewTypeCustom;

    v.EndEditBlcok = ^(NSString *str) {
        NSLog(@"%@",str);
    };
    [self.view addSubview:v];
    
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
}
-(void)timerAction{
    i += 1;
    v.content = [v.content stringByAppendingString:[NSString stringWithFormat:@"%ld",i]];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
