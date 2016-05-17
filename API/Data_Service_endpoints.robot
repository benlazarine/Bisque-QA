*** Settings ***
Resource          ../Bisque_Resources.robot
Library           XML
Library           RequestsLibrary
Suite Setup       Create Session    bisque    http://${WebHost}
Suite Teardown    Delete All Sessions

*** Test Cases ***
Get data_service
    [Tags]    api    smoke
    ${resp}=    Get Request    bisque    /data_service
    Log    ${resp}
    Should Be Equal As Strings    ${resp.status_code}    200
    Log    ${resp.content}
    Should Contain    ${resp.content}    <resource>
    Should Contain    ${resp.content}    <resource name="None" uri="/data_service/None"/>
    Should Contain    ${resp.content}    <resource name="dataset" uri="/data_service/dataset"/>
    Should Contain    ${resp.content}    <resource name="service" uri="/data_service/service"/>
    Should Contain    ${resp.content}    <resource name="template" uri="/data_service/template"/>
    Should Contain    ${resp.content}    <resource name="file" uri="/data_service/file"/>
    Should Contain    ${resp.content}    <resource name="user" uri="/data_service/user"/>
    Should Contain    ${resp.content}    <resource name="text" uri="/data_service/text"/>
    Should Contain    ${resp.content}    <resource name="image" uri="/data_service/image"/>
    Should Contain    ${resp.content}    <resource name="module" uri="/data_service/module"/>
    Should Contain    ${resp.content}    <resource name="system" uri="/data_service/system"/>
    Should Contain    ${resp.content}    <resource name="tag" uri="/data_service/tag"/>
    Should Contain    ${resp.content}    <resource name="mex" uri="/data_service/mex"/>
    Should Contain    ${resp.content}    </resource>

Get data_service/None
    [Tags]    api    smoke
    ${resp}=    Get Request    bisque    /data_service/None
    Log    ${resp}
    Should Be Equal As Strings    ${resp.status_code}    200
    Log    ${resp.content}
    Should Contain    ${resp.content}    <resource uri="/data_service/None?limit=1000000&amp;view=short"/>
    Comment    ${ParsedXML} =     Parse XML    ${resp.content}
    Comment    Log    ${ParsedXML}
    Comment    Should Be Equal    ${ParsedXML}    <Element 'resource' at 0xbd7ce0>

Get data_service/dataset
    [Tags]    api    smoke
    ${resp}=    Get Request    bisque    /data_service/dataset
    Log    ${resp}
    Should Be Equal As Strings    ${resp.status_code}    200
    Log    ${resp.content}
    Should Contain    ${resp.content}    <resource uri="/data_service/dataset?limit=1000000&amp;view=short">
    Comment    ${ParsedXML} =     Parse XML    ${resp.content}
    Comment    Log    ${ParsedXML}
    Comment    Should Be Equal    ${ParsedXML}    <Element 'resource' at 0xbd7ce0>

Get /data_service/dataset/:uniq_id
    [Tags]    api    functional
    ${resp}=    Get Request    bisque    /data_service/dataset/00-vY5GZWGpyF6hYfrihNaGsb
    Log    ${resp.content}
    Should Be Equal As Strings    ${resp.status_code}    200
    Should Contain    ${resp.content}    created="2015-09-17T09:31:18.415743"
    Should Contain    ${resp.content}    name="Adam12"
    Should Contain    ${resp.content}    owner="http://${WebHost}/data_service/00-sFwDBSAicRgZuZGGpBisFD"
    Should Contain    ${resp.content}    permission="published"
    Should Contain    ${resp.content}    resource_uniq="00-vY5GZWGpyF6hYfrihNaGsb"
    Should Contain    ${resp.content}    ts="2015-09-18T08:48:51.106028"
    Should Contain    ${resp.content}    uri="http://${WebHost}/data_service/00-vY5GZWGpyF6hYfrihNaGsb"/>

Get data_service/service
    [Tags]    api    smoke
    ${resp}=    Get Request    bisque    /data_service/service
    Log    ${resp}
    Should Be Equal As Strings    ${resp.status_code}    200
    Log    ${resp.content}
    Should Contain    ${resp.content}    <resource uri="/data_service/service?limit=1000000&amp;view=short">
    Comment    ${ParsedXML} =     Parse XML    ${resp.content}
    Comment    Log    ${ParsedXML}
    Comment    Should Be Equal    ${ParsedXML}    <Element 'resource' at 0xbd7ce0>

