*** Settings ***
Resource          resource.robot


Test Setup      Open Browser to application page
Test Teardown   Close Browser
*** Test Cases ***

Test string
    Check for Hello World in content 

Test number
    Check for 1337 in content
