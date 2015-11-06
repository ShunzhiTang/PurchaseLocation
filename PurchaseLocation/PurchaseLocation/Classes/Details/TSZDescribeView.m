//
//  TSZDescribeView.m
//  PurchaseLocation
//
//  Created by Tsz on 15/11/5.
//  Copyright © 2015年 Tsz. All rights reserved.
//

#import "TSZDescribeView.h"
#import <UIKit/UIKit.h>

@interface TSZDescribeView ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@property (weak, nonatomic) IBOutlet UILabel *titleLablr;
@property (weak, nonatomic) IBOutlet UILabel *subTitle;

@end
@implementation TSZDescribeView

+ (instancetype)describeView{
    
    // 加载xib
    return [[[NSBundle mainBundle] loadNibNamed:@"TSZDescribeView" owner:nil options:nil] lastObject];
}

- (void)setPurchase:(TSZPurchase *)purchase{
    _purchase = purchase;
    self.iconImage.image =  [UIImage imageNamed:purchase.image];
    self.titleLablr.text = purchase.title;
    
    self.subTitle.text = purchase.desc;
    
}

@end
