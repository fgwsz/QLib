// Author:<https://github.com/fgwsz>
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

// a_this:Point
// return void
Function PointMoveTo(a_this)
    // Call TracePrint("Function PointMoveTo")
    Call MoveTo(PointGetX(a_this),PointGetY(a_this))
End Function

// a_this:Point
// return void
Function PointLeftClick(a_this)
    // Call TracePrint("Function PointLeftClick")
    PointMoveTo(a_this)
    Call LeftClick(1)
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
    // Call TracePrint("return "&PointToString(l_ret))
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
