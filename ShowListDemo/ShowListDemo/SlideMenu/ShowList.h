//
//  ShowListView.h
//  Part-time
//
//  Created by zhanggui on 15/5/7.
//  Copyright (c) 2015年 marchsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SlideMenuDelegate <NSObject>

-(void)getName:(NSString *)name  andId:(NSInteger)id withTag:(NSInteger)tag;

@end

@interface SlideMenu : UIView<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)id<SlideMenuDelegate>delegate;
@property(nonatomic,strong)NSMutableArray *listArr;   //container

@property(nonatomic,strong)UITableView *listTableView;  //listTableView
@property(nonatomic,strong)UIView *bottomView;    //this is bottom shadow view

@property(nonatomic,assign)NSInteger listViewTag;   //it used when you use it at least two SlideMenu ,for tag it
-(void)drawView;



-(void)updateFrame;
-(void)setHiddeList:(BOOL)boo;

@end
