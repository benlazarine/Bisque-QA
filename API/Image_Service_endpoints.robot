*** Settings ***
Resource          ../Bisque_Resources.robot
Library           XML
Library           RequestsLibrary
Suite Setup       Create Session    bisque    http://${WebHost}

*** Test Cases ***
Get image_service
    [Tags]    api    smoke
    ${resp}=    Get Request    bisque    /image_service/
    Log    ${resp}
    Should Be Equal As Strings    ${resp.status_code}    200
    Log    ${resp.content}
    Should Contain    ${resp.content}    <resource uri="/image_service">
    Should Contain    ${resp.content}    <method name="/image_service/operations" value="Returns a list of supported operations in XML"/>
    Should Contain    ${resp.content}    <method name="/image_service/formats" value="Returns a list of supported formats in XML"/>
    Should Contain    ${resp.content}    <method name="/image_service/ID" value="Returns a file for this ID"/>
    Should Contain    ${resp.content}    <method name="/image_service/ID?OPERATION1=PAR1&amp;OPERATION2=PAR2" value="Executes operations for give image ID. Call /operations to check available"/>
    Should Contain    ${resp.content}    <method name="/image_service/ID/OPERATION1:PAR1/OPERATION2:PAR2" value="Executes operations for give image ID. Call /operations to check available"/>
    Should Contain    ${resp.content}    <method name="/image_service/image/ID" value="same as /ID"/>
    Should Contain    ${resp.content}    <method name="/image_service/images/ID" value="same as /ID, deprecated and will be removed in the future"/>
    Should Contain    ${resp.content}    </resource>
    Comment    ${ParsedXML} =     Parse XML    ${resp.content}
    Comment    Log    ${ParsedXML}
    Comment    Should Be Equal    ${ParsedXML}    <Element 'resource' at 0xbd7ce0>

Get image_service/operations
    [Tags]    api    smoke
    ${resp}=    Get Request    bisque    /image_service/operations
    Log    ${resp}
    Should Be Equal As Strings    ${resp.status_code}    200
    Log    ${resp.content}
    Should Contain    ${resp.content}    <response>
    Should Contain    ${resp.content}    <operations uri="/image_service/operations">
    Should Contain    ${resp.content}    </operations>
    Should Contain    ${resp.content}    </response>
    Comment    ${ParsedXML} =     Parse XML    ${resp.content}
    Comment    Log    ${ParsedXML}
    Comment    Should Be Equal    ${ParsedXML}    <Element 'resource' at 0xbd7ce0>

Get image_service/formats
    [Tags]    api    smoke
    ${resp}=    Get Request    bisque    /image_service/formats
    Log    ${resp}
    Should Be Equal As Strings    ${resp.status_code}    200
    Log    ${resp.content}
    Should Contain    ${resp.content}    <resource uri="/images_service/formats">
    Should Contain    ${resp.content}    <format name="openslide" version="1.0.1">
    Should Contain    ${resp.content}    <format name="imgcnv" version="2.0.1">
    Should Contain    ${resp.content}    <format name="ImarisConvert" version="8.0.2">
    Should Contain    ${resp.content}    <format name="bioformats" version="5.1.1">
    Should Contain    ${resp.content}    </format>
    Should Contain    ${resp.content}    </resource>
    Comment    ${ParsedXML} =     Parse XML    ${resp.content}
    Comment    Log    ${ParsedXML}
    Comment    Should Be Equal    ${ParsedXML}    <Element 'resource' at 0xbd7ce0>

Get image_service/ID
    [Tags]    api    smoke    skipped
    ${output} =     Run    curl -s http://${WebHost}/image_service/ID
    Log    ${output}

Get image_service/image/ID
    [Tags]    api    smoke    skipped
    ${output} =     Run    curl -s http://${WebHost}/image_service/image/ID
    Log    ${output}

Get image_service/images/ID
    [Tags]    api    smoke    skipped
    ${output} =     Run    curl -s http://${WebHost}/image_service/images/ID
    Log    ${output}
