/* QLib begin */

// a_:argument
// l_:local
// g_:global

// a_array:Array<Any>
// return string
Function ArrayToString(a_array)
    // Call TracePrint("Function ArrayToString")
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
    // Call TracePrint("return "&l_ret)
    ArrayToString=l_ret
End Function

/* class Point begin */

// a_x:int
// a_y:int
// return Point
Function PointNew(a_x,a_y)
    // Call TracePrint("Function PointNew")
    // Call TracePrint("a_x:"&a_x)
    // Call TracePrint("a_y:"&a_y)
    Dim l_ret
    l_ret=Array(a_x,a_y)
    // Call TracePrint("return "&ArrayToString(l_ret))
    PointNew=l_ret
End Function

// a_this:Point
// return int
Function PointGetX(a_this)
    // Call TracePrint("Function PointGetX")
    Dim l_ret
    l_ret=a_this(0)
    // Call TracePrint("return "&l_ret)
    PointGetX=l_ret
End Function

// a_this:Point
// return int
Function PointGetY(a_this)
    // Call TracePrint("Function PointGetY")
    Dim l_ret
    l_ret=a_this(1)
    // Call TracePrint("return "&l_ret)
    PointGetY=l_ret
End Function

// a_this:Point
// return string
Function PointToString(a_this)
    // Call TracePrint("Function PointToString")
    Dim l_ret
    l_ret="Point{x:"&PointGetX(a_this)&",y:"&PointGetY(a_this)&"}"
    // Call TracePrint("return "&l_ret)
    PointToString=l_ret
End Function

// a_this:Point
// return bool
Function PointIsNotEmpty(a_this)
    // Call TracePrint("Function PointIsNotEmpty")
    Dim l_ret // bool
    l_ret=False
    If((PointGetX(a_this)<>-1)and(PointGetY(a_this)<>-1))Then
        l_ret=True
    End If
    // Call TracePrint("return "&l_ret)
    PointIsNotEmpty=l_ret
End Function

/* class Point end */

/* class Rect begin */

// a_left:Point
// a_right:Point
// return Rect
Function RectNew(a_left,a_right)
    // Call TracePrint("Function RectNew")
    // Call TracePrint("a_left:"&PointToString(a_left))
    // Call TracePrint("a_right"&PointToString(a_right))
    Dim l_ret
    l_ret=Array(a_left,a_right)
    // Call TracePrint("return "&ArrayToString(l_ret))
    RectNew=l_ret
End Function

// a_this:Rect
// return Point
Function RectGetLeft(a_this)
    // Call TracePrint("Function RectGetLeft")
    Dim l_ret
    l_ret=a_this(0)
    // Call TracePrint("return "&PointToString(l_ret))
    RectGetLeft=l_ret
End Function

// a_this:Rect
// return Point
Function RectGetRight(a_this)
    // Call TracePrint("Function RectGetRight")
    Dim l_ret
    l_ret=a_this(1)
    // Call TracePrint("return "&PointToString(l_ret))
    RectGetRight=l_ret
End Function

// a_this:Rect
// return string
Function RectToString(a_this)
    // Call TracePrint("Function RectToString")
    Dim l_ret
    l_ret="Rect{left:"&PointToString(RectGetLeft(a_this))&",right:"&PointToString(RectGetRight(a_this))&"}"
    // Call TracePrint("return "&l_ret)
    RectToString=l_ret
End Function

// a_this:Rect
// return int
Function RectGetLeftX(a_this)
    // Call TracePrint("Function RectGetLeftX")
    Dim l_ret
    l_ret=PointGetX(RectGetLeft(a_this))
    // Call TracePrint("return "&l_ret)
    RectGetLeftX=l_ret
End Function

// a_this:Rect
// return int
Function RectGetLeftY(a_this)
    // Call TracePrint("Function RectGetLeftY")
    Dim l_ret
    l_ret=PointGetY(RectGetLeft(a_this))
    // Call TracePrint("return "&l_ret)
    RectGetLeftY=l_ret
