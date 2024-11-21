/* global begin */

Dim g_screen_width // int
Dim g_screen_height // int
Dim g_screen_rect// Rect
// string
UserVar g_image_default_path="C:\Program Files (x86)\qm2014\AutoReceiveCommand\Attachment\" "Attachment Path(last character must be \)"
Dim g_image_default_ext // string
Dim g_image_default_factor // float in [0,1]
Dim g_not_receive_gray_images // Array<ImageTask>
Dim g_received_gray_images // Array<ImageTask>
Dim g_command // Array<ImageTask>
Dim g_receive_command // ImageTask
Dim g_execute_command // ImageTask
Dim g_no_data // ImageTask
Dim g_delay_time // int ms
Dim g_page_id_not_receive // int
Dim g_page_id_received // int
Dim g_page_id_unknown // int

g_screen_width=Plugin.Sys.GetScRX()
g_screen_height=Plugin.Sys.GetScRY()
g_screen_rect=RectNew(PointNew(0,0),PointNew(g_screen_width,g_screen_height))
g_image_default_ext=".bmp"
g_image_default_factor=0.87
g_not_receive_gray_images=Array(MakeImageTask("NotReceive(Gray)_1",g_image_default_factor),MakeImageTask("NotReceive(Gray)_2",g_image_default_factor))
g_received_gray_images=Array(MakeImageTask("Received(Gray)_1",g_image_default_factor),MakeImageTask("Received(Gray)_2",g_image_default_factor))
g_command=Array(MakeImageTask("Command_1",g_image_default_factor),MakeImageTask("Command_2",g_image_default_factor))
g_receive_command=MakeImageTask("ReceiveCommand",g_image_default_factor)
g_execute_command=MakeImageTask("ExecuteCommand", g_image_default_factor)
g_no_data=MakeImageTask("NoData",g_image_default_factor)
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
    // Call TracePrint("return "&ImageTaskToString(l_ret))
    MakeImageTask=l_ret
End Function

// return void
Function DelayTime()
    Call Delay(g_delay_time)
    Call Delay(RandomFrom0To1()*500)
End Function

// return page id // int
Function GetPageId()
    Call TracePrint("Function GetPageId")
    Dim l_is_received_page // bool
    Dim l_is_not_receive_page // bool
    Dim l_ret // int
    l_is_received_page=False
    l_is_not_receive_page=False
    l_is_received_page=PointIsNotEmpty(FindImages(g_not_receive_gray_images))
    l_is_not_receive_page=PointIsNotEmpty(FindImages(g_received_gray_images))
    If(l_is_not_receive_page And (Not l_is_received_page))Then
        l_ret=g_page_id_not_receive
        Call TracePrint("Current Page is NotReceivePage")
    ElseIf(l_is_received_page And (Not l_is_not_receive_page))Then
        l_ret=g_page_id_received
        Call TracePrint("Current Page is ReceivedPage")
    Else
        l_ret=g_page_id_unknown
        Call TracePrint("Current Page is UnknownPage")
    End If
    // Call TracePrint("return "&l_ret)
    GetPageId=l_ret
End Function

// return void
Function JumpReceivedPage()
    Call TracePrint("Function JumpReceivedPage")
    PointLeftClick(UntilFindImages(g_received_gray_images))
    Call TracePrint("Click Received(Gray) Button")
    Call DelayTime()
End Function

// return void
Function JumpNotReceivePage()
    Call TracePrint("Function JumpNotReceivePage")
    PointLeftClick(UntilFindImages(g_not_receive_gray_images))
    Call TracePrint("Click NotReceive(Gray) Button")
    Call DelayTime()
End Function

// a_distance:int
// a_seconds:int
// return void
Function MouseWheelR(a_distance,a_seconds)
    // Call TracePrint("Function MouseWheelR")
    // Call TracePrint("a_distance:"&a_distance)
    // Call TracePrint("a_seconds:"&a_seconds)
    Dim l_count // int
    Dim l_dy // double
    l_count=200
    l_dy=CDbl(a_distance)/l_count
    For l_i=1 To l_count
        Call MouseWheel(l_dy)
        Call Delay(a_seconds/l_count)
    Next
