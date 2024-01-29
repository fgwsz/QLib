// 编码规则:
// a_:函数参数列表中定义的变量
// l_:函数体内定义的变量
// g_:全局变量

// a_array:Array
Function ArrayToString(a_array)
    Dim l_ret // string
    l_ret="["
    For l_idx=0 To UBound(a_array)
        If(IsArray(a_array(l_idx)))Then
            l_ret=l_ret&ArrayToString(a_array(l_idx))
        Else
            l_ret=l_ret&a_array(l_idx)
        End If
        If(l_idx<>UBound(a_array))Then
            l_ret=l_ret&","
        End If
    Next
    l_ret=l_ret&"]"
    ArrayToString=l_ret
End Function

/* class Point begin */
// a_x:int
// a_y:int
// return Point
Function PointNew(a_x,a_y)
//    Call TracePrint("Function PointNew")
//    Call TracePrint("a_x:"&a_x)
//    Call TracePrint("a_y:"&a_y)
    Dim l_ret
    l_ret=Array(a_x,a_y)
//    Call TracePrint("l_ret:"&ArrayToString(l_ret))
    PointNew=l_ret
End Function
// a_this:Point
// return int
Function PointGetX(a_this)
//    Call TracePrint("Function PointGetX")
//    Call TracePrint("a_this:"&ArrayToString(a_this))
    Dim l_ret
    l_ret=a_this(0)
//    Call TracePrint("l_ret:"&l_ret)
    PointGetX=l_ret
End Function
// a_this:Point
// return int
Function PointGetY(a_this)
//    Call TracePrint("Function PointGetY")
//    Call TracePrint("a_this:"&ArrayToString(a_this))
    Dim l_ret
    l_ret=a_this(1)
//    Call TracePrint("l_ret:"&l_ret)
    PointGetY=l_ret
End Function
// a_this:Point
// return string
Function PointToString(a_this)
    // Call TracePrint("Function PointToString")
    // Call TracePrint("a_this:"&ArrayToString(a_this))
    Dim l_ret
    l_ret="Point{x:"&PointGetX(a_this)&",y:"&PointGetY(a_this)&"}"
    // Call TracePrint("l_ret:"&l_ret)
    PointToString=l_ret
End Function
// a_this:Point
// return bool
Function PointIsEmpty(a_this)
//    Call TracePrint("Function PointIsEmpty")
//    Call TracePrint("a_this:"&ArrayToString(a_this))
    Dim l_ret // bool
    If PointGetX(a_this)<>-1 and PointGetY(a_this)<>-1 Then
        l_ret=False
    Else
        l_ret=True
    End If
//    Call TracePrint("l_ret:"&l_ret)
    PointIsEmpty=l_ret
End Function
/* class Point end */

/* class Rect begin */
// a_left:Point
// a_right:Point
// return Rect
Function RectNew(a_left,a_right)
//    Call TracePrint("Function RectNew")
//    Call TracePrint("a_left:"&PointToString(a_left))
//    Call TracePrint("a_right"&PointToString(a_right))
    Dim l_ret
    l_ret=Array(a_left,a_right)
//    Call TracePrint("l_ret:"&ArrayToString(l_ret))
    RectNew=l_ret
End Function
// a_this:Rect
// return Point
Function RectGetLeft(a_this)
//    Call TracePrint("Function RectGetLeft")
//    Call TracePrint("a_this:"&ArrayToString(a_this))
    Dim l_ret
    l_ret=a_this(0)
//    Call TracePrint("l_ret:"&PointToString(l_ret))
    RectGetLeft=l_ret
End Function
// a_this:Rect
// return Point
Function RectGetRight(a_this)
//    Call TracePrint("Function RectGetRight")
//    Call TracePrint("a_this:"&ArrayToString(a_this))
    Dim l_ret
    l_ret=a_this(1)
//    Call TracePrint("l_ret:"&PointToString(l_ret))
    RectGetRight=l_ret
