*** Settings ***
Suite Teardown    Close All Browsers
Test Timeout      1 minute
Resource          ../Bisque_GUI.robot
Library           Selenium2Library    5s    run_on_failure=Bisque Run On Failure

*** Test Cases ***
Open Default Page
    [Tags]    GUI    smoke
    Open Browser    http://${WebHost}    ${Browser}    ${BrowserAlias}
    Comment    Open the browser fullscreen.
    Maximize Browser Window
    Wait Until Page Contains    Explore published data    ${GUIShortWait}

Verify Title of Bisque: Welcome to the Bisque database
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Title Should Be    Bisque: Welcome to the BisQue database

Verify Welcome to the Bisque database text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Wait Until Page Contains    Welcome to the Bisque database    ${GUIShortWait}
    Page Should Contain    Welcome to the Bisque database

Verify Explore published data panel
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Explore published data
    Page Should Contain Element    xpath=//span[contains(text(),'Explore published data')]

Verify Image uploads - daily link appears
    [Tags]    GUI    smoke    BISQUE-24
    Switch Browser  ${BrowserAlias}
    Wait Until Page Contains Element    link=Image uploads - daily    ${GUIShortWait}
    Page Should Contain Link    Image uploads - daily

Verify Explore published data panel Applications tab
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    xpath=//span[contains(text(),'Applications')]

Verify Applications tab RootTip link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    xpath=//label[contains(text(),'RootTip')]

Verify Applications tab RootTipMulti link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    xpath=//label[contains(text(),'RootTipMulti')]

Verify Applications tab SeedSize link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    xpath=//label[contains(text(),'SeedSize')]

Verify Applications tab MotionMeerkat link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    xpath=//label[contains(text(),'MotionMeerkat')]

Verify Applications tab kkvilekval owner xpath
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    xpath=//label[contains(text(),'Owner: kkvilekval')]

Verify Applications tab bw4sz owner xpath
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    XPath Should Match X Times    //label[contains(text(),'Owner: bw4sz')]    1

Verify Explore published data panel Featured datasets tab
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    xpath=//span[contains(text(),'Featured datasets')]

Verify Explore published data panel Images tab
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    xpath=//span[contains(text(),'Images')]

Verify Explore published data panel RootTip app
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    xpath=//label[contains(text(),'RootTip')]

Verify Explore published data panel RootTipMulti app
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    xpath=//label[contains(text(),'RootTipMulti')]

Verify Explore published data panel SeedSize app
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    xpath=//label[contains(text(),'SeedSize')]

Verify Explore published data panel MotionMeerkat app
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    xpath=//label[contains(text(),'MotionMeerkat')]

Verify Bisque usage panel
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Comment    Page Should Contain Element    Bisque usage
    Page Should Contain Element    xpath=//span[contains(text(),'Bisque usage')]

Verify Default Text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain    Welcome to the BisQue database

Verify BisQue Text
    [Tags]    GUI    smoke    skipped
    Switch Browser    ${BrowserAlias}
    Page Should Contain    BisQue

Verify Download button
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    xpath=//span[contains(text(),'Download')]

Verify Download dropdown Download manager
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Click Element    xpath=//span[contains(text(),'Download')]
    Wait Until Page Contains Element    xpath=//span[contains(text(),'Download manager')]    ${GUIShortWait}
    Page Should Contain Element    xpath=//span[contains(text(),'Download manager')]

Verify Analyze button
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    xpath=//span[contains(text(),'Analyze')]

Verify Analyze dropdown Groups text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Click Element    xpath=//span[contains(text(),'Analyze')]
    Wait Until Page Contains Element    xpath=//div[contains(text(),'Tracking')]    ${GUIShortWait}
    Page Should Contain Element    xpath=//span[contains(text(),'Groups')]

Verify Analyze dropdown application
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    xpath=//div[contains(text(),'application')]

Verify Analyze dropdown Cell Analysis
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    xpath=//div[contains(text(),'Cell Analysis')]

