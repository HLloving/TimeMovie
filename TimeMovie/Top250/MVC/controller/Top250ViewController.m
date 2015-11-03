//
//  Top250ViewController.m
//  TimeMovie
//
//  Created by 黄翔宇 on 15/8/19.
//  Copyright (c) 2015年 黄翔宇. All rights reserved.
//

#import "Top250ViewController.h"
#import "Topmodel.h"
#import "TopCollectionViewCell.h"
#import "TopmovieViewController.h"
@interface Top250ViewController ()
{
    NSMutableArray *_topData;
    UITableView *_tableview;


}
@end

@implementation Top250ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"Top250";
    [self loadData];
  
    
    // Do any additional setup after loading the view.
}
-(void)loadData{
    
    NSDictionary *dic=[MovieJson loadData:@"top250"];
    NSArray *subjects=dic[@"subjects"];
    _topData=[[NSMutableArray alloc]init];
    for (NSDictionary *dictionary in subjects) {
        Topmodel *top=[[Topmodel alloc]initContentWithDic:dictionary];
        [_topData addObject:top];
        
        
    }

   


}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{


    return _topData.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TopCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"topcell" forIndexPath:indexPath];
        cell.topmodel=_topData[indexPath.item];
    
    
    return cell;

}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    UIStoryboard *stroy=[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
//    TopmovieViewController *top=[stroy instantiateViewControllerWithIdentifier:@"topMovie"];
//    top.hidesBottomBarWhenPushed=YES;
    
    
    TopmovieViewController *top=[[TopmovieViewController alloc]init];
    top.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:top animated:YES];
    
    
    
//    TopmovieViewController *topmovie=[[TopmovieViewController alloc]init];
//    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:topmovie];
//    
//    [self presentViewController:nav animated:YES completion:nil];



}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
