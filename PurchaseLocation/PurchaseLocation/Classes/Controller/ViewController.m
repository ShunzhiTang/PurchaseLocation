//
//  ViewController.m
//  PurchaseLocation
//
//  Created by Tsz on 15/11/5.
//  Copyright © 2015年 Tsz. All rights reserved.
#import "ViewController.h"
#import <MapKit/MapKit.h>
#import "TSZPurchase.h"
#import "TSZPurchaseAnnotation.h"
#import "TSZPurchaseAnnotationView.h"
#import "TSZDetailAnnotation.h"
#import "TSZDetailAnnotationView.h"
//#import "TSZAnnotation.h"

#import "TSZPurchaseAnnotation.h"
@interface ViewController () <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (nonatomic ,strong)NSArray *dataArray;
@end


@implementation ViewController

#pragma mark 准备数据
- (NSArray *)dataArray{
    if(_dataArray == nil){
        TSZPurchase *purc1 = [[TSZPurchase alloc]init];
        purc1.title = @"速8酒店";
        purc1.desc = @"睡觉的 地方";
        purc1.icon = @"category_3";
        purc1.image = @"fandian";
        purc1.coordinate = CLLocationCoordinate2DMake(39, 116);
        
        
        TSZPurchase *purc2 = [[TSZPurchase alloc]init];
        purc2.title = @"皇家影院";
        purc2.desc = @"速 7 上映中。。";
        purc2.icon = @"category_5";
        purc2.image = @"ktv";
        purc2.coordinate = CLLocationCoordinate2DMake(28, 110);
        _dataArray = @[purc1,purc2];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加 拖拽手势  ,实现 添加大头针的方法
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(addAnnotationInMapView:)];
    //遵守协议
    self.mapView.delegate = self;
    //遍历数据 ，传入数据
    for (TSZPurchase *purchase in self.dataArray) {
         TSZPurchaseAnnotation *anno = [[TSZPurchaseAnnotation alloc]init];
        anno.purchase = purchase;
        //添加手势给 mapView
        [self.mapView addAnnotation:anno];
    }
   
}



#pragma mark: MKMapViewDelegate协议

/**
 *  每添加一个大头针 模型  就会调用的代理方法  返回一个大头针视图
 *
 *  @param mapView    mapView
 *  @param annotation 大头针模型
 */

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    
    //判断是不是大头针
    if ([annotation isKindOfClass:[TSZPurchaseAnnotation class]]){
        static NSString *ID = @"anno";
        //大头针视图
        TSZPurchaseAnnotationView *view = (TSZPurchaseAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:ID];
        
        /**
         * 判断 试图为空就创建一个
         */
        if (view == nil) {
            view = [[TSZPurchaseAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:ID];
        }
        
        TSZPurchaseAnnotation *anno = (TSZPurchaseAnnotation *)annotation;
        view.image = [UIImage imageNamed:anno.purchase.icon];
        return view;
    }else if([annotation isKindOfClass:[TSZDetailAnnotation class]]){
        static NSString *ID =  @"desc";
        TSZDetailAnnotationView *descrptionView = (TSZDetailAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:ID];
        if (descrptionView == nil) {
            descrptionView = [[TSZDetailAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:ID];
        }
        TSZDetailAnnotation *detailAnno = (TSZDetailAnnotation *)annotation;
        
        descrptionView.purchase = detailAnno.purchase;
        
        return descrptionView;
    }
    
    return nil;
   
}
/**
 * 选中一个大头针的试图会调用
 *
 * @param mapView: mapView
 * @param view   : 点击的试图
 */
- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view{
    
    //1、点击描述大头针的试图
    if ([view isKindOfClass:[TSZDetailAnnotationView class]]) {
        NSLog(@"描述大头针的试图");
    }else if([view isKindOfClass:[TSZPurchaseAnnotationView class]]){
        //点击团购大头针
        
        TSZPurchaseAnnotation *purchaseAnno = (TSZPurchaseAnnotation *)view.annotation;
        if (purchaseAnno.isShowDesc) {
            return;
        }
        
        for (id anno  in self.mapView.annotations) {
            if ([anno  isKindOfClass:[TSZDetailAnnotation class]]) {
                [self.mapView removeAnnotation:anno];
            }else {
                TSZPurchaseAnnotation *purshase = (TSZPurchaseAnnotation *)anno;
                purshase.isShowDesc = NO;
            }
        }
        
        //实现描述 ,添加详情
        TSZPurchaseAnnotation *purchase = (TSZPurchaseAnnotation *)view.annotation;
        purchase.isShowDesc = YES;
        
        TSZDetailAnnotation *detailAnno = [[TSZDetailAnnotation alloc]init];
        detailAnno.purchase = purchase.purchase;
        
        [self.mapView addAnnotation:detailAnno];
        
    }
}



#pragma mark  手势  添加大头针的方法
//- (void)addAnnotationInMapView:(UITapGestureRecognizer *)tap{
//    
//    //1、获取位置
//    CGPoint point = [tap locationInView:tap.view];
//    
//    //2、大头针初始化
//    TSZPurchaseAnnotation *anno = [[TSZPurchaseAnnotation alloc] init];
//    
//    //3、把点坐标转换成 经纬度
//    anno.coordinate = [self.mapView convertPoint:point toCoordinateFromView:self.mapView];
//    
//    //一个 ktv的图标
//    //    anno.title = @"北京";
//    //    anno.imageName = @"category_2";
//    
//    //4、添加大头针
//    [self.mapView addAnnotation:anno];
//}
@end
