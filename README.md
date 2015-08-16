# ShowList
This is a SlideList,When you tap a button , it will show like that:   
![iOS Simulator Screen Shot 2015年8月16日 下午3.57.02.png](https://ooo.0o0.ooo/2015/08/16/55d0436a07b1c.png "iOS Simulator Screen Shot 2015年8月16日 下午3.57.02.png")
![iOS Simulator Screen Shot 2015年8月16日 下午3.57.05.png](https://ooo.0o0.ooo/2015/08/16/55d0436c1b3ae.png "iOS Simulator Screen Shot 2015年8月16日 下午3.57.05.png")
#How to use
    first step:
        you shold download This Demo，Then drag the ShowList folder to your project.
    second stop:
        At your controller，realize the delegate.and at the .m,you should create a example by alloc initwithFrame.
         _listView = [[ShowList alloc] initWithFrame:CGRectMake(0,54+_selectView.frame.size.height+10, self.view.frame.size.width, self.view.frame.size.height)];
    _listView.delegate = self;
    ....
    For more detail,you can see the demo.
