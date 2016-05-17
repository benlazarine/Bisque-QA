*** Settings ***
Resource          ../Bisque_Resources.robot
Library           XML
Library           RequestsLibrary
Suite Setup       Create Session    bisque    http://${WebHost}
Suite Teardown       Delete All Sessions

*** Test Cases ***
Get Usage Stats
    [Tags]    api    smoke
    ${resp}=    Get Request    bisque    /usage/stats
    Log    ${resp.content}
    Should Be Equal As Integers    ${resp.status_code}    200
    ${element}=    Parse XML    ${resp.content}
    Log Element    ${element}
    Should Be Equal    ${element.tag}    resource
    Element Should Exist    ${element}    tag[@name="number_images"]
    Element Should Exist    ${element}    tag[@name="number_images_user"]
    Element Should Exist    ${element}    tag[@name="number_tags"]
    Element Should Exist    ${element}    tag[@name="number_gobs"]
    Element Attribute Should Be    ${element}    uri    /usage/stats
    ${count}=    Get Element Count    ${element}    tag
    Should Be Equal As Integers    ${count}    4

Get Usage Uploads Stats
    [Tags]    api    smoke
    ${resp}=    Get Request    bisque    /usage/uploads
    Log    ${resp.content}
    Should Be Equal As Integers    ${resp.status_code}    200
    ${element}=    Parse XML    ${resp.content}
    Log Element    ${element}
    Should Be Equal    ${element.tag}    resource
    Element Should Exist    ${element}    tag[@name="counts"]
    Element Should Exist    ${element}    tag[@name="days"]
    Element Attribute Should Be    ${element}    uri    /usage/uploads
    ${count}=    Get Element Count    ${element}    tag
    Should Be Equal As Integers    ${count}    2

Get Usage Analysis Stats
    [Tags]    api    smoke
    ${resp}=    Get Request    bisque    /usage/analysis
    Log    ${resp.content}
    Should Be Equal As Integers    ${resp.status_code}    200
    ${element}=    Parse XML    ${resp.content}
    Log Element    ${element}
    Should Be Equal    ${element.tag}    resource
    Element Should Exist    ${element}    tag[@name="counts"]
    Element Should Exist    ${element}    tag[@name="days"]
    Element Attribute Should Be    ${element}    uri    /usage/analysis
    ${count}=    Get Element Count    ${element}    tag
    Should Be Equal As Integers    ${count}    2