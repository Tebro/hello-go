*** Settings ***
Library     Selenium2Library

*** Variables ***
${URL}          http://%{APPLICATION_HOST}

*** Keywords ***
Open Browser to application page
    Open Browser   ${URL}    remote_url=%{SELENIUM_REMOTE_URL}

Check for Hello World in content
    Page Should Contain     Hello World


Check for 1337 in content
    Page Should Contain     1337