End Function
// a_this:Rect
// return string
Function RectToString(a_this)
    // Call TracePrint("Function RectToString")
    // Call TracePrint("a_this:"&ArrayToString(a_this))
    Dim l_ret
    l_ret="Rect{left:"&PointToString(RectGetLeft(a_this))&",right:"&PointToString(RectGetRight(a_this))&"}"
    // Call TracePrint("l_ret:"&l_ret)
    RectToString=l_ret
End Function
// a_this:Rect
// return int
Function RectGetLeftX(a_this)
//    Call TracePrint("Function RectGetLeftX")
//    Call TracePrint("a_this:"&ArrayToString(a_this))
    Dim l_ret
    l_ret=PointGetX(RectGetLeft(a_this))
//    Call TracePrint("l_ret:"&l_ret)
    RectGetLeftX=l_ret
End Function
// a_this:Rect
// return int
Function RectGetLeftY(a_this)
//    Call TracePrint("Function RectGetLeftY")
//    Call TracePrint("a_this:"&ArrayToString(a_this))
    Dim l_ret
    l_ret=PointGetY(RectGetLeft(a_this))
//    Call TracePrint("l_ret:"&l_ret)
    RectGetLeftY=l_ret
End Function
// a_this:Rect
// return int
Function RectGetRightX(a_this)
//    Call TracePrint("Function RectGetRightX")
//    Call TracePrint("a_this:"&ArrayToString(a_this))
    Dim l_ret
    l_ret=PointGetX(RectGetRight(a_this))
//    Call TracePrint("l_ret:"&l_ret)
    RectGetRightX=l_ret
End Function
// a_this:Rect
// return int
Function RectGetRightY(a_this)
//    Call TracePrint("Function RectGetRightY")
//    Call TracePrint("a_this:"&ArrayToString(a_this))
    Dim l_ret
    l_ret=PointGetY(RectGetRight(a_this))
//    Call TracePrint("l_ret:"&l_ret)
    RectGetRightY=l_ret
End Function
/* class Rect end */

/* class Image begin */
// a_path:string
// a_name:string
// a_ext:string
// return Image
Function ImageNew(a_path,a_name,a_ext)
//    Call TracePrint("Function ImageNew")
//    Call TracePrint("a_path:"&a_path)
//    Call TracePrint("a_name:"&a_name)
//    Call TracePrint("a_ext:"&a_ext)
    Dim l_ret
    l_ret=a_path&a_name&a_ext
//    Call TracePrint("l_ret:"&l_ret)
    ImageNew=l_ret
End Function
// a_this:Image
// return string
Function ImageToString(a_this)
    // Call TracePrint("Function ImageToString")
    // Call TracePrint("a_this:"&a_this)
    Dim l_ret
    l_ret="Image{path:"&a_this&"}"
    // Call TracePrint("l_ret:"&l_ret)
    ImageToString=l_ret
End Function
/* class Image end */

/* class ImageTask begin */
// a_image:Image
// a_factor:float in [0,1]
// a_rect:Rect
Function ImageTaskNew(a_image,a_factor,a_rect)
//    Call TracePrint("Function ImageTaskNew")
//    Call TracePrint("a_image:"&ImageToString(a_image))
//    Call TracePrint("a_factor:"&a_factor)
//    Call TracePrint("a_rect:"&RectToString(a_rect))
    Dim l_ret
    l_ret = Array(a_image, a_factor, a_rect)
    //Call TracePrint("l_ret:"&ArrayToString(l_ret))
    ImageTaskNew=l_ret
End Function
// a_this:ImageTask
// return Image
Function ImageTaskGetImage(a_this)
//    Call TracePrint("Function ImageTaskGetImage")
//    Call TracePrint("a_this:"&ArrayToString(a_this))
    Dim l_ret
    l_ret=a_this(0)
//    Call TracePrint("l_ret:"&ImageToString(l_ret))
    ImageTaskGetImage=l_ret
