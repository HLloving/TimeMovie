//
//  topCollectionView.m
//  TimeMovie
//
//  Created by 黄翔宇 on 15/8/27.
//  Copyright (c) 2015年 黄翔宇. All rights reserved.
//

#import "topCollectionView.h"
#import "Model.h"
#import "topviewCell.h"
#import "PosCollectionViewCell.h"
@implementation topCollectionView
-(instancetype)initWithFrame:(CGRect)frame{

    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    
    layout.itemSize=CGSizeMake(frame.size.width*0.2, frame.size.height*0.95);
    
    layout.minimumInteritemSpacing=10;
    
    layout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    
    layout.sectionInset=UIEdgeInsetsMake(0, frame.size.width*0.4, 0,frame.size.width*0.4 );
    
    self=[super initWithFrame:frame collectionViewLayout:layout];
    
    if (self) {
        self.dataSource=self;
        
        self.delegate=self;
        
        [self registerClass:[topviewCell class] forCellWithReuseIdentifier:@"topcell"];
    }
    
   
    return self;

}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
  

    return _movieData.count;


}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    topviewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"topcell" forIndexPath:indexPath];
    cell.backgroundColor=[UIColor redColor];
    
 
    
    cell.model=_movieData[indexPath.item];
    return cell;


}


-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    CGFloat xoffset=targetContentOffset->x;
    
    xoffset-=scrollView.frame.size.width*0.2;
    
   self.index=xoffset/(scrollView.width*0.2+10);
    
    if (xoffset>0) {
        self.index+=1;
    }
    
    xoffset=_index *(scrollView.width *0.2+10);
    
    targetContentOffset->x=xoffset;
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    self.index=indexPath.item ;
    
    
    
    NSLog(@"%ld",_index);
    
    [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally  animated:YES];

    

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
