//
//  TSZPurchaseAnnotation.m
//  PurchaseLocation
//
//  Created by Tsz on 15/11/5.
//  Copyright © 2015年 Tsz. All rights reserved.

#import "TSZPurchaseAnnotation.h"

@implementation TSZPurchaseAnnotation

//set 方法进行 赋值
- (void)setPurchase:(TSZPurchase *)purchase{
    
    _purchase = purchase;
    
    _coordinate = purchase.coordinate;
}


@end
