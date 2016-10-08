//
//  ViewController.m
//  KKFingerprintVarify
//
//  Created by KING on 2016/10/8.
//  Copyright © 2016年 com.KK. All rights reserved.
//

#import "ViewController.h"

#import "KKFingerprintVarify.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [KKFingerprintVarify canEvalue:^(BOOL suc, NSError *error) {
        if (suc) {
            [KKFingerprintVarify varifyWithReason:@"haha" result:^(BOOL suc, LAError error) {
                
            }];
        }
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
