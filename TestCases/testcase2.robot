*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/resources.robot
Library     ../PageObjects/data.py
Library     OperatingSystem

Suite Setup     log to console  create log file
Suite Teardown  log to console  close browser
Test Setup      log to console  Login To Application
Test Teardown   log to console  Logout application

*** Variables ***
${url}          https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${browser}      chrome
${file}         ${CURDIR}/../TestData/validation.xlsx
${sheet}        Sheet1
${log_file_validate}     ${CURDIR}/log_steps_validations.txt

*** Test Cases ***
create log file
    browser open    ${url}  ${browser}
    Append To File  ${log_file_validate}   browser opened!!!!:${url}\n
    sleep   5
    ${user}=   data.Read Excel cell  ${file}     ${sheet}    2   1
    log to console   ${user}
    Enter user name     ${user}
    Append To File      ${log_file_validate}     Entered user name:${user}\n
    ${pass}=    data.Read Excel cell  ${file}     ${sheet}    2   2
    log to console    ${pass}
    Enter password     ${pass}
    Append To File  ${log_file_validate}    Entered user name:${pass}\n
    sleep   5
    click login
    Append To File  ${log_file_validate}   logged\n
    Wait Until Page Contains Element    ${requirement_link}     10s
    click requirement
    Append To File  ${log_file_validate}    Clicked requirement\n
    Wait Until Page Contains Element    ${Add_btn}
    Append To File  ${log_file_validate}    clicked button\n
    click add candidate
    Append To File  ${log_file_validate}    added to candidate\n
    sleep   5
    Click save button
    Append To File  ${log_file_validate}    SAve button cliked\n
    Verify the mandatory field errors
    Append To File  ${log_file_validate}    Validation checked!!!
