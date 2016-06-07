//
//  BaseFlowLayout.h
//  ThrIdVerson
//
//  Created by gcb999 on 15/11/6.
//  Copyright © 2015年 gcb99. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JSBaseFlowLayout;


@protocol JSBaseFlowLayoutDelegate <NSObject>


- (CGFloat)columnCountInBaseFlowLayout:(JSBaseFlowLayout *)waterflowLayout;

@end




@interface JSBaseFlowLayout : UICollectionViewFlowLayout



#pragma mark -默认的水平布局(比较规矩）

/*
 
 1:coloum 一排放入个数,
 
 2:itemHeight 每个item高度
 
 */

- (instancetype)initWithDirectionVertical:(NSInteger)colunm itemHeight:(CGFloat)itemHeight;

#pragma mark -默认的垂直布局(比较规矩）
/*
 
 1:ContentFrame 区域
 
 2:itemSize item的大小,
 
 3:minimumLineSpacing 水平间距
 
 */


- (instancetype)initWithContentFrame:(CGRect ) ContentFrame DirectionHorizontal:(CGSize)itemSize minimumLineSpacing:(CGFloat)minimumLineSpacing;

@end




