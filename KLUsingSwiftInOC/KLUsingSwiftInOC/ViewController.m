//
//  ViewController.m
//  KLUsingSwiftInOC
//
//  Created by 康梁 on 16/1/8.
//  Copyright © 2016年 kl. All rights reserved.
//

#import "ViewController.h"
#import "KLUsingSwiftInOC-Swift.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Panda *panda = [[Panda alloc] init];
    
    [panda whoAmI];
    
    pandaClass *panda1 = [[pandaClass alloc] init];
    
    [panda1 Uloo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
