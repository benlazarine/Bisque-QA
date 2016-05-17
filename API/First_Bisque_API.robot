*** Settings ***
Documentation     Docs
...
...               multi-line
Suite Setup       SuiteSetup    # SS-Comment
Suite Teardown    SuiteTeardown    # ST-Comment
Test Setup        TestSetup    # TS-Comment
Test Teardown     TestTeardown    # TT-Comment
Force Tags        ForcedTags
Default Tags      DefaultTags
Test Template     TestTemplate    # TestTemplateComment
Test Timeout      10 seconds    # TestTimeoutComment
Metadata          AddMetadata    AddMetadataValue    # AddMetadataComment
Resource          ../Bisque_Resources.robot
Library           XML
Library           RequestsLibrary
Variables         ../README.txt    VariablesArgs    # VariablesComment

*** Variables ***
${AddScalar}      AddScalarValue    # AddScalarComment
&{AddDict}        Value1    Value2    Value3    Value4    Value5    # AddDictComment

*** Test Cases ***
Get bisquik/upload_files
    [Tags]    api    smoke    skipped
    ${output} =    Run    curl -s -u ${UserName}:${Password} -F f1=@/etc/passwd -F f1=@/etc/group http://${WebHost}/bisquik/upload_files
    Log    ${output}
    ${ParsedXML} =    Parse XML    ${output}
    Log    ${ParsedXML}

Get data_service/None
    [Tags]    api    smoke
    Create Session    bisque    http://${WebHost}
    ${resp}=    Get Request    bisque    /data_service/None
    Log    ${resp}
    Should Be Equal As Strings    ${resp.status_code}    200
    Log    ${resp.content}
    Should Contain    ${resp.content}    <resource uri="/data_service/None?limit=1000000&amp;view=short"/>

Get data_service/None - org
    [Tags]    api    smoke    skipped
    ${output} =    Run    curl -s http://${WebHost}/data_service/None | tidy -xml -i -q
    Log    ${output}
    Should Contain    ${output}    <resource uri="/data_service/None?limit=1000000&amp;view=short" />
    ${ParsedXML} =    Parse XML    ${output}
    Log    ${ParsedXML}
    Comment    Should Be Equal    ${ParsedXML}    resource
