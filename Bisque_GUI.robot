*** Settings ***
Resource          ./Bisque_Resources.robot
Library           String

*** Keywords ***
Bisque Run On Failure
    Log Source
    Comment    ${SShotCount} =    Set Variable    ${SShotCount}+1
    Comment    Set Global Variable    ${SShotCount}    ${SShotCount + 1}
    ${SShotCount} =    Evaluate    ${SShotCount} + 1
    Set Global Variable    ${SShotCount}
    Capture Page Screenshot    ${SShotBase}-${SShotCount}.png

Bisque Log In
    [Arguments]    ${WebHost}
    Open Browser    http://${WebHost}    ${Browser}    ${BrowserAlias}
    Comment    Open the browser fullscreen.
    Maximize Browser Window
    Wait Until Page Contains Element    xpath=//span[contains(text(),'Sign in')]    ${GUIShortWait}
    Page Should Contain Link    Sign in
    Click Link    Sign in
    Comment    Wait Until Page Contains Element    id=button-1062-btnIconEl
    Comment    Click Element    id=button-1062-btnIconEl
    Wait Until Page Contains Element    xpath=//span[@class="x-btn-wrap"]/span/span[@class="x-btn-inner x-btn-inner-center"][text()="Sign in"]/../span[@style=""]    ${GUIShortWait}
    Click Element    xpath=//span[@class="x-btn-wrap"]/span/span[@class="x-btn-inner x-btn-inner-center"][text()="Sign in"]/../span[@style=""]
    Wait Until Page Contains Element    id=username    ${GUIShortWait}
    Wait Until Page Contains Element    id=password    ${GUIShortWait}
    Wait Until Page Contains Element    css=input[name="submit"]    ${GUIShortWait}
    Input Text    css=#username    ${UserName}
    Input Password    css=#password    ${Password}
    Comment    Now Click the Login button
    Click Element    css=input[name="submit"]
    Wait Until Page Contains Element    //span[@class="x-btn-inner x-btn-inner-center"][text()="${FirstName} ${LastName}"]    ${GUIShortWait}
    Page Should Contain Element    //span[@class="x-btn-inner x-btn-inner-center"][text()="${FirstName} ${LastName}"]
    Page Should Contain    My recent stuff