End Function
// a_this:ImageTask
// return float in [0,1]
Function ImageTaskGetFactor(a_this)
//    Call TracePrint("Function ImageTaskGetFactor")
//    Call TracePrint("a_this:"&ArrayToString(a_this))
    Dim l_ret
    l_ret=a_this(1)
//    Call TracePrint("l_ret:"&l_ret)
    ImageTaskGetFactor=l_ret
End Function
// a_this:ImageTask
// return Rect
Function ImageTaskGetRect(a_this)
//    Call TracePrint("Function ImageTaskGetRect")
//    Call TracePrint("a_this:"&ArrayToString(a_this))
    Dim l_ret
    l_ret=a_this(2)
//    Call TracePrint("l_ret:"&RectToString(l_ret))
    ImageTaskGetRect=l_ret
End Function
// a_this:ImageTask
// return string
Function ImageTaskToString(a_this)
    // Call TracePrint("Function ImageTaskToString")
    // Call TracePrint("a_this:"&ArrayToString(a_this))
    Dim l_ret
    l_ret="ImageTask{image:"&ImageToString(ImageTaskGetImage(a_this))&",factor:"&ImageTaskGetFactor(a_this)&",rect:"&RectToString(ImageTaskGetRect(a_this))&"}"
    // Call TracePrint("l_ret:"&l_ret)
    ImageTaskToString=l_ret
End Function
// a_this:ImageTask
// return Point
Function ImageTaskFind(a_this)
//    Call TracePrint("Function ImageTaskFind")
//    Call TracePrint("a_this:"&ImageTaskToString(a_this))
    Dim l_image // Image
    Dim l_factor // float
    Dim l_rect // Rect
    l_image=ImageTaskGetImage(a_this)
    l_factor=ImageTaskGetFactor(a_this)
    l_rect=ImageTaskGetRect(a_this)
    Dim l_rect_lx // int
    Dim l_rect_ly // int
    Dim l_rect_rx // int
    Dim l_rect_ry // int
    l_rect_lx=RectGetLeftX(l_rect)
    l_rect_ly=RectGetLeftY(l_rect)
    l_rect_rx=RectGetRightX(l_rect)
    l_rect_ry=RectGetRightY(l_rect)
    Call FindPic(l_rect_lx,l_rect_ly,l_rect_rx,l_rect_ry,l_image,l_factor,l_x,l_y)
    Dim l_ret
    l_ret=PointNew(l_x,l_y)
//    Call TracePrint("l_ret:"&PointToString(l_ret))
    ImageTaskFind=l_ret
End Function
/* class ImageTask end */

// a_tasks:Array<ImageTask>
// return string
Function ImageTaskArrayToString(a_tasks)
	Dim l_ret
	l_ret="["
    For l_idx=0 To UBound(a_tasks)
        l_ret=l_ret&ImageTaskToString(a_tasks(l_idx))
        If(l_idx<>UBound(a_tasks))Then
            l_ret=l_ret&","
        End If
    Next
    ImageTaskArrayToString=l_ret
End Function
// a_tasks:Array<ImageTask>
// return Point
Function FindImages(a_tasks)
    // Call TracePrint("Function FindImages")
    // Call TracePrint("a_tasks:"&ImageTaskArrayToString(a_tasks))
    Dim l_ret // Point
    For l_idx=0 To UBound(a_tasks)
        l_ret=ImageTaskFind(a_tasks(l_idx))
        If PointIsEmpty(l_ret)=False Then
            Exit For
        End If
    Next
    // Call TracePrint("l_ret:"&PointToString(l_ret))
    FindImages=l_ret
End Function
// a_tasks:Array<ImageTask>
// return Point
Function UntilFindImages(a_tasks)
    Call TracePrint("Function UntilFindImages")
    Call TracePrint("a_tasks:"&ImageTaskArrayToString(a_tasks))
    Dim l_ret // Point
    While True
        l_ret=FindImages(a_tasks)
        If PointIsEmpty(l_ret)=False Then
            Goto UntilFindImages_break
        End If
    Wend
    Rem UntilFindImages_break
    Call TracePrint("l_ret:"&PointToString(l_ret))
    UntilFindImages=l_ret
