# ShowList
This is a SlideList,When you tap a button , it will show like that:     
![showList.gif](https://ooo.0o0.ooo/2015/11/20/564eb90fbcc9e.gif)
#How to use
* first step:
        you shold download This Demo，Then drag the ShowList folder to your project.
    
* second stop:
        At your controller，realize the delegate.and at the .m,you should create a example by alloc initwithFrame as flows:    
        ` _listView = [[ShowList alloc] initWithFrame:CGRectMake(0,54+_selectView.frame.size.height+10, self.view.frame.size.width, self.view.frame.size.height)];`   
        
    `_listView.delegate = self;`      
    
    ....
    For more detail,you can see the demo.
