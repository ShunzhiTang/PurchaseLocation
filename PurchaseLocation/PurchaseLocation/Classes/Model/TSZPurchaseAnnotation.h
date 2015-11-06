//
//  TSZPurchaseAnnotation.h
//  PurchaseLocation
//
//  Created by Tsz on 15/11/5.
//  Copyright © 2015年 Tsz. All rights reserved.
#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "TSZPurchase.h"

@class TSZPurchase;

@interface TSZPurchaseAnnotation : NSObject <MKAnnotation>

//坐标位置 CLLocationCoordinate2D经纬度的结构体
@property (nonatomic , assign)CLLocationCoordinate2D coordinate;

//是否显示描述
@property (nonatomic ,assign) BOOL isShowDesc;

//导入模型数据
@property (nonatomic ,strong)TSZPurchase *purchase;

@end
