//
//  BiZhiViewController.h
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"
#import "BiZhiDetailViewController.h"
@interface BiZhiViewController : UIViewController
- (UINavigationController *)defaultNavi;
@property (strong, nonatomic) BiZhiDetailViewController *bizhi;

@end




@interface BiZhiCell : UICollectionViewCell
@property(nonatomic,strong) UIImageView *iconView;

@end