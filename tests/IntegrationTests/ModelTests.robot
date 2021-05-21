*** Settings ***
Library    Remote    http://127.0.0.1:8170/solibri
Library    Collections 
Library    Process   
Resource    ../CommonUtils.robot        


*** Variables ***
${DELETED_COLUMN}    2h3f6i7AP1qfBWnt_Yfiqx
*** Test Cases ***
Test Open update Save And Close Model  
    ${result}    Open Model        /Users/spacewell/eclipse-workspace/Solibri Robot Test POC/samples/ifc/Solibri Building.ifc
    ${status}    Does Component Exist    ${result}    ${DELETED_COLUMN}
    Should Be True      ${status}  
    ${result}    Update Model    ${result}    /Users/spacewell/eclipse-workspace/Solibri Robot Test POC/samples/ifc/Solibri_Building_Column_Delete.ifc   
    ${status}    Does Component Exist    ${result}    ${DELETED_COLUMN}
    Run Keyword If    '${status}'=='True'    Fail    msg=Component ${DELETED_COLUMN} is not required
    
    