Get /data_service/service/:uniq_id
    [Tags]    api    functional
    ${resp}=    Get Request    bisque    /data_service/service/00-C5sn6yYD6kAxdAPCJvT2GF
    Log    ${resp.content}
    Should Be Equal As Strings    ${resp.status_code}    200
    Should Contain    ${resp.content}    name="SeedSize"
    Should Contain    ${resp.content}    owner="http://${WebHost}/data_service/00-k528Xue2xk9noJ7HGUu9PQ"
    Should Contain    ${resp.content}    permission="published"
    Should Contain    ${resp.content}    resource_uniq="00-C5sn6yYD6kAxdAPCJvT2GF"
    Should Contain    ${resp.content}    ts="2012-08-22T20:49:47.075256"
    Should Contain    ${resp.content}    type="http://bovary.iplantcollaborative.org/data_service/module/82772"
    Should Contain    ${resp.content}    uri="http://${WebHost}/data_service/00-C5sn6yYD6kAxdAPCJvT2GF"
    Should Contain    ${resp.content}    value="http://localhost:11000/engine_service/SeedSize"

Get data_service/template
    [Tags]    api    smoke
    ${resp}=    Get Request    bisque    /data_service/template
    Log    ${resp}
    Should Be Equal As Strings    ${resp.status_code}    200
    Log    ${resp.content}
    Should Contain    ${resp.content}    <resource uri="/data_service/template?limit=1000000&amp;view=short">
    Should Contain    ${resp.content}    <template created="2014-12-03T14:29:07.093690"
    Should Contain    ${resp.content}    name="Multiphoton Images"
    Should Contain    ${resp.content}    owner="http://${WebHost}/data_service/00-5hLKa2VYK5jY7tTHHDFkXL"
    Should Contain    ${resp.content}    permission="published" resource_uniq="00-iDKjwvSwsQxSZkAT57v7d5"
    Should Contain    ${resp.content}    ts="2014-12-04T14:12:47.957171"
    Should Contain    ${resp.content}    uri="http://${WebHost}/data_service/00-iDKjwvSwsQxSZkAT57v7d5"/>
    Should Contain    ${resp.content}    </resource>
    Comment    ${ParsedXML} =     Parse XML    ${resp.content}
    Comment    Log    ${ParsedXML}
    Comment    Should Be Equal    ${ParsedXML}    <Element 'resource' at 0xbd7ce0>

Get /data_service/template/:uniq_id
    [Tags]    api    functional
    ${resp}=    Get Request    bisque    /data_service/template/00-iDKjwvSwsQxSZkAT57v7d5
    Log    ${resp.content}
    Should Be Equal As Strings    ${resp.status_code}    200
    Should Contain    ${resp.content}    created="2014-12-03T14:29:07.093690"
    Should Contain    ${resp.content}    name="Multiphoton Images"
    Should Contain    ${resp.content}    owner="http://${WebHost}/data_service/00-5hLKa2VYK5jY7tTHHDFkXL"
    Should Contain    ${resp.content}    permission="published"
    Should Contain    ${resp.content}    resource_uniq="00-iDKjwvSwsQxSZkAT57v7d5"
    Should Contain    ${resp.content}    ts="2014-12-04T14:12:47.957171"
    Should Contain    ${resp.content}    uri="http://${WebHost}/data_service/00-iDKjwvSwsQxSZkAT57v7d5"

Get data_service/user
    [Tags]    api    smoke
    ${resp}=    Get Request    bisque    /data_service/user
    Log    ${resp}
    Should Be Equal As Strings    ${resp.status_code}    200
    Log    ${resp.content}
    Should Contain    ${resp.content}    <resource uri="/data_service/user?limit=1000000&amp;view=short">
    Should Contain    ${resp.content}    <user name="admin"
    Should Contain    ${resp.content}    owner="http://${WebHost}/data_service/00-k528Xue2xk9noJ7HGUu9PQ"
    Should Contain    ${resp.content}    permission="published" resource_uniq="00-k528Xue2xk9noJ7HGUu9PQ"
    Should Contain    ${resp.content}    ts="2010-12-22T16:42:50.289423"
    Should Contain    ${resp.content}    uri="http://${WebHost}/data_service/00-k528Xue2xk9noJ7HGUu9PQ"
    Should Contain    ${resp.content}    value="bisque-admin@iplantcollaborative.org"/>
    Should Contain    ${resp.content}    </resource>
    Comment    ${ParsedXML} =     Parse XML    ${resp.content}
    Comment    Log    ${ParsedXML}
    Comment    Should Be Equal    ${ParsedXML}    <Element 'resource' at 0xbd7ce0>

