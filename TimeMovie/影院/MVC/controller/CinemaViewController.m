
//
//  CinemaViewController.m
//  TimeMovie
//
//  Created by 黄翔宇 on 15/8/19.
//  Copyright (c) 2015年 黄翔宇. All rights reserved.
//

#import "CinemaViewController.h"
#import "Cinema.h"
#import "DistricList.h"
#import "CinemaTableViewCell.h"
@interface CinemaViewController ()
{
    NSMutableArray *_cinemaData;
    NSMutableArray *_districlist;
    UITableView *_tableview;
    BOOL _isHidden[1000];
    NSArray *_array;
    
    
}
@end

@implementation CinemaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"影院";
    [self loadData];
  
    [self creatview];
    // Do any additional setup after loading the view.
}
-(void)loadData{
    
    
    NSDictionary *dic2=[MovieJson loadData:@"district_list"];
    NSArray *array2=dic2[@"districtList"];
    _districlist=[[NSMutableArray alloc]init];
    for (NSDictionary *dictionary2 in array2) {
        DistricList *dis=[[DistricList alloc]initContentWithDic:dictionary2];
        [_districlist addObject:dis];
    }
    
    
    NSDictionary *dic=[MovieJson loadData:@"cinema_list" ];
    NSArray *array=dic[@"cinemaList"];
    
    for (NSDictionary *dictionary in array) {
        Cinema *cinema=[[Cinema alloc]initContentWithDic:dictionary];
        
        for (DistricList *dis in _districlist) {
            if ([dis.number isEqualToString:cinema.districtId]) {
                [dis.cinemas addObject:cinema];
                break;
            }
        }
       
        
    }
    
   
    
}


 -(void)creatview{
 _tableview=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
 _tableview.delegate=self;
 _tableview.dataSource=self;
     _tableview.backgroundColor=[UIColor clearColor];
 [self.view addSubview:_tableview];
 
 
 
 }
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{


    return _districlist.count;
}
 - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
     DistricList *dis=_districlist[section];
     if (dis.isShow) {
         
         _array=dis.cinemas;
         return _array.count;
     }
     else{
    return 0;
     
     }
     
 
 }


 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
 CinemaTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cinemaCell"];
 if (cell==nil) {
     cell=[[[NSBundle mainBundle]loadNibNamed:@"CinemaTableViewCell" owner:nil options:nil]lastObject];
 }
    
     
    DistricList *distric= _districlist[indexPath.section];
     NSArray *cinema=distric.cinemas;
     cell.cinema=cinema[indexPath.row];
//     UIImage *image=[UIImage imageNamed:@"hotMovieInfoBackground@2x"];
//     image=[image stretchableImageWithLeftCapWidth:10 topCapHeight:0];
      cell.backgroundColor=[UIColor clearColor];
 return cell;
 
 }
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 85;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 35;

}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 35)];
    DistricList *dis=_districlist[section];
    NSString *districName=dis.name;
    btn.tag=100+section;
    [btn setTitle:districName forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    UIImage *image=[UIImage imageNamed:@"hotMovieBottomImage@2x"];
    image=[image stretchableImageWithLeftCapWidth:3 topCapHeight:3];
    btn.backgroundColor=[UIColor colorWithPatternImage:image];
 
//    [btn setImage:[UIImage imageNamed:@"btnbg_blue"] forState:UIControlStateNormal];
    
    
    return btn;




}
-(void)btnAction:(UIButton *)button{
    NSInteger index= button.tag-100;
    _isHidden[index]=! _isHidden[index];
    DistricList *dis=_districlist[index];
    dis.isShow=!dis.isShow;
    [_tableview reloadSections:[NSIndexSet indexSetWithIndex:button.tag-100] withRowAnimation:UITableViewRowAnimationFade];
  
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