End Function

// a_this:Rect
// return int
Function RectGetRightX(a_this)
    // Call TracePrint("Function RectGetRightX")
    Dim l_ret
    l_ret=PointGetX(RectGetRight(a_this))
    // Call TracePrint("return "&l_ret)
    RectGetRightX=l_ret
End Function

// a_this:Rect
// return int
Function RectGetRightY(a_this)
    // Call TracePrint("Function RectGetRightY")
    Dim l_ret
    l_ret=PointGetY(RectGetRight(a_this))
    // Call TracePrint("return "&l_ret)
    RectGetRightY=l_ret
End Function

/* class Rect end */

/* class Image begin */

// a_path:string
// a_name:string
// a_ext:string
// return Image
Function ImageNew(a_path,a_name,a_ext)
    // Call TracePrint("Function ImageNew")
    // Call TracePrint("a_path:"&a_path)
    // Call TracePrint("a_name:"&a_name)
    // Call TracePrint("a_ext:"&a_ext)
    Dim l_ret
    l_ret=a_path&a_name&a_ext
    // Call TracePrint("return "&l_ret)
    ImageNew=l_ret
End Function

// a_this:Image
// return string
Function ImageToString(a_this)
    // Call TracePrint("Function ImageToString")
    // Call TracePrint("a_this:"&a_this)
    Dim l_ret
    l_ret="Image{path:"&a_this&"}"
    // Call TracePrint("return "&l_ret)
    ImageToString=l_ret
End Function

/* class Image end */

/* class ImageTask begin */

// a_image:Image
// a_factor:float in [0,1]
// a_rect:Rect
Function ImageTaskNew(a_image,a_factor,a_rect)
    // Call TracePrint("Function ImageTaskNew")
    // Call TracePrint("a_image:"&ImageToString(a_image))
    // Call TracePrint("a_factor:"&a_factor)
    // Call TracePrint("a_rect:"&RectToString(a_rect))
    Dim l_ret
    l_ret = Array(a_image, a_factor, a_rect)
    //Call TracePrint("return "&ArrayToString(l_ret))
    ImageTaskNew=l_ret
End Function

// a_this:ImageTask
// return Image
Function ImageTaskGetImage(a_this)
    // Call TracePrint("Function ImageTaskGetImage")
    Dim l_ret
    l_ret=a_this(0)
    // Call TracePrint("return "&ImageToString(l_ret))
    ImageTaskGetImage=l_ret
End Function

// a_this:ImageTask
// return float in [0,1]
Function ImageTaskGetFactor(a_this)
    // Call TracePrint("Function ImageTaskGetFactor")
    Dim l_ret
    l_ret=a_this(1)
    // Call TracePrint("return "&l_ret)
    ImageTaskGetFactor=l_ret
End Function

// a_this:ImageTask
// return Rect
Function ImageTaskGetRect(a_this)
    // Call TracePrint("Function ImageTaskGetRect")
    Dim l_ret
    l_ret=a_this(2)
    // Call TracePrint("return "&RectToString(l_ret))
    ImageTaskGetRect=l_ret
End Function

// a_this:ImageTask
// return string
Function ImageTaskToString(a_this)
    // Call TracePrint("Function ImageTaskToString")
    Dim l_ret
    l_ret="ImageTask{image:"&ImageToString(ImageTaskGetImage(a_this))&",factor:"&ImageTaskGetFactor(a_this)&",rect:"&RectToString(ImageTaskGetRect(a_this))&"}"
    // Call TracePrint("return "&l_ret)
    ImageTaskToString=l_ret
End Function

// a_this:ImageTask
// return Point
Function ImageTaskFind(a_this)
    // Call TracePrint("Function ImageTaskFind")
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
    // Call TracePrint("return "&PointToString(l_ret))
    ImageTaskFind=l_ret
End Function