End Function

// return void
Function SlideToCommandTop()
    Call TracePrint("Function SlideToCommandTop")
    Call MoveTo(g_screen_width*0.75,g_screen_height*0.5)
    Call MouseWheelR(g_screen_height,g_delay_time)
    Call TracePrint("Slide To Command Top")
End Function

// return void
Function ClickCommand()
    Call TracePrint("Function ClickCommand")
    PointLeftClick(UntilFindImages(g_command))
    Call TracePrint("Click Command")
    Call DelayTime()
End Function

// return void
Function ReceiveCommand()
    Call TracePrint("Function ReceiveCommand")
    Call ClickCommand()
    Dim l_has_receive_command // bool
    l_has_receive_command=False
    l_has_receive_command=PointIsNotEmpty(ImageTaskFind(g_receive_command))
    If(Not l_has_receive_command)Then
        Call SlideToCommandTop()
    End If
    PointLeftClick(ImageTaskUntilFind(g_receive_command))
    Call TracePrint("Click ReceiveCommand Button")
    Call DelayTime()
End Function

// return void
Function ExecuteCommand()
    Call TracePrint("Function ExecuteCommand")
    Call ClickCommand()
    Dim l_has_execute_command // bool
    l_has_execute_command=False
    l_has_execute_command=PointIsNotEmpty(ImageTaskFind(g_execute_command))
    If(Not l_has_execute_command)Then
        Call SlideToCommandTop()
    End If
    PointLeftClick(ImageTaskUntilFind(g_execute_command))
    Call TracePrint("Click ExecuteCommand Button")
    Call DelayTime()
End Function

// return void
Function TestPageJump()
    Call TracePrint("Function TestPageJump")
    Dim l_page_id // int
    While True
        l_page_id=GetPageId()
        If(l_page_id=g_page_id_not_receive)Then 
            Call JumpReceivedPage()
        ElseIf(l_page_id=g_page_id_received)Then
            Call JumpNotReceivePage()
        ElseIf(l_page_id=g_page_id_unknown)Then
            Call JumpNotReceivePage()
        End if
    Wend
End Function

// return void
Function Main()
    Call TracePrint("Function Main")
    Dim l_page_id // int
    Dim l_has_no_data // bool
    Dim l_has_command // bool
    While True
        l_page_id=GetPageId()
        l_has_no_data=False
        l_has_command=False
        If(l_page_id=g_page_id_not_receive)Then
            l_has_no_data=PointIsNotEmpty(ImageTaskFind(g_no_data))
            If(l_has_no_data)Then
                Call TracePrint("NoData")
                Call JumpReceivedPage()
                Goto Main_next_loop
            End If
            l_has_command=PointIsNotEmpty(FindImages(g_command))
            If(Not l_has_command)Then 
                Call TracePrint("No Command")
                Call JumpReceivedPage()
                Goto Main_next_loop
            End If
            Call TracePrint("Has Command")
            Call ReceiveCommand()
        ElseIf(l_page_id=g_page_id_received)Then
            l_has_no_data=PointIsNotEmpty(ImageTaskFind(g_no_data))
            If(l_has_no_data)Then
                Call TracePrint("NoData")
                Call JumpNotReceivePage()
                Goto Main_next_loop
            End If
            l_has_command=PointIsNotEmpty(FindImages(g_command))
            If(Not l_has_command)Then 
                Call TracePrint("No Command")
                Call JumpNotReceivePage()
                Goto Main_next_loop
            End If
            Call TracePrint("Has Command")
            Call ExecuteCommand()
        ElseIf(l_page_id=g_page_id_unknown)Then
            Call JumpNotReceivePage()
        End If
        Rem Main_next_loop
    Wend
End Function

Call Main()
