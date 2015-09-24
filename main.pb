Procedure SplitImage(image, sizew.i = 32, sizeh.i = 32, skip.i = 0)
     Define img_w = ImageWidth(image)
     Define img_h = ImageHeight(image)
     Define image_part
     
     Define maxskip = skip
     Define skipc.i = 0
     Define x.i = 0
     Define y.i = 0
     part_w.i = sizew
     part_h.i = sizeh
     Define count.i = 0 
     split_horizontal:
     Repeat
          Define image_part = GrabImage(image, #PB_Any, x, y, part_w, part_h)
          If skipc = 0
               If SaveImage(image_part, Str(count) + ".png", #PB_ImagePlugin_PNG, 1) = 0
                    PrintN("error: could not write out image")
                    End
               EndIf
               PrintN("created image " + Str(count) + ".png")
               count = count + 1
          EndIf
          FreeImage(image_part)
          x = x + part_w
          skipc = skipc + 1
          If skipc > = maxskip
               skipc = 0
          EndIf
          If x >= img_w : Break : EndIf     
     ForEver
     x = 0
     y = y + part_h
     If y >= img_h
          PrintN("done")
          ProcedureReturn #True
     Else 
          Goto split_horizontal
     EndIf
EndProcedure

Procedure Main(img_filename.s, sizew.i, sizeh.i, skip.i)
     If img_filename = "help" Or img_filename = "-h" Or img_filename = ""
          PrintN("usage: filename imagename width height skip")
          ProcedureReturn #False
     EndIf

     UsePNGImageDecoder()
     UseJPEGImageDecoder()
     UsePNGImageEncoder()
     UseJPEGImageEncoder()
     
     Define image.i = LoadImage(#PB_Any, img_filename) 
     If image = 0 : PrintN("could not load image: " + img_filename ) : End : EndIf     
     SplitImage(image, sizew, sizeh, skip)
EndProcedure

OpenConsole()
Define imgfile.s = ProgramParameter()
Define sizew.i = Val(ProgramParameter())
Define sizeh.i = Val(ProgramParameter())
Define skip.i = Val(ProgramParameter())
Main(imgfile, sizew, sizeh, skip)
Input()
CloseConsole()
