//
//  BaseFlowLayout.m
//  ThrIdVerson
//
//  Created by gcb999 on 15/11/6.
//  Copyright © 2015年 gcb99. All rights reserved.
//

#import "JSBaseFlowLayout.h"


@implementation JSBaseFlowLayout




#pragma mark -默认的水平布局(比较规矩）

- (instancetype)initWithDirectionVertical:(NSInteger)colunm itemHeight:(CGFloat)itemHeight;
{
    self = [self init];
    if (self) {
     
    // 设置滚动方向（默认垂直滚动）
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    // 设置每组边缘的间距，默认是{0，0，0，0}
    self.sectionInset = UIEdgeInsetsMake(5,5,5,5);
    
    // 设置最小行间距
    self.minimumLineSpacing = 5;//cell与cell 平行间距
    
    // 设置垂直间距
    self.minimumInteritemSpacing = 5;//cell与cell垂直间距
        
    
    
    // 定义大小
    CGFloat width=(IPHONScreenWidth-self.sectionInset.left-self.sectionInset.right-self.minimumInteritemSpacing*colunm)/colunm;//可以固定算出来
    
    self.itemSize = CGSizeMake(width, itemHeight);

    }
    return self;
}



#pragma mark -默认的垂直布局(比较规矩）

- (instancetype)initWithContentFrame:(CGRect) ContentFrame DirectionHorizontal:(CGSize)itemSize minimumLineSpacing:(CGFloat)minimumLineSpacing
{
    self = [self init];
    if (self) {
        
        // 设置滚动方向（默认垂直滚动）
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        
        //item大小
        self.itemSize=itemSize;
        
        //水平间距
        self.minimumLineSpacing = minimumLineSpacing;//cell与cell水平间距
        
        self.minimumInteritemSpacing=0;
        

        
        // 垂直方向边缘间距
        CGFloat insetV = 0.5 * (ContentFrame.size.height - self.itemSize.height);
        // 水平方向边缘间距
        CGFloat insetH = 0.5 * (ContentFrame.size.width - self.itemSize.width);

        self.sectionInset = UIEdgeInsetsMake(insetV, insetH, insetV, insetH);
        
        
       
        
    }
    return self;
    
}





@end
