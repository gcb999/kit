//
//  CYXWaterFlowLayout.h
//  CYCollectionViewTest
//
//  Created by apple开发 on 16/3/7.
//  Copyright © 2016年 cyx. All rights reserved.
//

#import <UIKit/UIKit.h>


@class JSWaterFlowLayout;

@protocol JSWaterFlowLayoutDelegate <NSObject>
@required
- (CGFloat)waterflowLayout:(JSWaterFlowLayout *)waterflowLayout heightForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth;

@optional
- (CGFloat)columnCountInWaterflowLayout:(JSWaterFlowLayout *)waterflowLayout;
- (CGFloat)columnMarginInWaterflowLayout:(JSWaterFlowLayout *)waterflowLayout;
- (CGFloat)rowMarginInWaterflowLayout:(JSWaterFlowLayout *)waterflowLayout;
- (UIEdgeInsets)edgeInsetsInWaterflowLayout:(JSWaterFlowLayout *)waterflowLayout;
@end

@interface JSWaterFlowLayout : UICollectionViewLayout
/** 代理 */
@property (nonatomic, weak) id<JSWaterFlowLayoutDelegate> delegate;
@end