Verify Analyze dropdown Detection
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    xpath=//div[contains(text(),'Detection')]

Verify Analyze dropdown Examples
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    xpath=//div[contains(text(),'Examples')]

Verify Analyze dropdown Filtering
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    xpath=//div[contains(text(),'Filtering')]

Verify Analyze dropdown Nuclear Analysis
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    xpath=//div[contains(text(),'Nuclear Analysis')]

Verify Analyze dropdown Plant Analysis
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    xpath=//div[contains(text(),'Plant Analysis')]

Verify Analyze dropdown Root Analysis
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    xpath=//div[contains(text(),'Root Analysis')]

Verify Analyze dropdown Seed Analysis
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    xpath=//div[contains(text(),'Seed Analysis')]

Verify Analyze dropdown Test
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    xpath=//div[contains(text(),'Test')]

Verify Analyze dropdown Tracking
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    xpath=//div[contains(text(),'Tracking')]

Verify Browse button
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    xpath=//span[contains(text(),'Browse')]

Verify Browse dropdown None
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Click Element    xpath=//span[contains(text(),'Browse')]
    Wait Until Page Contains Element    xpath=//span[contains(text(),'user')]    ${GUIShortWait}
    Page Should Contain Element    xpath=//span[contains(text(),'None')]

Verify Browse dropdown dataset
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    xpath=//span[contains(text(),'dataset')]

Verify Browse dropdown file
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    xpath=//span[contains(text(),'file')]

Verify Browse dropdown image
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    xpath=//span[contains(text(),'image')]

Verify Browse dropdown mex
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    xpath=//span[contains(text(),'mex')]

Verify Browse dropdown module
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    xpath=//span[contains(text(),'module')]

Verify Browse dropdown service
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    xpath=//span[contains(text(),'service')]

Verify Browse dropdown system
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    xpath=//span[contains(text(),'system')]

Verify Browse dropdown tag
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    xpath=//span[contains(text(),'tag')]

Verify Browse dropdown template
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    xpath=//span[contains(text(),'template')]

Verify Browse dropdown text
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    xpath=//span[contains(text(),'text')]

Verify Browse dropdown user
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    xpath=//span[contains(text(),'user')]

Verify Search editbox
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Comment    Page Should Contain Element    xpath=//input[contains(value(),'Find resources using tags')]
    Page Should Contain Element    name=search

Verify Sign In dropdown
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    xpath=//span[contains(text(),'Sign in')]

Verify Sign In dropdown Register new user
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Click Element    xpath=//span[contains(text(),'Sign in')]
    Wait Until Page Contains Element    xpath=//span[contains(text(),'Recover Password')]    ${GUIShortWait}
    Page Should Contain Element    xpath=//span[contains(text(),'Register new user')]

Verify Sign In dropdown Recover Password
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    xpath=//span[contains(text(),'Recover Password')]

Verify Help dropdown exists
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    id=button-1066-btnIconEl

Open Help dropdown list
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Click Element    id=button-1066-btnIconEl
    Comment    Wait Until Page Contains Element    css=video.video-stream.html5-main-video
    Wait Until Page Contains    Contextual help video:
    Wait Until Page Contains    Problems with Bisque?

Verify Tutorial Video is available
    [Tags]    GUI    smoke    skipped
    Comment    This isn't working yet
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    xpath=//video
    Page Should Contain Element    css=video.video-stream.html5-main-video

Verify About Bisque link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    xpath=//span[text()="About"]

Verify Privacy policy link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Link    Privacy policy

Verify Terms of use link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Link    Terms of use

Verify License link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Link    License

Verify Usage statistics link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Link    Usage statistics

Verify Online Help link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Link    Online Help

Verify Bisque project website link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Element    xpath=//span[text()="Project website"]

Verify Developers website link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Link    Developers website

Verify Submit a bug or suggestion link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Link    Submit a bug or suggestion

Verify Send us e-mail link
    [Tags]    GUI    smoke
    Switch Browser    ${BrowserAlias}
    Page Should Contain Link    Send us e-mail

