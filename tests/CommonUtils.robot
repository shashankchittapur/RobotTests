*** Settings ***
Library    Collections    
Library    String    

*** Keywords ***
Convert String To Dictionary 
    [Arguments]    ${result}
    ${split_strings}    Split String    ${result}    separator=\,
    Log To Console    ${split_strings}    