End Function

/* global variable begin */
Dim g_screen_width // int
g_screen_width=1920
Dim g_screen_height // int
g_screen_height=1080
Dim g_screen_rect // Rect
g_screen_rect=RectNew(PointNew(0,0),PointNew(g_screen_width,g_screen_height))
Dim g_image_default_path // string
g_image_default_path="C:\Program Files (x86)\qm2014\attach\"
Dim g_image_default_ext // string
g_image_default_ext=".bmp"
Const g_factor=0.87//正好忽略“指令”灰色背景的干扰
Const g_delay_time=3000
/* global variable end */

// g_image_name:string
// g_factor:float in [0,1]
// return ImageTask
Function MakeImageTask(a_image_name,a_factor)
//    Call TracePrint("Function MakeImageTask")
//    Call TracePrint("a_image_name:"&a_image_name)
//    Call TracePrint("a_factor:"&a_factor)
    Dim l_image // Image
    l_image=ImageNew(g_image_default_path,a_image_name,g_image_default_ext)
    Dim l_ret
    l_ret=ImageTaskNew(l_image,a_factor,g_screen_rect)
//    Call TracePrint("l_ret:"&ImageTaskToString(l_ret))
    MakeImageTask=l_ret
End Function

/* 业务逻辑开始 */
Randomize
Function DelayTime()
    Call Delay(g_delay_time)
    Call Delay(Rnd*2*1000)
End Function

// 得到当前界面的状态
// 返回0，就代表是待签收界面
// 返回1，就代表是已签收界面
// 返回-1，就代表是未知界面
Function GetPageId()
	Call TracePrint("Function GetPageId")
    Dim l_is_signed_page // bool
    Dim l_is_unsigned_page // bool
    Dim l_is_unknown_page // bool
    Dim l_ret// int
    Dim l_signed_page_images
    l_signed_page_images=Array(MakeImageTask("待签收（灰色）1",g_factor),MakeImageTask("待签收（灰色）2",g_factor))
    Dim l_unsigned_page_images
    l_unsigned_page_images=Array(MakeImageTask("已签收（灰色）1",g_factor),MakeImageTask("已签收（灰色）2",g_factor))
    l_is_signed_page=not PointIsEmpty(FindImages(l_signed_page_images))
    l_is_unsigned_page=not PointIsEmpty(FindImages(l_unsigned_page_images))
    If(l_is_unsigned_page)Then
        l_ret=0
        Call TracePrint("当前是待签收界面")
    ElseIf(l_is_signed_page)Then
        l_ret=1
        Call TracePrint("当前是已签收界面")
    Else
        l_ret=-1
        Call TracePrint("当前是未知界面")
    End If
    GetPageId=l_ret
End Function

Function 跳转已签收界面()
    Call TracePrint("Function 跳转已签收界面")
    Dim l_pos // Point
    l_pos=UntilFindImages(Array(MakeImageTask("已签收（灰色）1",g_factor),MakeImageTask("已签收（灰色）2",g_factor)))
    Call MoveTo(PointGetX(l_pos),PointGetY(l_pos))
    Call LeftClick(1)
    Call TracePrint("已点击已签收（灰色）按钮")
    Call DelayTime()
End Function

Function 跳转待签收界面()
    Call TracePrint("Function 跳转待签收界面")
    Dim l_pos // Point
    l_pos=UntilFindImages(Array(MakeImageTask("待签收（灰色）1",g_factor),MakeImageTask("待签收（灰色）2",g_factor)))
    Call MoveTo(PointGetX(l_pos),PointGetY(l_pos))
    Call LeftClick(1)
    Call TracePrint("已点击待签收（灰色）按钮")
    Call DelayTime()