// a_this:ImageTask
// return Point
Function ImageTaskUntilFind(a_this)
    // Call TracePrint("Function ImageTaskUntilFind")
    Dim l_ret
    While True
        l_ret=ImageTaskFind(a_this)
        If(PointIsNotEmpty(l_ret))Then
            Goto ImageTaskUntilFind_break
        End If
    Wend
    Rem ImageTaskUntilFind_break
    // Call TracePrint("return "&l_ret)
    ImageTaskUntilFind=l_ret
End Function

/* class ImageTask end */

// a_image_task_array:Array<ImageTask>
// return string
Function ImageTaskArrayToString(a_image_task_array)
    // Call TracePrint("Function ImageTaskArrayToString")
    Dim l_ret
    l_ret="["
    For l_idx=0 To UBound(a_image_task_array)
        l_ret=l_ret&ImageTaskToString(a_image_task_array(l_idx))
        If(l_idx<>UBound(a_image_task_array))Then
            l_ret=l_ret&","
        End If
    Next
    l_ret=l_ret&"]"
    // Call TracePrint("return "&l_ret)
    ImageTaskArrayToString=l_ret
End Function

// a_image_task_array:Array<ImageTask>
// return Point
Function FindImages(a_image_task_array)
    // Call TracePrint("Function FindImages")
    // Call TracePrint("a_image_task_array:"&ImageTaskArrayToString(a_image_task_array))
    Dim l_ret // Point
    For l_idx=0 To UBound(a_image_task_array)
        l_ret=ImageTaskFind(a_image_task_array(l_idx))
        If(PointIsNotEmpty(l_ret))Then
            Exit For
        End If
    Next
    // Call TracePrint("return "&PointToString(l_ret))
    FindImages=l_ret
End Function

// a_image_task_array:Array<ImageTask>
// return Point
Function UntilFindImages(a_image_task_array)
    // Call TracePrint("Function UntilFindImages")
    // Call TracePrint("a_image_task_array:"&ImageTaskArrayToString(a_image_task_array))
    Dim l_ret // Point
    While True
        l_ret=FindImages(a_image_task_array)
        If(PointIsNotEmpty(l_ret))Then
            Goto UntilFindImages_break
        End If
    Wend
    Rem UntilFindImages_break
    // Call TracePrint("return "&PointToString(l_ret))
    UntilFindImages=l_ret
End Function

// return float in [0,1]
Function RandomFrom0To1()
    // Call TracePrint("Function RandomFrom0To1")
    Randomize
    Dim l_ret
    l_ret=Rnd()
    // Call TracePrint("return "&l_ret)
    RandomFrom0To1=l_ret
End Function

/* QLib end */

/* 业务逻辑 begin */

/* global decl begin */

Dim g_screen_width // int
Dim g_screen_height // int
Dim g_screen_rect // Rect
Dim g_image_default_path // string
Dim g_image_default_ext // string
Dim g_image_default_factor // float in [0,1]
Dim g_not_receive_gray_images // Array<ImageTask>
Dim g_received_gray_images // Array<ImageTask>
Dim g_delay_time // int ms
Dim g_page_id_not_receive // int
Dim g_page_id_received // int
Dim g_page_id_unknown // int

/* global decl end */

/* global impl begin */

g_screen_width=1920
g_screen_height=1080
g_screen_rect=RectNew(PointNew(0,0),PointNew(g_screen_width,g_screen_height))
g_image_default_path="Attachment:\"
g_image_default_ext=".bmp"
g_image_default_factor=0.8
g_not_receive_gray_images=Array(MakeImageTask("待签收（灰色）1",g_image_default_factor),MakeImageTask("待签收（灰色）2",g_image_default_factor))
g_received_gray_images=Array(MakeImageTask("已签收（灰色）1",g_image_default_factor),MakeImageTask("已签收（灰色）2",g_image_default_factor))
g_delay_time=3000
g_page_id_not_receive=0
g_page_id_received=1
g_page_id_unknown=-1

/* global impl end */

