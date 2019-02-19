//
//  UILabel+RQJJ.m
//  RQJJ
//
//  Created by liyanbin on 19/09/2017.
//  Copyright © 2017 Dc.lee. All rights reserved.
//

#import "UILabel+RQJJ.h"

@implementation UILabel (RQJJ)
+ (UILabel *)createLableWithTextColor:(UIColor *)textColor andTextFont:(UIFont *)textFont andTextAlignment:(NSTextAlignment)textAlignment {
    UILabel *lable = [[UILabel alloc]init];
    lable.textColor = textColor;
    lable.textAlignment = textAlignment;
    lable.font = textFont;
    
    return lable;
}
@end
