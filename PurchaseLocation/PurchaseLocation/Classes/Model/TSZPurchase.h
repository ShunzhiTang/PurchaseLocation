//
//  TSZPurchase.h
//  PurchaseLocation
//
//  Created by Tsz on 15/11/5.
//  Copyright © 2015年 Tsz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@interface TSZPurchase : NSObject

/**
 *  标题
 */
@property (nonatomic, copy) NSString *title;
/**
 *  描述
 */
@property (nonatomic, copy) NSString *desc;
/**
 *  图标
 */
@property (nonatomic, copy) NSString *icon;
/**
 *  配图
 */
@property (nonatomic, copy) NSString *image;
/**
 *  团购的位置
 */
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

@end