// a_image_name:string
// a_image_factor:float in [0,1]
// return ImageTask
Function MakeImageTask(a_image_name,a_image_factor)
    // Call TracePrint("Function MakeImageTask")
    // Call TracePrint("a_image_name:"&a_image_name)
    // Call TracePrint("a_image_factor:"&a_image_factor)
    Dim l_image // Image
    l_image=ImageNew(g_image_default_path,a_image_name,g_image_default_ext)
    Dim l_ret
    l_ret=ImageTaskNew(l_image,a_image_factor,g_screen_rect)
    // Call TracePrint("l_ret:"&ImageTaskToString(l_ret))
    MakeImageTask=l_ret
End Function

Function DelayTime()
    Call Delay(g_delay_time)
    Call Delay(RandomFrom0To1()2*1000)
End Function

// 得到当前界面的状态
// 返回0，就代表是待签收界面
// 返回1，就代表是已签收界面
// 返回-1，就代表是未知界面
Function GetPageId()
    Call TracePrint("Function GetPageId")
    Dim l_is_received_page // bool
    Dim l_is_not_receive_page // bool
    Dim l_is_unknown_page // bool
    Dim l_ret// int
    l_is_received_page=PointIsNotEmpty(FindImages(g_not_receive_gray_images))
    l_is_not_receive_page=PointIsNotEmpty(FindImages(g_received_gray_images))
    If(l_is_not_receive_page)Then
        l_ret=g_page_id_not_receive
        Call TracePrint("当前是待签收界面")
    ElseIf(l_is_received_page)Then
        l_ret=g_page_id_received
        Call TracePrint("当前是已签收界面")
    Else
        l_ret=g_page_id_unknown
        Call TracePrint("当前是未知界面")
    End If
    GetPageId=l_ret
End Function

Function 跳转已签收界面()
    Call TracePrint("Function 跳转已签收界面")
    Dim l_pos // Point
    l_pos=UntilFindImages(g_received_gray_images)
    Call MoveTo(PointGetX(l_pos),PointGetY(l_pos))
    Call LeftClick(1)
    Call TracePrint("已点击已签收（灰色）按钮")
    Call DelayTime()
End Function

Function 跳转待签收界面()
    Call TracePrint("Function 跳转待签收界面")
    Dim l_pos // Point
    l_pos=UntilFindImages(g_not_receive_gray_images)
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
    l_pos=UntilFindImages(Array(MakeImageTask("指令1",g_image_default_factor),MakeImageTask("指令2",g_image_default_factor)))
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
    l_pos=ImageTaskUntilFind(MakeImageTask("签收",g_image_default_factor))
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
    l_pos=ImageTaskUntilFind(MakeImageTask("执行",g_image_default_factor))
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
        If(l_page_id=g_page_id_not_receive)Then 
            Call 跳转已签收界面()
        ElseIf(l_page_id=g_page_id_received)Then
            Call 跳转待签收界面()
        ElseIf(l_page_id=g_page_id_unknown)Then
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
        If(l_page_id=g_page_id_not_receive)Then
            l_change_page_flag=PointIsNotEmpty(ImageTaskFind(MakeImageTask("暂无数据",g_image_default_factor)))
            If(l_change_page_flag)Then
                Call TracePrint("暂无数据")
                Call 跳转已签收界面()
                Goto Main_next_loop
            End If
            Call 签收指令()
        ElseIf(l_page_id=g_page_id_received)Then
            l_change_page_flag=PointIsNotEmpty(ImageTaskFind(MakeImageTask("暂无数据",g_image_default_factor)))
            If(l_change_page_flag)Then
                Call TracePrint("暂无数据")
                Call 跳转待签收界面()
                Goto Main_next_loop
            End If
            Call 执行指令()
        ElseIf(l_page_id=g_page_id_unknown)Then
            Call 跳转待签收界面()
        End If
        Rem Main_next_loop
    Wend
End Function

/* 业务逻辑 end */

Call Main()
