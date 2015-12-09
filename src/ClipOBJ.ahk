/*
  command object
  @Author  : johngrib82@gmail.com
  @Created : 2015. DEC. 09
*/
class ClipOBJ {
  __New() {
    this.num_size := 10
    this.chr_size := 26
    this.chr_list := ["F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8" ,"F9", "F10", "F11", "F12"]
    
    this.num_queue := Object()
    this.chr_map := Object()
    
    cnt := this.num_size
    loop %cnt% {
      this.num_queue[A_Index - 1] := ""
    }    

    cnt := this.chr_list.Length()
    loop %cnt% {
      this.chr_map[this.chr_list[A_Index]] := ""
    }
  }

  num_unshift(new_value) {
    new_arr := Object()
    for k, v in this.num_queue {
      if(k + 1 < this.num_size){
        new_arr[k + 1] := v
      }
    }
    new_arr[0] := new_value
    this.num_queue := new_arr
  }

  set_value(key, value){
    if( RegExMatch(key, "^\d+$") && key < this.num_size) {
      this.num_queue[key] := value
    } else if ( RegExMatch(key, "^[Ff]\d+$")) {
      this.chr_map[key] := value
    }
  }
  
  get_value(key){
    if( RegExMatch(key, "^\d+$")) {
      return this.num_queue[key]
    } else if ( RegExMatch(key, "^[Ff]\d+$")) {
      return this.chr_map[key]
    }
  }

  get_list(){
    
    plus := Clipboard
    plus := SubStr(plus, 1, 30)
    plus := RegExReplace(plus, "\r|\n", "^J")
    
    msg := """+ :: " . plus
    
    msg := msg . "`n======================================" 
    
    for k, v in this.num_queue {
      if( v <> "" ){
        show_v := SubStr(Trim(v), 1, 30)
        show_v := RegExReplace(show_v, "\r\n", "^J")
        msg := msg . "`n""" . k . " :: " . show_v
      }
    }
    msg := msg . "`n======================================" 
    for k, v in this.chr_map {
      if( v <> "" ){
        show_v := SubStr(Trim(v), 1, 30)
        show_v := RegExReplace(show_v, "\r\n", "^J")
        msg := msg . "`n""" . k . " :: " . show_v
      }
    }
    
    return msg
  }
}