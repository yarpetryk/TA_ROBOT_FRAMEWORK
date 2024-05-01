*** Settings ***
Library    WebSocketClient

*** Test Cases ***
Test title1
    ${my_websocket}=  WebSocketClient.Connect  wss://echo.websocket.org
    WebSocketClient.Send  ${my_websocket}  Hello
    ${result}=  WebSocketClient.Recv  ${my_websocket}
    Should Be Equal  Hello  ${result}
    WebSocketClient.Close  ${my_websocket}
