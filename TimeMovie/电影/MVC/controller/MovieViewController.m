//
//  MovieViewController.m
//  TimeMovie
//
//  Created by 黄翔宇 on 15/8/19.
//  Copyright (c) 2015年 黄翔宇. All rights reserved.
//

#import "MovieViewController.h"
#import "Model.h"
#import "MovieCellTableViewCell.h"
#import "PostCollectionView.h"
#import "topCollectionView.h"
@interface MovieViewController ()
{
    
    UIView *_view2;
    UIView *_view1;
    UIButton *_rightbutton;
    UITableView *_tableview;
    NSMutableArray *_movieData;
    UIButton *_upDownbutton;
    UIView *_topview;
    UIView *_postview;
    UIView *_view3;
    PostCollectionView *_collection;
    topCollectionView *_top;
}
@end

@implementation MovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"电影";
    [self creatBarbutton];
    [self loadData];
    [self creatview];
    [self creattableview];
    
    
   
}
//数据处理
-(void)loadData{


    NSDictionary *dic=[MovieJson loadData:@"us_box"];
    NSArray *subjects=dic[@"subjects"];
    _movieData=[[NSMutableArray alloc]init];
    for (NSDictionary *dictionary in subjects) {
        Model *model=[Model movieWithContentOfDictionary:dictionary];
        [_movieData addObject:model];
        
    }



}
//两个view之间的切换BUTTON
-(void)creatBarbutton{
    _rightbutton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 25)];
    _rightbutton.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"exchange_bg_home@2x"]];
    [_rightbutton setImage:[UIImage imageNamed:@"list_home@2x"] forState:UIControlStateNormal];
    [_rightbutton setImage: [UIImage imageNamed:@"poster_home@2x"] forState:UIControlStateSelected];
    [_rightbutton addTarget:self action:@selector(rightButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *bar=[[UIBarButtonItem alloc]initWithCustomView:_rightbutton];
    self.navigationItem.rightBarButtonItem=bar;





}

-(void)creattableview{
    _tableview=[[UITableView alloc]initWithFrame:self.view.bounds];
    _tableview.dataSource=self;
    _tableview.delegate=self;
    _tableview.backgroundColor=[UIColor clearColor];
    [self.view addSubview:_tableview];


}
//图片VIEW的创建
-(void)creatview{
    //最大视图
    _view2=[[UIView alloc]initWithFrame:self.view.bounds];
    _view2.backgroundColor=[UIColor orangeColor];
    [self.view addSubview:_view2];
    
    
    _collection=[[PostCollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    _collection.movieData=_movieData;
     [_view2 addSubview:_collection];
 
    
   //遮罩视图
    _postview=[[UIView alloc]initWithFrame:CGRectMake(0, -kScreenHeight, kScreenWidth, kScreenHeight-130)];
    _postview.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    [_view2 addSubview:_postview];
    
    
    //头部视图
    _topview=[[UIView alloc]initWithFrame:CGRectMake(0, -100, kScreenWidth, 130)];
    _topview.backgroundColor=[UIColor clearColor];
    [_view2 addSubview:_topview];
    
    //给头部视图添加底色图片
    UIImage *BGimage=[UIImage imageNamed:@"indexBG_home"];
    BGimage=[BGimage stretchableImageWithLeftCapWidth:0 topCapHeight:5];
    UIImageView *bImage=[[UIImageView alloc]initWithFrame:_topview.bounds];
    bImage.image=BGimage;
    [_topview addSubview:bImage];
    
    
    //下拉和收起button
    _upDownbutton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 26, 20)];
    [_upDownbutton setImage:[UIImage imageNamed:@"down_home@2x"] forState:UIControlStateNormal];
    [_upDownbutton setImage:[UIImage imageNamed:@"up_home@2x"] forState:UIControlStateSelected];
    _upDownbutton.center=CGPointMake(kScreenWidth/2, 120);
    [_upDownbutton addTarget:self action:@selector(updownbuttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_topview addSubview:_upDownbutton];
    
    
    //头部视图的collectionview
    _top=[[topCollectionView alloc]initWithFrame:CGRectMake(0, 10, _topview.frame.size.width, _topview.frame.size.height*0.7)];
    [_topview addSubview:_top];
    _top.movieData=_movieData;
    
   
    
    
    
    //两个探照灯
    UIImageView *lightView=[[UIImageView alloc]initWithFrame:CGRectMake((kScreenWidth/2)-60, 0, 30, 100)];
    lightView.image=[UIImage imageNamed:@"light@2x"];
    [_topview addSubview:lightView];
    
    UIImageView *lightView2=[[UIImageView alloc]initWithFrame:CGRectMake((kScreenWidth/2)+30, 0, 30, 100)];
    lightView2.image=[UIImage imageNamed:@"light@2x"];
    [_topview addSubview:lightView2];
    
    
    
    //添加手势
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(headViewMoveUp)];
    [_postview addGestureRecognizer:tap];
    
    
    UISwipeGestureRecognizer *swipe=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(headViewMoveDown)];
   swipe.direction=UISwipeGestureRecognizerDirectionDown;
    [_topview addGestureRecognizer:swipe];
    
    UISwipeGestureRecognizer *swipe2=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(headViewMoveUp)];
    swipe2.direction=UISwipeGestureRecognizerDirectionUp;
    [_postview addGestureRecognizer:swipe2];
    
    
    //当触发手势1，则不触发手势2
    [swipe requireGestureRecognizerToFail:swipe2];
    _view2.hidden=YES;
   
    
    
   
