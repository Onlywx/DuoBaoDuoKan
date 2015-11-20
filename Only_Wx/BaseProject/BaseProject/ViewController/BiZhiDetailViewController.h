//
//  BiZhiDetailViewController.h
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BiZhiDetailViewController;

@protocol BiZhiDetailControllerDelegate <NSObject>

-(void)biZhiController:(BiZhiDetailViewController *)biZhiVC changeBiZhi:(UIImage *)image;

@end



@interface BiZhiDetailViewController : UIViewController

@property (nonatomic,weak) id<BiZhiDetailControllerDelegate> delegate;
@property (nonatomic,strong)UIImageView *imageView;
@end
