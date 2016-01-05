//
//  KLTackViewController.m
//  ShowCase
//
//  Created by 康梁 on 16/1/4.
//  Copyright © 2016年 kl. All rights reserved.
//

#import "KLTackViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface KLTackViewController () <CLLocationManagerDelegate>

@property (nonatomic, strong) UISwitch *swich;
@property (nonatomic, strong) UILabel *locationLbl;
@property (nonatomic, strong) CLLocationManager *locationManager;

@end

@implementation KLTackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.swich = [[UISwitch alloc] init];
    [self.view addSubview:self.swich];
    
    self.locationLbl = [[UILabel alloc] init];
    self.locationLbl.numberOfLines = 0;
    self.locationLbl.backgroundColor = [UIColor lightGrayColor];
    self.locationLbl.textColor = [UIColor whiteColor];
    [self.view addSubview:self.locationLbl];
    
    
    self.swich.translatesAutoresizingMaskIntoConstraints = NO;
    self.locationLbl.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *swichCenterX = [NSLayoutConstraint constraintWithItem:self.swich attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute: NSLayoutAttributeCenterX multiplier:1 constant:0];
    NSLayoutConstraint *swichCenterY = [NSLayoutConstraint constraintWithItem:self.swich attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:100];
    [self.view addConstraints:@[swichCenterX, swichCenterY]];
    
    NSLayoutConstraint *leftConstraintLbl = [NSLayoutConstraint constraintWithItem:self.locationLbl attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
    NSLayoutConstraint *rightConstraintLbl = [NSLayoutConstraint constraintWithItem:self.locationLbl attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
    NSLayoutConstraint *topConstraintLbl = [NSLayoutConstraint constraintWithItem:self.locationLbl attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:20];
    NSLayoutConstraint *bottomConstraintLbl = [NSLayoutConstraint constraintWithItem:self.locationLbl attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.swich attribute:NSLayoutAttributeBottom multiplier:1 constant:-60];
    
    [self.view addConstraints:@[leftConstraintLbl, rightConstraintLbl, topConstraintLbl, bottomConstraintLbl]];
    
    [self.swich addTarget:self action:@selector(changeToggle:) forControlEvents:UIControlEventValueChanged];
    
}


- (void)changeToggle:(UISwitch *)trSwich {
    if ([trSwich isOn]) {

        
        if (![CLLocationManager locationServicesEnabled]) {
            NSLog(@"定位服务当前可能尚未打开，请设置打开！");
            self.swich.on = NO;
            return;
        }
        
        // 如果没有授权则请求用户授权
        if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined)
        {
            [self.locationManager requestWhenInUseAuthorization];
            
        }
        
        if (self.locationManager == nil)
        {
            self.locationManager = [[CLLocationManager alloc] init];
            // 设置代理
            self.locationManager.delegate = self;
            // 设置定位精确
            self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
            // 定位频率,每隔多少米定位一次
            // 这里设置每隔十米定位一次
            CLLocationDistance distance = 10;
            self.locationManager.distanceFilter = distance;
            
            // 启动跟踪定位
            
            [self.locationManager startUpdatingLocation];

        }
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    CLLocation *location = locations[locations.count - 1];
    // 位置坐标
    CLLocationCoordinate2D coordinate = location.coordinate;
    NSLog(@"经度 = %f, 纬度 = %f, 海拔 = %f, 航向 = %f, 行走速度 = %f", coordinate.longitude, coordinate.latitude, location.altitude, location.course, location.speed);
    
    self.locationLbl.text = location.description;
    
    // 如果不需要实时定位，使用完即使关闭定位服务
    [self.locationManager stopUpdatingLocation];
    
}



@end
