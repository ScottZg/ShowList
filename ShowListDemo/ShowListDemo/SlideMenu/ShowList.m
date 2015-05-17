//
//  ShowListView.m
//  Part-time
//
//  Created by zhanggui on 15/5/7.
//  Copyright (c) 2015年 marchsoft. All rights reserved.
//

#import "SlideMenu.h"
@implementation SlideMenu
{
    UIImageView *imageView;
}
-(id)initWithFrame:(CGRect)frame
{
    if (self==[super initWithFrame:frame]) {
//        self.backgroundColor = [UIColor lightGrayColor];
        [self drawView];
        self.hidden = YES;
    }
    return self;
}
-(void)drawView
{
    _listTableView = [[UITableView alloc] initWithFrame:CGRectZero];
    self.listTableView.dataSource = self;
    self.listTableView.delegate = self;
    _listTableView.scrollEnabled = YES;
    _bottomView = [[UIView alloc] initWithFrame:CGRectZero];  //底部显示
     self.listTableView.tableFooterView = [UIView new];
    
    imageView= [[UIImageView alloc] initWithFrame:CGRectZero];
    imageView.image = [UIImage imageNamed:@"upslide"];
    imageView.userInteractionEnabled = YES;
    _listTableView.bounces = NO;   //设置没有橡皮糖效果
    UITapGestureRecognizer *gets = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideView)];
    [imageView addGestureRecognizer:gets];
    imageView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_listTableView];
    [self addSubview:_bottomView];
    [self.superview bringSubviewToFront:self];
    
//    UITapGestureRecognizer *gets = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideView)];
    [self.bottomView addGestureRecognizer:gets];
}
-(void)hideView
{
    [_delegate getName:nil andId:1 withTag:self.listViewTag];
    [self setHiddeList:YES];
}
-(void)updateFrame
{
     _listTableView.frame = CGRectMake(0, 0, self.frame.size.width,0);
     _bottomView.frame = CGRectMake(0,_listTableView.frame.size.height, self.frame.size.width,0);
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];

          _listTableView.frame = CGRectMake(0, 0, self.frame.size.width,(_listArr.count+1)*44);
  
    _bottomView.frame = CGRectMake(0,_listTableView.frame.size.height, self.frame.size.width, self.frame.size.height-_listTableView.frame.size.height);
    _bottomView.backgroundColor = [UIColor lightGrayColor];
    _bottomView.layer.opacity = 0.5f;
    [UIView commitAnimations];
    [_listTableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationBottom];
 
}
-(void)setHiddeList:(BOOL)boo
{
    if (self.hidden) {
        self.hidden = boo;
    }else
    {
        self.hidden = YES;
    }
}
#pragma mark - UITableViewDelegate && UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _listArr.count+1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
     //you can add different types model to it differently by _listViewTag
    if (_listViewTag==1) {
        
    }else if (_listViewTag==2)
    {
        
    }
     */
    UITableViewCell *cell = [UITableViewCell new];
//    cell.textLabel.textColor = [UIColor lightGrayColor];
    if (indexPath.row!= _listArr.count) {
        cell.textLabel.text =[[_listArr objectAtIndex:indexPath.row] description];
        cell.tag = 1;   //if your _listArr is a model collection,you can set model'id as cell.tag.then at the delegate method,you can get the selected model'id
    }else   //add imge
    {
        imageView.frame = CGRectMake(_listTableView.frame.size.width/2-16,5, 32, 32);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell addSubview:imageView];

    }
        return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.tag = 1;
    [self setHiddeList:YES];
    [_delegate getName:cell.textLabel.text andId:cell.tag withTag:self.listViewTag];
   
    
}
@end