Get /data_service/user/:uniq_id
    [Tags]    api    functional
    ${resp}=    Get Request    bisque    /data_service/user/00-k528Xue2xk9noJ7HGUu9PQ
    Log    ${resp.content}
    Should Be Equal As Strings    ${resp.status_code}    200
    Should Contain    ${resp.content}    name="admin"
    Should Contain    ${resp.content}    owner="http://${WebHost}/data_service/00-k528Xue2xk9noJ7HGUu9PQ"
    Should Contain    ${resp.content}    permission="published"
    Should Contain    ${resp.content}    resource_uniq="00-k528Xue2xk9noJ7HGUu9PQ"
    Should Contain    ${resp.content}    ts="2010-12-22T16:42:50.289423"
    Should Contain    ${resp.content}    value="bisque-admin@iplantcollaborative.org"
    Should Contain    ${resp.content}    uri="http://${WebHost}/data_service/00-k528Xue2xk9noJ7HGUu9PQ"

Get data_service/file
    [Tags]    api    smoke
    ${resp}=    Get Request    bisque    /data_service/file
    Log    ${resp}
    Should Be Equal As Strings    ${resp.status_code}    200
    Log    ${resp.content}
    Should Contain    ${resp.content}    <resource uri="/data_service/file?limit=1000000&amp;view=short">
    Should Contain    ${resp.content}    <file name="retina.ome.tif.bix"
    Should Contain    ${resp.content}    owner="http://${WebHost}/data_service/00-NXad6yat74p9HsWgvZT2Ji"
    Should Contain    ${resp.content}    permission="published" resource_uniq="00-iupLaux9G4K3fbbeBVqFrk"
    Should Contain    ${resp.content}    ts="2011-01-13T12:36:35.632307"
    Should Contain    ${resp.content}    uri="http://${WebHost}/data_service/00-iupLaux9G4K3fbbeBVqFrk"
    Should Contain    ${resp.content}    value="0/5"/>
    Should Contain    ${resp.content}    </resource>
    Comment    ${ParsedXML} =     Parse XML    ${resp.content}
    Comment    Log    ${ParsedXML}
    Comment    Should Be Equal    ${ParsedXML}    <Element 'resource' at 0xbd7ce0>

Get /data_service/file/:uniq_id
    [Tags]    api    functional
    ${resp}=    Get Request    bisque    /data_service/file/00-iupLaux9G4K3fbbeBVqFrk
    Log    ${resp.content}
    Should Be Equal As Strings    ${resp.status_code}    200
    Should Contain    ${resp.content}    name="retina.ome.tif.bix"
    Should Contain    ${resp.content}    owner="http://${WebHost}/data_service/00-NXad6yat74p9HsWgvZT2Ji"
    Should Contain    ${resp.content}    permission="published"
    Should Contain    ${resp.content}    resource_uniq="00-iupLaux9G4K3fbbeBVqFrk"
    Should Contain    ${resp.content}    ts="2011-01-13T12:36:35.632307"
    Should Contain    ${resp.content}    uri="http://${WebHost}/data_service/00-iupLaux9G4K3fbbeBVqFrk"
    Should Contain    ${resp.content}    value="0/5"