//    _view3=[[UIView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-64)];
//    [_view2 addSubview:_view3];
    
    //添加观察者
   [_top addObserver:self forKeyPath:@"index" options:NSKeyValueObservingOptionNew context:nil];
    [_collection addObserver:self forKeyPath:@"index" options:NSKeyValueObservingOptionNew context:@"pos"];
    
    
    
    

}
//观察者响应方法
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    NSInteger index=[change[@"new"] intValue];
    NSIndexPath *path=[NSIndexPath indexPathForItem:index inSection:0];
    if (context==nil&&path.item!=_collection.index) {
   
        //大小视图同步滚动
        [_collection scrollToItemAtIndexPath:path atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally  animated:YES];
        
        _collection.index=path.item;
    }
    else if( path.item!=_top.index){
    
        
        
        [_top scrollToItemAtIndexPath:path atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally  animated:YES];
        _top.index=path.item;
    
    }
    
 
//    
//    [self cellForItemAtIndexPath:_top.index];
    
}
//销毁观察者
-(void)dealloc{
    [_top removeObserver: self forKeyPath:@"index"];
    [_collection removeObserver: self forKeyPath:@"index"];


}

//button响应方法
-(void)updownbuttonAction:(UIButton *)btn{
//    btn.selected=!btn.selected;
    [UIView animateWithDuration:.4 animations:^{
        if (btn.selected==YES) {
            [self headViewMoveUp];
            
        }
        else{
            
            [self headViewMoveDown];
        }
    
    
    }];


}
#pragma mark 头部视图收起放下的方法
-(void)headViewMoveUp{
    _upDownbutton.selected=!_upDownbutton.selected;
    
    _topview.frame=CGRectMake(0, -100, kScreenWidth, 130) ;
    _postview.frame=CGRectMake(0, -kScreenHeight, kScreenWidth, kScreenHeight-130);


}
-(void)headViewMoveDown{
    _upDownbutton.selected=!_upDownbutton.selected;
    _topview.frame=CGRectMake(0, 0, kScreenWidth, 130);
    _postview.frame=CGRectMake(0, 100, kScreenWidth, kScreenHeight-130);



}


#pragma mark 两个view转换的方法
-(void)rightButtonAction:(UIButton *)btn{

    UIViewAnimationOptions option=btn.selected ? UIViewAnimationOptionTransitionFlipFromLeft:
    UIViewAnimationOptionTransitionFlipFromRight;
    
    [self fileView:btn Option:option];
    [self fileView:self.view Option:option];
    _tableview.hidden=!_tableview.hidden;
    _view2.hidden=!_view2.hidden;
    btn.selected=!btn.selected;
    
}


#pragma mark 动画翻转效果
-(void)fileView:(UIView *)view Option:(UIViewAnimationOptions)option {

    [UIView transitionWithView:view duration:.3 options: option animations:^{
        
        
        
        
    } completion:nil];




}

//添加尾视图使标示图上移
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    
    return 110;
}


-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 110)];
    view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main@2x"]];
    return view;
    
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{


    return _movieData.count;

}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
static NSString *identifier=@"mycell";
    MovieCellTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"MovieCellTableViewCell" owner:self options:nil]lastObject];
    }
    cell.backgroundColor=[UIColor clearColor];
    cell.model=_movieData[indexPath.row];
    
    return cell;


}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{


    return 100;

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