End Function

// a_distance:int
// a_seconds:int
// return void
Function MouseWheelR(a_distance,a_seconds)
    Dim l_count // int
    Dim l_dy // double
    l_count=200
    l_dy=CDbl(a_distance)/l_count
    For l_i=1 To l_count
        Call MouseWheel(l_dy)
        Call Delay(a_seconds/l_count)
    Next
End Function

Function 滑动到指令内容最顶端()
    Call TracePrint("Function 滑动到指令内容最顶端")
    Call MoveTo(g_screen_width*0.75,g_screen_height*0.5)
    Call MouseWheelR(g_screen_height,g_delay_time)
    Call TracePrint("已滑动到指令内容最顶端")
End Function

Function 点击指令()
    Call TracePrint("Function 点击指令")
    Dim l_pos // Point
    l_pos=UntilFindImages(Array(MakeImageTask("指令1",g_factor),MakeImageTask("指令2",g_factor)))
    Call MoveTo(PointGetX(l_pos),PointGetY(l_pos))
    Call LeftClick(1)
    Call TracePrint("已点击指令")
    Call DelayTime()
End Function

Function 签收指令()
    Call TracePrint("Function 签收指令")
    Call 点击指令()
    Call 滑动到指令内容最顶端()
    Dim l_pos // Point
    l_pos=UntilFindImages(Array(MakeImageTask("签收",g_factor)))
    Call MoveTo(PointGetX(l_pos),PointGetY(l_pos))
    Call LeftClick(1)
    Call TracePrint("已点击签收按钮")
    Call DelayTime()
End Function

Function 执行指令()
    Call TracePrint("Function 执行指令")
    Call 点击指令()
    Call 滑动到指令内容最顶端()
    Dim l_pos // Point
    l_pos=UntilFindImages(Array(MakeImageTask("执行",g_factor)))
    Call MoveTo(PointGetX(l_pos),PointGetY(l_pos))
    Call LeftClick(1)
    Call TracePrint("已点击执行按钮")
    Call DelayTime()
End Function

Function 测试跳转()
    Call TracePrint("Function 测试跳转")
    Dim l_page_id // int
    While True
        l_page_id=GetPageId()
        If(l_page_id=0)Then 
            Call 跳转已签收界面()
        ElseIf(l_page_id=1)Then
            Call 跳转待签收界面()
        ElseIf(l_page_id=-1)Then
            Call 跳转待签收界面()
        End if
    Wend
End Function

/*
检查一下当前界面是什么界面？ 
1.待签收界面
    检查一下有没有宣传指令？ 
    如果有宣传指令
        签收，并进入已签收界面
    如果没有宣传指令
        goto 1.
2.已签收界面
    检查一下有没有宣传指令？ 
    如果有宣传指令 
        执行，并进入待签收界面 
    如果没有宣传指令 
        进入待签收界面
*/
Function Main()
    Call TracePrint("Function Main")
    Dim l_page_id // int
    Dim l_change_page_flag // bool
    While True
        l_page_id=GetPageId()
        If(l_page_id=0) Then
            l_change_page_flag=not PointIsEmpty(ImageTaskFind(MakeImageTask("暂无数据",g_factor)))
            If(l_change_page_flag=True)Then
                Call TracePrint("暂无数据")
                Call 跳转已签收界面()
                Goto Main_next_loop
            End If
            Call 签收指令()
        ElseIf(l_page_id=1)Then
            l_change_page_flag=not PointIsEmpty(ImageTaskFind(MakeImageTask("暂无数据",g_factor)))
            If(l_change_page_flag=True)Then
                Call TracePrint("暂无数据")
                Call 跳转待签收界面()
                Goto Main_next_loop
            End If
            Call 执行指令()
        ElseIf(l_page_id=-1)Then
            Call 跳转待签收界面()
        End If
        Rem Main_next_loop
    Wend
End Function

Call Main()
//Call 测试跳转()
//Call GetPageId()
