/* global begin */

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

/* global end */

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

Call Main()
