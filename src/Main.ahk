/*
  @Author  : johngrib82@gmail.com
  @Created : 2015. DEC. 09
*/
#NoEnv
#SingleInstance
;#NoTrayIcon
#Persistent
#include ClipOBJ.ahk

SendMode Input

global CLIP

main(){
  Static init := main()

  CLIP := new ClipOBJ()
}

AppsKey::Send, {AppsKey}

/*
  copy to register F1 ~ F12
*/
AppsKey & F1::
AppsKey & F2::
AppsKey & F3::
AppsKey & F4::
AppsKey & F5::
AppsKey & F6::
AppsKey & F7::
AppsKey & F8::
AppsKey & F9::
AppsKey & F10::
AppsKey & F11::
AppsKey & F12::
  f_key := RegExReplace(A_ThisHotkey, "^.+(F\d\d?)$", "$1")
  copy_to_clipboard_register(f_key)
return

/*
  copy to register 0 ~ 9
*/
AppsKey & 0::
AppsKey & 1::
AppsKey & 2::
AppsKey & 3::
AppsKey & 4::
AppsKey & 5::
AppsKey & 6::
AppsKey & 7::
AppsKey & 8::
AppsKey & 9::
  f_key := RegExReplace(A_ThisHotkey, "^.+(\d)$", "$1")
  copy_to_clipboard_register(f_key)
return

/*
  paste from register F1 ~ F12
*/
CapsLock & F1::
CapsLock & F2::
CapsLock & F3::
CapsLock & F4::
CapsLock & F5::
CapsLock & F6::
CapsLock & F7::
CapsLock & F8::
CapsLock & F9::
CapsLock & F10::
CapsLock & F11::
CapsLock & F12::
  f_key := RegExReplace(A_ThisHotkey, "^.+(F\d\d?)$", "$1")
  paste_from_clipboard_register(f_key)
return

/*
  paste from register 0 ~ 9
*/
CapsLock & 0::
CapsLock & 1::
CapsLock & 2::
CapsLock & 3::
CapsLock & 4::
CapsLock & 5::
CapsLock & 6::
CapsLock & 7::
CapsLock & 8::
CapsLock & 9::
  f_key := RegExReplace(A_ThisHotkey, "^.+(\d)$", "$1")
  paste_from_clipboard_register(f_key)
return

/*
+CapsLock & F1::
  paste_from_clipboard_register("F1")
return
*/
/*
  double click 'CAPSLOCK' to show clipboard register
*/
~Capslock::
    if (A_PriorHotKey = "~Capslock" and A_TimeSincePriorHotKey < 300) {
      msg := CLIP.get_list()
      MsgBox % msg
    }
return

/*
  ^c -> push to clipboard register
*/
~^c::
  Sleep 300
  new_value := Clipboard
  CLIP.num_unshift(new_value)
return

paste_from_clipboard_register(key){
  temp := Clipboard
  Clipboard := CLIP.get_value(key)
  Send, ^{v}
  Clipboard := temp
}

copy_to_clipboard_register(key){
  temp := Clipboard
  Send, ^{c}
  Sleep 500
  CLIP.set_value(key, Clipboard)
  Clipboard := temp
}
