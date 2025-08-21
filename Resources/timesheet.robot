*** Settings ***
Library  SeleniumLibrary
Variables  ../PageObjects/login.py
Library  OperatingSystem

*** Keywords ***
Launch Application
    [Arguments]     ${url}  ${browser}
    Run Keyword If    '${url}' != '' and '${browser}' != ''    Open Browser    ${url}  ${browser}
    maximize browser window

Perform Login
    [Arguments]     ${user}     ${pass}
    Run Keyword And Continue On Failure     input text  ${username}     ${user}
    Run Keyword And Continue On Failure     input text  ${password}     ${pass}
    Run Keyword And Continue On Failure     click button    ${login_btn}

Timesheet entry record check
    capture page screenshot     ../results/login.png
    click link  ${time_btn}
    Wait Until Element Is Visible    ${timesheet_count}    20s
    ${get_timesheet}=   Get WebElements   ${timesheet_count}
    FOR  ${el}  IN  @{get_timesheet}
    ${text}=    Get Text   ${el}
    Log To Console    ${text}
    Append To File   ${OUTPUT_FILE}    ${text}\n
    END

TimeEntry punch IN
    Run Keyword And Continue On Failure     click link  ${time_btn}
    wait until element is visible    ${attenance_drop}    15s
    Run Keyword And Continue On Failure     click element  ${attenance_drop}
    wait until element is visible   ${select_dropdown}     10s
    Run Keyword And Continue On Failure     click element   ${select_dropdown}
    wait until element is visible   ${date}     15s
    #clear element text  ${date}
    [arguments]  ${datevalue}   ${intimevalue}    ${textvalue}
    input text  ${date}     ${datevalue}
    clear element text  ${time}
    input text  ${time}     ${intimevalue}
    input text   ${text_area}   ${textvalue}
    wait until element is visible  ${in_btn}   15s
    sleep   5s
    click button    ${in_btn}

TimeEntry punch OUT
    wait until element is visible   ${date}     15s
    clear element text  ${date}
    [arguments]  ${outdatevalue}   ${outtimevalue}    ${textvalue}
    input text  ${date}     ${outdatevalue}
    wait until element is visible   ${date}     10s
    clear element text  ${time}
    input text  ${time}     ${outtimevalue}
    input text   ${text_area}   ${textvalue}
    wait until element is visible  ${out_btn}   15s
    click button    ${out_btn}


create log file
    Run Keyword And Ignore Error    remove file   ${log_file}
    ${log_file}=    Set Variable    C:/Users/srini.SRINIKAMALI/PycharmProjects/Robot Framework-Automation/TestCases/log_steps.txt
    Run Keyword If    '${log_file}' != ''    Create File    ${log_file}