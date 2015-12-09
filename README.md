# AhkClipboardReg
Autohotkey clipboard register

AhkClipboardReg 는 autohotkey 로 만든 VIM like 네비게이션 도구인 [AhkVimLike](https://github.com/johngrib/AhkVimLike) 에서 클립보드 레지스터 기능만 떼어낸 프로그램입니다. ^c 를 입력할 때마다 클립보드 히스토리를 10 개까지 보관하며 F1 ~ F12 키에 원하는 문자열을 보관할 수 있습니다.

## how to use

[Application Context](https://www.google.co.kr/search?lr=&complete=1&hl=ko&biw=960&bih=482&tbm=isch&sa=1&q=keyboard+application+context+key&oq=keyboard+application+context+key&gs_l=img.3...4612.6761.0.6944.11.10.1.0.0.0.225.985.0j5j1.6.0....0...1c.1.64.img..11.0.0.-p4qFuTqG24) 키는 복사하기 (^c), Capslock 키는 붙여넣기 (^v) 기능을 합니다.

* __^c__ : control + c 의 기능 자체는 변함이 없습니다. 단, 복사를 할 때마다 복사한 내용이 AhkClipboardReg 의 히스토리에 보관됩니다.

* __Capslock double press__ : Capslock 키를 두 번 연속 누르면 클립보드 레지스터의 내용을 볼 수 있습니다.

* __AppsKey + Function key__ : Application Context key 와 F1 ~ F12 까지의 키를 함께 누르면 해당하는 function 키에 클립보드 내용을 매핑시키고 보관합니다.

* __AppsKey + Number key__ : Application Context key 와 0 ~ 9 까지의 숫자 키를 함께 누르면 해당하는 히스토리 넘버에 클립보드 내용을 매핑시키고 보관합니다.

* __Capslock + Function key__ : Capslock 키와 F1 ~ F12 까지의 키를 함께 누르면 해당하는 function 키에 매핑되었던 클립보드 내용을 붙여넣습니다.

* __Capslock + Number key__ : Capslock 키와 0 ~ 9 까지의 숫자 키를 함께 누르면 해당하는 히스토리 넘버에 매핑된 클립보드 내용을 붙여넣습니다.

## how to install

[Autohotkey.com](https://www.autohotkey.com/) 에서 Autohotkey 를 다운받아 설치합니다.

그 다음 src 폴더 내에 있는 Main.ahk 를 실행하면 사용할 수 있습니다.