Get data_service/text
    [Tags]    api    smoke
    ${resp}=    Get Request    bisque    /data_service/text
    Log    ${resp}
    Should Be Equal As Strings    ${resp.status_code}    200
    Log    ${resp.content}
    Should Contain    ${resp.content}    <resource uri="/data_service/text?limit=1000000&amp;view=short">
    Should Contain    ${resp.content}    <resource created="2015-08-11T04:09:45.683665"
    Should Contain    ${resp.content}    name="rdfXmlLog_2015-08-07-173413.txt"
    Should Contain    ${resp.content}    owner="http://${WebHost}/data_service/00-C8G7pULZaGZ6qcFkUA8M7Z"
    Should Contain    ${resp.content}    permission="published" resource_type="text"
    Should Contain    ${resp.content}    resource_uniq="00-bdntPsq4UbMmYqeNGsmvNX"
    Should Contain    ${resp.content}    ts="2015-08-11T04:09:45.683665"
    Should Contain    ${resp.content}    uri="http://${WebHost}/data_service/00-bdntPsq4UbMmYqeNGsmvNX"
    Should Contain    ${resp.content}    value="irods://data.iplantcollaborative.org/iplant/home/shared/NEVP/HUH/2015-08-07-173413/rdfXmlLog_2015-08-07-173413.txt"/>
    Should Contain    ${resp.content}    </resource>
    Comment    ${ParsedXML} =     Parse XML    ${resp.content}
    Comment    Log    ${ParsedXML}
    Comment    Should Be Equal    ${ParsedXML}    <Element 'resource' at 0xbd7ce0>

Get /data_service/text/:uniq_id
    [Tags]    api    functional
    ${resp}=    Get Request    bisque    /data_service/text/00-bdntPsq4UbMmYqeNGsmvNX
    Log    ${resp.content}
    Should Be Equal As Strings    ${resp.status_code}    200
    Should Contain    ${resp.content}    created="2015-08-11T04:09:45.683665"
    Should Contain    ${resp.content}    name="rdfXmlLog_2015-08-07-173413.txt"
    Should Contain    ${resp.content}    owner="http://${WebHost}/data_service/00-C8G7pULZaGZ6qcFkUA8M7Z"
    Should Contain    ${resp.content}    permission="published"
    Should Contain    ${resp.content}    resource_type="text"
    Should Contain    ${resp.content}    resource_uniq="00-bdntPsq4UbMmYqeNGsmvNX"
    Should Contain    ${resp.content}    ts="2015-08-11T04:09:45.683665"
    Should Contain    ${resp.content}    uri="http://${WebHost}/data_service/00-bdntPsq4UbMmYqeNGsmvNX"
    Should Contain    ${resp.content}    value="irods://data.iplantcollaborative.org/iplant/home/shared/NEVP/HUH/2015-08-07-173413/rdfXmlLog_2015-08-07-173413.txt"

Get data_service/image
    [Tags]    api    smoke    skipped
    ${resp}=    Get Request    bisque    /data_service/image
    Log    ${resp}
    Should Be Equal As Strings    ${resp.status_code}    200
    Log    ${resp.content}
    Should Contain    ${resp.content}    <resource uri="/data_service/file?limit=1000000&amp;view=short">
    Should Contain    ${resp.content}    <resource created="2015-08-11T04:09:45.683665"
    Should Contain    ${resp.content}    name="rdfXmlLog_2015-08-07-173413.txt"
    Should Contain    ${resp.content}    owner="http://${WebHost}/data_service/00-C8G7pULZaGZ6qcFkUA8M7Z"
    Should Contain    ${resp.content}    permission="published" resource_type="text"
    Should Contain    ${resp.content}    resource_uniq="00-bdntPsq4UbMmYqeNGsmvNX"
    Should Contain    ${resp.content}    ts="2015-08-11T04:09:45.683665"
    Should Contain    ${resp.content}    uri="http://${WebHost}/data_service/00-bdntPsq4UbMmYqeNGsmvNX"
    Should Contain    ${resp.content}    value="irods://data.iplantcollaborative.org/iplant/home/shared/NEVP/HUH/2015-08-07-173413/rdfXmlLog_2015-08-07-173413.txt"/>
    Should Contain    ${resp.content}    </resource>
    Comment    ${ParsedXML} =     Parse XML    ${resp.content}
    Comment    Log    ${ParsedXML}
    Comment    Should Be Equal    ${ParsedXML}    <Element 'resource' at 0xbd7ce0>

