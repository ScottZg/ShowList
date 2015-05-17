//
//  ViewController.h
//  ShowListDemo
//
//  Created by zhanggui on 15/5/17.
//  Copyright (c) 2015年 zhanggui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShowList.h"
@interface ViewController : UIViewController<ShowListDelegate>

@property(nonatomic,strong)ShowList *listView;
@property (weak, nonatomic) IBOutlet UIButton *selectDistanceButton;

- (IBAction)showMenuAction:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *showMenuButton;
@property (weak, nonatomic) IBOutlet UIView *selectView;
@end

