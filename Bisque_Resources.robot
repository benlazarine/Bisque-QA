*** Settings ***
Library           OperatingSystem

*** Variables ***
${LocalUser}      LocalUser
${BaseDir}        /Users/${LocalUser}/trunk
${WebHost}        bisque.iplantcollaborative.org
${BrowserAlias}    Bisque
${Browser}        ff
${GUIShortWait}    10s
${GUILongWait}    45s
${UserName}       ipctest
${Password}       ${EMPTY}
${FirstName}      Ipc
${LastName}       Test
${SShotBase}      selenium-screenshot
${SShotCount}     0
