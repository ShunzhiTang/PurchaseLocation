//
//  ViewController.m
//  PurchaseLocation
//
//  Created by Tsz on 15/11/5.
//  Copyright © 2015年 Tsz. All rights reserved.
#import "ViewController.h"
#import <MapKit/MapKit.h>

#import "TSZAnnotation.h"
@interface ViewController () <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加 拖拽手势  ,实现 添加大头针的方法
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(addAnnotationInMapView:)];
    
    //遵守协议
    self.mapView.delegate = self;
    
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
    
    //一个 ktv的图标
    anno.title = @"北京";
    anno.imageName = @"category_2";
    
    //4、添加大头针
    [self.mapView addAnnotation:anno];
}

#pragma mark: MKMapViewDelegate协议

/**
 *  每添加一个大头针 模型  就会调用的代理方法  返回一个大头针视图
 *
 *  @param mapView    mapView
 *  @param annotation 大头针模型
 */

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    static NSString *ID = @"anno";
    
    //大头针视图
    MKAnnotationView *view = [mapView dequeueReusableAnnotationViewWithIdentifier:ID];
    
    /**
     * 判断 试图为空就创建一个
     */
    if (view == nil) {
        view = [[MKAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:ID];
        
        view.canShowCallout = YES;
        //
        view.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeContactAdd];
        
        view.leftCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        
    }
    
    TSZAnnotation *anno = (TSZAnnotation *)annotation;
    
    view.image = [UIImage imageNamed:anno.imageName];
    
    return view;
    
}


@end
