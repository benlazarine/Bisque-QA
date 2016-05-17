*** Settings ***
Suite Setup       Create Session    bisque    http://${WebHost}
Force Tags        BISQUE-29
Resource          ../Bisque_Resources.robot
Library           XML
Library           RequestsLibrary

*** Test Cases ***
Get features
    [Tags]    api    smoke
    ${resp}=    Get Request    bisque    /features/
    Log    ${resp}
    Should Be Equal As Strings    ${resp.status_code}    200
    Log    ${resp.content}
    Should Contain    ${resp.content}    <resource uri="http://host/features">
    Should Contain    ${resp.content}    <command name="FEATURE_NAME" value="Documentation of specific feature"/>

Get features/list
    [Tags]    api    smoke
    ${resp}=    Get Request    bisque    /features/list
    Log    ${resp}
    Should Be Equal As Strings    ${resp.status_code}    200
    Log    ${resp.content}
    Should Contain    ${resp.content}    <resource uri="http://host/features/list" description="List of available features">
    Should Contain    ${resp.content}    <library name="OpenCV">

Get features/CLD
    [Tags]    api    smoke
    ${resp}=    Get Request    bisque    /features/CLD
    Log    ${resp}
    Should Be Equal As Strings    ${resp.status_code}    200
    Log    ${resp.content}
    Should Contain    ${resp.content}    <resource uri="http://host/features/CLD">
    Should Contain    ${resp.content}    <feature name="CLD">

Get features/formats
    [Tags]    api    smoke
    ${resp}=    Get Request    bisque    /features/formats
    Log    ${resp}
    Should Be Equal As Strings    ${resp.status_code}    200
    Log    ${resp.content}
    Should Contain    ${resp.content}    <resource uri="http://host/features/formats" description="List of Return Formats">
    Should Contain    ${resp.content}    <format name="xml" permission="Published" uri="features/format/xml"/>
    Should Contain    ${resp.content}    <format name="hdf" permission="Published" uri="features/format/hdf"/>
    Should Contain    ${resp.content}    <format name="csv" permission="Published" uri="features/format/csv"/>
    Should Contain    ${resp.content}    </resource>

Get features/formats/xml
    [Tags]    api    smoke
    ${resp}=    Get Request    bisque    /features/formats/xml
    Log    ${resp}
    Should Be Equal As Strings    ${resp.status_code}    200
    Log    ${resp.content}
    Should Contain    ${resp.content}    <resource uri="http://host/features/formats/xml">
    Should Contain    ${resp.content}    <format name="XML">
    Should Contain    ${resp.content}    <tag name="Name" value="XML"/>
    Should Contain    ${resp.content}    <tag name="content_type" value="text/xml"/>
    Should Contain    ${resp.content}    <tag name="Description" value="Extensible Markup Language"/>
    Should Contain    ${resp.content}    </format>
    Should Contain    ${resp.content}    </resource>

Get features/formats/csv
    [Tags]    api    smoke
    ${resp}=    Get Request    bisque    /features/formats/csv
    Log    ${resp}
    Should Be Equal As Strings    ${resp.status_code}    200
    Log    ${resp.content}
    Should Contain    ${resp.content}    <resource uri="http://host/features/formats/xml">
    Should Contain    ${resp.content}    <format name="CSV">
    Should Contain    ${resp.content}    <tag name="Name" value="CSV"/>
    Should Contain    ${resp.content}    <tag name="content_type" value="text/csv"/>
    Should Contain    ${resp.content}    <tag name="Description" value="Extensible Markup Language"/>
    Should Contain    ${resp.content}    </format>
    Should Contain    ${resp.content}    </resource>

