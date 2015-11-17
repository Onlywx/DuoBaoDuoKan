//
//  WXCarModel.h
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class WXCarListModel,WXCarListAdsModel,WXCarListAutoWapModel,WXCarListImageXtraModel;

@interface WXCarModel : BaseModel

@property (nonatomic, copy) NSString *city;

@property (nonatomic, strong) NSArray<WXCarListModel *> *list;

@end
@interface WXCarListModel : NSObject

@property (nonatomic, copy) NSString *tname;

@property (nonatomic, copy) NSString *ptime;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *url_3w;

@property (nonatomic, assign) NSInteger hasHead;

@property (nonatomic, assign) NSInteger hasImg;

@property (nonatomic, copy) NSString *lmodify;

@property (nonatomic, copy) NSString *docid;

@property (nonatomic, copy) NSString *cTemplate;

@property (nonatomic, assign) NSInteger replyCount;

@property (nonatomic, assign) NSInteger votecount;

@property (nonatomic, copy) NSString *alias;

@property (nonatomic, assign) BOOL hasCover;

@property (nonatomic, assign) NSInteger priority;

@property (nonatomic, assign) NSInteger hasAD;

@property (nonatomic, copy) NSString *cid;

@property (nonatomic, copy) NSString *imgsrc;

@property (nonatomic, assign) BOOL hasIcon;

@property (nonatomic, strong) NSArray<WXCarListAdsModel *> *ads;

@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, copy) NSString *ename;

@property (nonatomic, strong) NSArray<WXCarListAutoWapModel *> *auto_wap;

@property (nonatomic, copy) NSString *boardid;

@property (nonatomic, assign) NSInteger order;

@property (nonatomic, copy) NSString *digest;
@property (nonatomic, strong) NSArray<WXCarListImageXtraModel *> *imgextra;

@end

@interface WXCarListImageXtraModel : NSObject
@property (nonatomic, copy) NSString *imgsrc;
@end

@interface WXCarListAdsModel : NSObject

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *docid;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, copy) NSString *tag;

@property (nonatomic, copy) NSString *imgsrc;

@end

@interface WXCarListAutoWapModel : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, copy) NSString *imgsrc;

@property (nonatomic, copy) NSString *url;

@end

