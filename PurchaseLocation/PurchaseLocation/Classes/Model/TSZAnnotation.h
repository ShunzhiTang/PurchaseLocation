//
//  TSZAnnotation.h
//  PurchaseLocation
//
//  Created by Tsz on 15/11/5.
//  Copyright © 2015年 Tsz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import  <MapKit/MapKit.h>
@interface TSZAnnotation : NSObject <MKAnnotation>

@property (nonatomic , assign) CLLocationCoordinate2D coordinate;

@property (nonatomic , copy)NSString *title;

@property (nonatomic ,copy)NSString *subTitle;

@property (nonatomic ,copy)NSString *imageName;
@end