Get data_service/module
    [Tags]    api    smoke
    ${resp}=    Get Request    bisque    /data_service/module
    Log    ${resp}
    Should Be Equal As Strings    ${resp.status_code}    200
    Log    ${resp.content}
    Should Contain    ${resp.content}    <resource uri="/data_service/module?limit=1000000&amp;view=short">
    Should Contain    ${resp.content}    <module name="SeedSize"
    Should Contain    ${resp.content}    owner="http://${WebHost}/data_service/00-k528Xue2xk9noJ7HGUu9PQ"
    Should Contain    ${resp.content}    permission="published" resource_uniq="00-dmNDqaeFwtHdaXX6BT3vfh"
    Should Contain    ${resp.content}    ts="2015-10-20T21:49:16.428009" type="runtime"
    Should Contain    ${resp.content}    uri="http://${WebHost}/data_service/00-dmNDqaeFwtHdaXX6BT3vfh"
    Should Contain    ${resp.content}    value=""/>
    Should Contain    ${resp.content}    </resource>
    Comment    ${ParsedXML} =     Parse XML    ${resp.content}
    Comment    Log    ${ParsedXML}
    Comment    Should Be Equal    ${ParsedXML}    <Element 'resource' at 0xbd7ce0>

Get /data_service/module/:uniq_id
    [Tags]    api    functional
    ${resp}=    Get Request    bisque    /data_service/module/00-dmNDqaeFwtHdaXX6BT3vfh
    Log    ${resp.content}
    Should Be Equal As Strings    ${resp.status_code}    200
    Should Contain    ${resp.content}    name="SeedSize"
    Should Contain    ${resp.content}    owner="http://${WebHost}/data_service/00-k528Xue2xk9noJ7HGUu9PQ"
    Should Contain    ${resp.content}    permission="published"
    Should Contain    ${resp.content}    resource_uniq="00-dmNDqaeFwtHdaXX6BT3vfh"
    Should Contain    ${resp.content}    ts="2015-10-20T21:49:16.428009"
    Should Contain    ${resp.content}    type="runtime"
    Should Contain    ${resp.content}    uri="http://${WebHost}/data_service/00-dmNDqaeFwtHdaXX6BT3vfh"
    Should Contain    ${resp.content}    value=""

Get data_service/system
    [Tags]    api    smoke
    ${resp}=    Get Request    bisque    /data_service/system
    Log    ${resp}
    Should Be Equal As Strings    ${resp.status_code}    200
    Log    ${resp.content}
    Should Contain    ${resp.content}    <resource uri="/data_service/system?limit=1000000&amp;view=short">
    Should Contain    ${resp.content}    <system created="2015-08-04T12:24:49.625146" name="system"
    Should Contain    ${resp.content}    owner="http://${WebHost}/data_service/00-k528Xue2xk9noJ7HGUu9PQ"
    Should Contain    ${resp.content}    permission="published" resource_uniq="00-fSyR9mFkRDuPnbY9NsWnaB"
    Should Contain    ${resp.content}    ts="
    Should Contain    ${resp.content}    uri="http://${WebHost}/data_service/00-fSyR9mFkRDuPnbY9NsWnaB"/>
    Should Contain    ${resp.content}    </resource>
    Comment    ${ParsedXML} =     Parse XML    ${resp.content}
    Comment    Log    ${ParsedXML}
    Comment    Should Be Equal    ${ParsedXML}    <Element 'resource' at 0xbd7ce0>

Get /data_service/system/:uniq_id
    [Tags]    api    functional
    ${resp}=    Get Request    bisque    /data_service/system/00-fSyR9mFkRDuPnbY9NsWnaB
    Log    ${resp.content}
    Should Be Equal As Strings    ${resp.status_code}    200
    Should Contain    ${resp.content}    created="2015-08-04T12:24:49.625146"
    Should Contain    ${resp.content}    name="system"
    Should Contain    ${resp.content}    owner="http://${WebHost}/data_service/00-k528Xue2xk9noJ7HGUu9PQ"
    Should Contain    ${resp.content}    permission="published"
    Should Contain    ${resp.content}    resource_uniq="00-fSyR9mFkRDuPnbY9NsWnaB"
    Should Contain    ${resp.content}    ts="
    Should Contain    ${resp.content}    uri="http://${WebHost}/data_service/00-fSyR9mFkRDuPnbY9NsWnaB"

