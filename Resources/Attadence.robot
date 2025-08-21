*** Settings ***
Library  SeleniumLibrary
Variables  ../PageObjects/login.py
Library  OperatingSystem

*** Keywords ***
Launch Application with browser
    [Arguments]     ${url}  ${browser}
    Run Keyword If    '${url}' != '' and '${browser}' != ''    Open Browser    ${url}  ${browser}
    maximize browser window

Perform Login for employeee
    [Arguments]     ${user}     ${pass}
    Run Keyword And Continue On Failure     input text  ${username}     ${user}
    Run Keyword And Continue On Failure     input text  ${password}     ${pass}
    Run Keyword And Continue On Failure     click button    ${login_btn}
Find Employee attadence records
    Run Keyword And Continue On Failure     click link  ${time_btn}
    wait until element is visible    ${attenance_drop}    15s
    Run Keyword And Continue On Failure     click element  ${attenance_drop}
    wait until element is visible   ${emp_dropdown}     10s
    Run Keyword And Continue On Failure     click element   ${emp_dropdown}
    [Arguments]     ${empid}
    input text  ${emp_search}    ${empid}
    click element   ${emp_select}
    click button    ${view_btn}
    Wait Until Element Is Visible    ${table_log}    20s
    ${get_emplist}=   Get WebElements   ${table_log}
    FOR  ${el}  IN  @{get_emplist}
    ${text}=    Get Text   ${el}
    Log To Console    ${text}
    Append To File   ${OUTPUT_FILE_EMPID}    ${text}\n
    END