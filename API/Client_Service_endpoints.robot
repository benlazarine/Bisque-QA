*** Settings ***
Resource          ../Bisque_Resources.robot
Library           XML
Library           RequestsLibrary
Suite Setup       Create Session    bisque    http://${WebHost}

*** Test Cases ***
Get client_service
    [Tags]    api    smoke
    ${resp}=    Get Request    bisque    /client_service/
    Log    ${resp}
    Should Be Equal As Strings    ${resp.status_code}    200
    Log    ${resp.content}
    Should Contain    ${resp.content}    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0
    Should Contain    ${resp.content}    Bisque: Welcome to the Bisque database

Upload battery_icon.png file
    [Tags]    api    smoke    skipped
    Set Test Variable    ${FileName}    ${BaseDir}/iPlant-TestData/Bisque/battery_icon.png
    ${data} =    Set Variable    {"f1": "${FileName}"}
    ${resp}=    Put Request    bisque    /client_service/upload_images    data=${data}
    Log    ${resp}
    Should Be Equal As Strings    ${resp.status_code}    200
    Log    ${resp.content}
    Should Not Contain    ${resp.content}    rror
    Should Contain    ${resp.content}    <resource type="uploaded">
    Comment    [Tags]    api    smoke
    Comment    Set Test Variable    ${FileName}    ${BaseDir}/iPlant-TestData/Bisque/battery_icon.png
    Comment    ${output} =     Run    curl -s -u ${UserName}:${Password} -F f1=@${FileName} http://${WebHost}/client_service/upload_images
    Comment    Log    ${output}
    Comment    Should Not Contain    ${output}    rror
    Comment    Should Contain    ${output}    <resource type="uploaded" >
