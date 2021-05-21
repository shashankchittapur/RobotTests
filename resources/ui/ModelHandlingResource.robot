*** Settings ***
Library    Remote    http://127.0.0.1:8170/swing  WITH NAME    SwingRobot
Library    String  
Library    BuiltIn    
Variables    ../../variables/ui/ContextNames.py    
Variables    ../../variables/ui/UIComponentNames.py


*** Variables ***
${SafFilesTableIndex}    0

*** Keywords ***
Open Model From File Chooser
    [Documentation]    Opens a given model by selecting file from the file chooser
    [Arguments]    ${IFCFileName}
    Select Main Window
    Context Should Be Solibri
    Button Should Be Enabled    ${Button_Open_Title}
    Button Should Be Disabled    ${Button_AddModels_Title} 
    Push Button  ${Button_Open_Title}
    Select Dialog    ${FileChooser_OpenModels_Title}
    ${rowCount}    Get Table Row Count    ${SafFilesTableIndex} 
    FOR    ${index}    IN RANGE   ${rowCount}
        ${fileName}    Get Table Cell Value    ${SafFilesTableIndex}    ${index}    0   
        Exit For Loop If    '${fileName}' == '${IFCFileName}'          
    END

    Click On Table Cell    0    ${index}    0 
    Table Cell Should Be Selected    0    ${index}    0
    Push Button  3
    
Context Should Be Solibri
    ${context}    Get Current Context
    Should Contain    ${context}     ${ApplicationFrameTitle}    msg="Invalid Context"
           
    