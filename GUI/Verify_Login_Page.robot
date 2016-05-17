*** Settings ***
Suite Teardown    Close All Browsers
Test Timeout      1 minute
Resource          ../Bisque_GUI.robot
Library           Selenium2Library    5s    run_on_failure=Bisque Run On Failure

*** Test Cases ***
Open Login Page
    [Tags]    GUI    smoke
    Bisque Log In    ${WebHost}
    Comment    Sleep    5s

Verify Bisque usage text appears
    [Tags]    GUI    smoke
    Switch Browser  ${BrowserAlias}
    Page Should Contain    Bisque usage

Verify Image uploads - daily link appears
    [Tags]    GUI    smoke    BISQUE-24
    Switch Browser  ${BrowserAlias}
    Wait Until Page Contains Element    link=Image uploads - daily    ${GUIShortWait}
    Page Should Contain Link    Image uploads - daily

Verify Datasets tab exists
    [Tags]    GUI    smoke
    Switch Browser  ${BrowserAlias}
    Page Should Contain Link    Datasets

Verify Images tab exists
    [Tags]    GUI    smoke
    Switch Browser  ${BrowserAlias}
    Page Should Contain Link    Images

Verify Analysis tab exists
    [Tags]    GUI    smoke
    Switch Browser  ${BrowserAlias}
    Page Should Contain Link    Analysis
