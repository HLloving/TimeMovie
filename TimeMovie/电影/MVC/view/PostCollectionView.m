//
//  PostCollectionView.m
//  TimeMovie
//
//  Created by 黄翔宇 on 15/8/26.
//  Copyright (c) 2015年 黄翔宇. All rights reserved.
//

#import "PostCollectionView.h"
#import "PosCollectionViewCell.h"
#import "topCollectionView.h"
@implementation PostCollectionView
-(instancetype)initWithFrame:(CGRect)frame{
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    layout.itemSize=CGSizeMake(frame.size.width*0.6, frame.size.height*0.6);
    layout.minimumInteritemSpacing=10;
    layout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    layout.sectionInset=UIEdgeInsetsMake(0, frame.size.width*0.2, 0,frame.size.width*0.2 );
    self=[super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.dataSource=self;
        self.delegate=self;
        
        
        UINib *nib=[UINib nibWithNibName:@"PosCollectionViewCell" bundle:[NSBundle mainBundle]];
        [self registerNib:nib forCellWithReuseIdentifier:@"postcell"];
    }
    
    
    
    
    
    return self;

}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{


    
    NSInteger index=collectionView.contentOffset.x/(collectionView.width*0.6+10);
    if (indexPath.item==index) {
        PosCollectionViewCell *cell=(PosCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
        [cell filpCell];
    }else{
        
        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally  animated:YES];
        
        PosCollectionViewCell *cell = (PosCollectionViewCell *)[collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0]];
        
        if (cell.bigImage.hidden==YES) {
            [cell backCell];
        }
        self.index=indexPath.item;
    
    
    }
    NSLog(@"%@",indexPath);
    
}
-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    PosCollectionViewCell *poscell=(PosCollectionViewCell *)cell;
    
    
    
    
    [poscell backCell];


}
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    CGFloat xoffset=targetContentOffset->x;
    
    xoffset-=scrollView.frame.size.width*0.3;
    
   self.index=xoffset/(scrollView.width*0.6+10);
    
    if (xoffset>0) {
        self.index+=1;
    }
    
    xoffset=_index *(scrollView.width *0.6+10);

    targetContentOffset->x=xoffset;

}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _movieData.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PosCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"postcell" forIndexPath:indexPath];
    cell.backgroundColor=[UIColor clearColor];
    cell.model=_movieData[indexPath.item];
    return cell;



}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