Get data_service/tag
    [Tags]    api    smoke
    ${resp}=    Get Request    bisque    /data_service/tag
    Log    ${resp}
    Should Be Equal As Strings    ${resp.status_code}    200
    Log    ${resp.content}
    Should Contain    ${resp.content}    <resource uri="/data_service/tag?limit=1000000&amp;view=short">
    Should Contain    ${resp.content}    <tag name="members"
    Should Contain    ${resp.content}    owner="http://${WebHost}/data_service/00-k528Xue2xk9noJ7HGUu9PQ"
    Should Contain    ${resp.content}    permission="published" resource_uniq="00-KzESF9iTZAfagisPhYxPq5"
    Should Contain    ${resp.content}    ts="2012-05-17T23:31:16.627541"
    Should Contain    ${resp.content}    uri="http://${WebHost}/data_service/00-KzESF9iTZAfagisPhYxPq5"/>
    Should Contain    ${resp.content}    </resource>
    Comment    ${ParsedXML} =     Parse XML    ${resp.content}
    Comment    Log    ${ParsedXML}
    Comment    Should Be Equal    ${ParsedXML}    <Element 'resource' at 0xbd7ce0>

Get /data_service/tag/:uniq_id
    [Tags]    api    functional
    ${resp}=    Get Request    bisque    /data_service/tag/00-KzESF9iTZAfagisPhYxPq5
    Log    ${resp.content}
    Should Be Equal As Strings    ${resp.status_code}    200
    Should Contain    ${resp.content}    name="members"
    Should Contain    ${resp.content}    owner="http://${WebHost}/data_service/00-k528Xue2xk9noJ7HGUu9PQ"
    Should Contain    ${resp.content}    permission="published"
    Should Contain    ${resp.content}    resource_uniq="00-KzESF9iTZAfagisPhYxPq5"
    Should Contain    ${resp.content}    ts="2012-05-17T23:31:16.627541"
    Should Contain    ${resp.content}    uri="http://${WebHost}/data_service/00-KzESF9iTZAfagisPhYxPq5"

Get data_service/mex
    [Tags]    api    smoke
    ${resp}=    Get Request    bisque    /data_service/mex
    Log    ${resp}
    Should Be Equal As Strings    ${resp.status_code}    200
    Log    ${resp.content}
    Should Contain    ${resp.content}    <resource uri="/data_service/mex?limit=1000000&amp;view=short">
    Should Contain    ${resp.content}    <mex created="2012-09-11T12:26:31.006207" name="SeedSize"
    Should Contain    ${resp.content}    owner="http://${WebHost}/data_service/00-zsVMDaGVLAkbPtVtM5WiZ9"
    Should Contain    ${resp.content}    permission="published" resource_uniq="00-ufDCkJ6EXAgxxxcN29onY4"
    Should Contain    ${resp.content}    ts="2013-07-05T10:18:18.537639"
    Should Contain    ${resp.content}    type="http://bovary.iplantcollaborative.org/data_service/module/82772"
    Should Contain    ${resp.content}    uri="http://${WebHost}/data_service/00-ufDCkJ6EXAgxxxcN29onY4"
    Should Contain    ${resp.content}    value="FINISHED"/>
    Should Contain    ${resp.content}    </resource>
    Comment    ${ParsedXML} =     Parse XML    ${resp.content}
    Comment    Log    ${ParsedXML}
    Comment    Should Be Equal    ${ParsedXML}    <Element 'resource' at 0xbd7ce0>

Get /data_service/mex/:uniq_id
    [Tags]    api    functional
    ${resp}=    Get Request    bisque    /data_service/mex/00-ufDCkJ6EXAgxxxcN29onY4
    Log    ${resp.content}
    Should Be Equal As Strings    ${resp.status_code}    200
    Should Contain    ${resp.content}    created="2012-09-11T12:26:31.006207"
    Should Contain    ${resp.content}    name="SeedSize"
    Should Contain    ${resp.content}    owner="http://${WebHost}/data_service/00-zsVMDaGVLAkbPtVtM5WiZ9"
    Should Contain    ${resp.content}    permission="published"
    Should Contain    ${resp.content}    resource_uniq="00-ufDCkJ6EXAgxxxcN29onY4"
    Should Contain    ${resp.content}    ts="2013-07-05T10:18:18.537639"
    Should Contain    ${resp.content}    type="http://bovary.iplantcollaborative.org/data_service/module/82772"
    Should Contain    ${resp.content}    uri="http://${WebHost}/data_service/00-ufDCkJ6EXAgxxxcN29onY4"
    Should Contain    ${resp.content}    value="FINISHED"

