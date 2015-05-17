//
//  ViewController.m
//  ShowListDemo
//
//  Created by zhanggui on 15/5/17.
//  Copyright (c) 2015年 zhanggui. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //initial the ShowMenuView  ----------First Step
    _listView = [[ShowList alloc] initWithFrame:CGRectMake(0,54+_selectView.frame.size.height+10, self.view.frame.size.width, self.view.frame.size.height)];
    _listView.delegate = self;
    
    self.view.backgroundColor  = [UIColor colorWithPatternImage:[UIImage imageNamed:@"zg.jpg"]];
    
    //set button Attribute
    _showMenuButton.backgroundColor = [UIColor grayColor];
    _showMenuButton.layer.cornerRadius = 4;
    _selectDistanceButton.backgroundColor = [UIColor grayColor];
    _selectDistanceButton.layer.cornerRadius = 4;
    
    //------------Second Step
    [self.view addSubview:_listView];
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark ButtonAction Method
- (IBAction)showMenuAction:(UIButton *)sender {
    if (sender.tag==1) {
        [_listView setHiddeList:NO];
        _listView.listViewTag = 1;   //set the listViewTag ,you can resolve your problem in different way
        _listView.listArr = [[NSMutableArray alloc] initWithObjects:@"智能排序",@"最新发布",@"火热兼职",@"已认证", nil];
        [_listView updateFrame];
    }else if (sender.tag==2)
    {
        [_listView setHiddeList:NO];
        _listView.listViewTag = 2;
        _listView.listArr = [[NSMutableArray alloc] initWithObjects:@"全部",@"500米",@"1000米",@"1500米",@"2000米", nil];
        [_listView updateFrame];
    }
    
}
#pragma mark - ShowMenuDelegate
-(void)getName:(NSString *)name andId:(NSInteger)id withTag:(NSInteger)tag
{
    if(tag==1)
    {
        NSLog(@"name:%@--id:%ld--------_listViewTag:%ld",name,(long)id,(long)tag);
    }else if (tag==2)
    {
        NSLog(@"name:%@--id:%ld--------_listViewTag:%ld",name,(long)id,(long)tag);
    }
    
}
@end
