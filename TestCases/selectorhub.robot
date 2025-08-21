*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/timesheet.robot
Resource    ../Resources/Attadence.robot
Library     ../TestData/testdata_pandas.py
Library     OperatingSystem

Suite Setup     log to console  opening the browser
Suite Teardown  log to console  close browser action
Test Setup      log to console  Login To Application
Test Teardown   log to console  Logout application

*** Variables ***
${url}          https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
@{Browsers}     chrome  edge
${browser}      chrome
${file}         ${CURDIR}/../TestData/testdata.xlsx
${sheet}        Sheet1
${sheet_name}   Sheet2
${log_file}     ${CURDIR}/../TestData/log_steps.txt
${OUTPUT_FILE}  ${CURDIR}/../TestData/timesheet_periods.txt
${OUTPUT_FILE_EMPID}  ${CURDIR}/../TestData/EmpID_Attenance.txt



*** Test Cases ***
TC001_Find selector hub
    [Tags]  regression

    ${total_row}=   testdata_pandas.Get Total Rows   ${file}     ${sheet}
    ${end}=     Evaluate    ${total_row} + 1
    log to console  ${end}
    FOR     ${i}  IN    @{Browsers}
    Launch Application    ${url}  ${i}
    FOR     ${i}  IN RANGE  2   ${end}
    create log file
    Append To File  ${log_file}   browser opened!!!!:${url}\n
    set selenium implicit wait  10s
    Wait Until Element is visible    ${username}
    ${user}=   testdata_pandas.Get Total Rows   ${file}     ${sheet}    ${i}    user
    ${pass}=    testdata_pandas.Get Total Rows    ${file}     ${sheet}    ${i}    pass
    #${user}=   data.Read Excel cell  ${file}     ${sheet}    ${i}   user
    #${pass}=    data.Read Excel cell  ${file}     ${sheet}    ${i}   pass
    Perform Login   ${user}    ${pass}
    Timesheet entry record check
    END
    END