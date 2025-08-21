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
TC001_Find total number records and log Timesheet period data
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


TC002 Attandence punch IN and punch Out
    [Tags]  sanity
    ${total_row}=   testdata_pandas.Get Row Data  ${file}     ${sheet}
    ${end}=     Evaluate    ${total_row} + 1
    log to console  ${end}
    FOR     ${i}  IN RANGE  2   ${end}
    create log file
    Launch Application    ${url}  ${browser}
    Append To File  ${log_file}   browser opened!!!!:${url}\n
    set selenium implicit wait  10s
    Wait Until Element is visible    ${username}
    ${user}=    Set Variable    ${row['user']}
    ${pass}=    Set Variable    ${row['pass']}
    ${date}=    Set Variable    ${row['date']}
    ${intime}=   Set Variable    ${row['intime']}
    ${text}=    Set Variable    ${row['text']}
    #${user}=   data.Read Excel cell  ${file}     ${sheet_name}    ${i}   user
    #${pass}=    data.Read Excel cell  ${file}    ${sheet_name}    ${i}   pass
    #${date}=   data.Read Excel cell  ${file}     ${sheet_name}    ${i}   date
    #${intime}=    data.Read Excel cell  ${file}    ${sheet_name}    ${i}   intime
    #${text}=   data.Read Excel cell  ${file}     ${sheet_name}    ${i}   text
    #${outtime}=    data.Read Excel cell  ${file}    ${sheet_name}    ${i}   outtime
    #${outdate}=    data.Read Excel cell  ${file}    ${sheet_name}    ${i}   outdate
    Perform Login   ${user}    ${pass}
    TimeEntry punch IN  ${date}   ${intime}    ${text}
    #TimeEntry punch OUT  ${outdate}   ${outtime}   ${text}
    END

TC003 Find The Employee Attadence Details
    [Tags]      smoke
    ${total_row}=   testdata_pandas.Get Total Rows    ${file}     ${sheet}
    log to console  ${total_row}
    ${end}=         Evaluate    ${total_row} + 1
    Log To Console  ${end}
    FOR  ${i}  IN RANGE  0   ${end}
    Log To Console  ${i}
    create log file
    Launch Application with browser   ${url}    ${browser}
    Append To File  ${log_file}   browser opened!!!!:${url}\n
    set selenium implicit wait  10s
    Wait Until Element Is Visible    ${username}
    ${user}=    Get Row Data    ${file}    ${sheet}    ${i}    user
    ${pass}=    Get Row Data    ${file}    ${sheet}    ${i}    pass
    ${empid}=    Get Row Data    ${file}    ${sheet}    ${i}    empid
    Perform Login for employeee  ${user}    ${pass}
    Find Employee attadence records     ${empid}
    END




