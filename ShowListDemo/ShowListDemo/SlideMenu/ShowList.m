//
//  ShowListView.m
//  Part-time
//
//  Created by zhanggui on 15/5/7.
//  Copyright (c) 2015年 marchsoft. All rights reserved.
//

#import "ShowList.h"

@interface ShowList ()
@property (nonatomic,strong)UIImageView *hideImageView;
@end
@implementation ShowList
-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.hidden = YES;
    }
    return self;
}

-(void)hideView {
    if (self.delegate) {
         [self.delegate getName:nil andId:1 withTag:self.listViewTag];
         [self setHiddeList:YES];
    }
   
    
}
-(void)updateFrame {
     self.listTableView.frame = CGRectMake(0, 0, self.frame.size.width,0);
     self.bottomView.frame = CGRectMake(0,_listTableView.frame.size.height, self.frame.size.width,0);
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];

          _listTableView.frame = CGRectMake(0, 0, self.frame.size.width,(_listArr.count+1)*44);
  
    self.bottomView.frame = CGRectMake(0,_listTableView.frame.size.height, self.frame.size.width, self.frame.size.height-_listTableView.frame.size.height);
    self.bottomView.backgroundColor = [UIColor lightGrayColor];
    self.bottomView.layer.opacity = 0.5f;
    [UIView commitAnimations];
    [self.listTableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationBottom];
}
-(void)setHiddeList:(BOOL)boo {
    if (self.hidden) {
        self.hidden = boo;
    }else
    {
        self.hidden = YES;
    }
}
#pragma mark - UITableViewDelegate && UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _listArr.count+1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
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
        self.hideImageView.frame = CGRectMake(_listTableView.frame.size.width/2-16,5, 32, 32);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell addSubview:self.hideImageView];

    }
        return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.tag = 1;
    [self setHiddeList:YES];
    [_delegate getName:cell.textLabel.text andId:cell.tag withTag:self.listViewTag];
   
    
}
#pragma mark - lazy load

- (UITableView *)listTableView {
    if (!_listTableView) {
        _listTableView = [[UITableView alloc] initWithFrame:CGRectZero];
        _listTableView.dataSource = self;
        _listTableView.delegate = self;
        _listTableView.scrollEnabled = YES;
        _listTableView.tableFooterView = [UIView new];
        [self addSubview:_listTableView];
    }
    return _listTableView;
}
- (UIImageView *)hideImageView {
    if (!_hideImageView) {
        _hideImageView = [UIImageView alloc];
        _hideImageView= [[UIImageView alloc] initWithFrame:CGRectZero];
        _hideImageView.image = [UIImage imageNamed:@"upslide"];
        _hideImageView.userInteractionEnabled = YES;
        _listTableView.bounces = NO;   //设置没有橡皮糖效果
        UITapGestureRecognizer *gets = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideView)];
        [_hideImageView addGestureRecognizer:gets];
        _hideImageView.backgroundColor = [UIColor whiteColor];

    }
    return _hideImageView;
}
- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[UIView alloc] initWithFrame:CGRectZero];  //底部显示
          UITapGestureRecognizer *gets = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideView)];
        [self addGestureRecognizer:gets];
        [self insertSubview:self.bottomView belowSubview:self.listTableView];
    }
    return _bottomView;
}
@end
