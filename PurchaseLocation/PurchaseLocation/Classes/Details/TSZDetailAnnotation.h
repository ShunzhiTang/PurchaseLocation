//
//  TSZDetailAnnotation.h
//  PurchaseLocation
//
//  Created by Tsz on 15/11/5.
//  Copyright © 2015年 Tsz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@class TSZPurchase;
@interface TSZDetailAnnotation : NSObject <MKAnnotation>

@property (nonatomic ,assign)CLLocationCoordinate2D coordinate;

@property (nonatomic ,strong)TSZPurchase *purchase;

@end
