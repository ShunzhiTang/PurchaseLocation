//
//  TSZDescribeView.h
//  PurchaseLocation
//
//  Created by Tsz on 15/11/5.
//  Copyright © 2015年 Tsz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TSZPurchase.h"

@interface TSZDescribeView : UIView

@property (nonatomic ,strong)TSZPurchase *purchase;

//声明一个方法
+ (instancetype)describeView;

@end
