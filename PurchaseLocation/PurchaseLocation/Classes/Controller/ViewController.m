//
//  ViewController.m
//  PurchaseLocation
//
//  Created by Tsz on 15/11/5.
//  Copyright © 2015年 Tsz. All rights reserved.
#import "ViewController.h"
#import <MapKit/MapKit.h>

#import "TSZAnnotation.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加 拖拽手势  ,实现 添加大头针的方法
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(addAnnotationInMapView:)];
    
    
    //添加手势给 mapView
    [self.mapView addGestureRecognizer:tap];
}

#pragma mark  手势  添加大头针的方法
- (void)addAnnotationInMapView:(UITapGestureRecognizer *)tap{
    
    //1、获取位置
    CGPoint point = [tap locationInView:tap.view];
    
    //2、大头针初始化
    TSZAnnotation *anno = [[TSZAnnotation alloc] init];
    
    //3、把点坐标转换成 经纬度
    anno.coordinate = [self.mapView convertPoint:point toCoordinateFromView:self.mapView];
    
    anno.title = @"北京";
    anno.imageName = @"category_2";
    
    //4、添加大头针
    [self.mapView addAnnotation:anno];
}
@end
