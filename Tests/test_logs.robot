*** Test Cases ***
MyFirstTest
    [Tags]  smoke  #--include tag name --exclude tag name
    Log  Hello word...

MySecondTest
    Log  i'm inside second test
    set tags  regrattion
    remove tags  regrattion

MyThirdTest
    Log  qa team 3 test.1