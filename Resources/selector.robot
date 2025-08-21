*** Settings ***
Library  SeleniumLibrary
Variables  ../PageObjects/login.py
Library  OperatingSystem

*** Keywords ***
Launch Application
    [Arguments]     ${url}  ${browser}
    Run Keyword If    '${url}' != '' and '${browser}' != ''    Open Browser    ${url}  ${browser}
    maximize browser window

Launch Page For Automation
    [Arguments]     ${user}     ${pass}  ${com}     ${mobile}   ${country}  ${crush}  ${fname} ${lname}   ${date}
    Run Keyword And Continue On Failure     input text  ${username}     ${user}
    Run Keyword And Continue On Failure     input text  ${password}     ${pass}
    Run Keyword And Continue On Failure     input text  ${company}     ${com}
    Run Keyword And Continue On Failure     input text  ${mobile}     ${mobile}
    Run Keyword And Continue On Failure     input text  ${country}     ${country}
    Run Keyword And Continue On Failure     click button    ${btn}
    Run Keyword And Continue On Failure     input text  ${first_crush}     ${crush}
    Run Keyword And Continue On Failure     input text  ${firstname}     ${fname}
    Run Keyword And Continue On Failure     input text  ${lastname}     ${lname}
    Run Keyword And Continue On Failure     click link  ${link}
    select from list by value       opel    Opel
    Run Keyword And Continue On Failure     input text   ${date}     ${date}
    ${list}=get Webelements     ${table}
    FOR  ${el}  IN  @{list}
    ${text}=    Get Text   ${el}
    Log To Console    ${text}
    Append To File   ${OUTPUT_FILE}    ${text}\n
    END

create log file
    Run Keyword And Ignore Error    remove file   ${log_file}
    ${log_file}=    Set Variable    C:/Users/srini.SRINIKAMALI/PycharmProjects/Robot Framework-Automation/TestCases/log_steps.txt
    Run Keyword If    '${log_file}' != ''    Create File    ${log_file}
