//
//  TSZDetailAnnotationView.m
//  PurchaseLocation
//
//  Created by Tsz on 15/11/5.
//  Copyright © 2015年 Tsz. All rights reserved.
//

#import "TSZDetailAnnotationView.h"
#import "TSZDescribeView.h"
#import "UIView+AdjustFrame.h"

@interface TSZDetailAnnotationView ()
@property (nonatomic ,weak) TSZDescribeView *descView;

@end
@implementation TSZDetailAnnotationView


//初始化加载数据
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame ]) {
        TSZDescribeView *desc = [TSZDescribeView describeView];
        
        desc.purchase  = self.purchase;
        
        desc.x = -80;
        
        desc.y = - 100;
        
        self.descView = desc;
        
        [self addSubview:desc];
    }
    
    return self;
}


- (void)setPurchase:(TSZPurchase *)purchase{
    _purchase = purchase;
 
    self.descView.purchase = purchase;
}

@end
