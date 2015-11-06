//
//  TSZDetailAnnotation.m
//  PurchaseLocation
//
//  Created by Tsz on 15/11/5.
//  Copyright © 2015年 Tsz. All rights reserved.
//

#import "TSZDetailAnnotation.h"
#import "TSZPurchase.h"
@implementation TSZDetailAnnotation

- (void)setPurchase:(TSZPurchase *)purchase {
    _purchase = purchase;
    _coordinate = purchase.coordinate;
}

@end
