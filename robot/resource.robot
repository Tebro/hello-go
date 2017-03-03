*** Settings ***
Library     Selenium2Library
Library     OperatingSystem

*** Variables ***
${URL}          http://%{APPLICATION_HOST}
${EMPTY}        nil

*** Keywords ***
Open Browser to application page
    ${SELENIUM_REMOTE_URL}=     Get Environment Variable     SELENIUM_REMOTE_URL     ${EMPTY}
#    Open Browser   ${URL}    remote_url=%{SELENIUM_REMOTE_URL}
    Run Keyword If   '${SELENIUM_REMOTE_URL}' == '${EMPTY}'   Open Browser   ${URL}
    Run Keyword Unless   '${SELENIUM_REMOTE_URL}' == '${EMPTY}'    Open Browser   ${URL}    remote_url=${SELENIUM_REMOTE_URL}

Check for Hello World in content
    Page Should Contain     Hello World


Check for 1337 in content
    Page Should Contain     1337

