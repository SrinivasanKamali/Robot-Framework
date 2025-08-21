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
${file}         ${CURDIR}/../TestData/testdata.xlsx
${sheet}        Sheet1
${upload}       ${CURDIR}/../TestData/Srinivasan_Govindhan_Resume.pdf
${log_file}     ${CURDIR}/../TestData/log_steps.txt

*** Test Cases ***
TC001_Add Candidate with All Details
    ${total_row}=   data.Get Max Row  ${file}   ${sheet}
    ${end}=     Evaluate    ${total_row} + 1
    log to console  ${end}
    FOR     ${i}  IN RANGE  2   ${end}
    create log file
    Launch Application  ${url}  ${browser}
    Append To File  ${log_file}   browser opened!!!!:${url}\n
    set selenium implicit wait  10s
    Wait Until Element is visible    ${username}
    ${user}=   data.Read Excel cell  ${file}     ${sheet}    ${i}   user
    ${pass}=    data.Read Excel cell  ${file}     ${sheet}    ${i}   pass
    ${fname}=   data.Read Excel cell  ${file}     ${sheet}    ${i}   fname
    ${mname}=   data.Read Excel cell  ${file}     ${sheet}    ${i}   mname
    ${lname}=   data.Read Excel cell  ${file}     ${sheet}    ${i}   lname
    ${emailval}=   data.Read Excel cell  ${file}     ${sheet}    ${i}   email
    ${mobile}=   data.Read Excel cell  ${file}     ${sheet}    ${i}   mobile
    ${key}=   data.Read Excel cell  ${file}     ${sheet}    ${i}   key
    ${text}=   data.Read Excel cell  ${file}     ${sheet}    ${i}   text
    Perform Login   ${user}    ${pass}
    Append To File  ${log_file}  Logged in Successfully!!!
    Wait Until Element Is Enabled   ${requirement_link}
    Wait Until Element Is Enabled   ${firstname}
    Wait Until Element Is Enabled   ${email}
    Fill the Candidate Information  ${fname}  ${mname}   ${lname}  ${emailval}  ${mobile}  ${upload}  ${key}  ${text}
    Save the candidate details
    Append To File  ${log_file}    Successfully Added Candidate!!!
    END

TC002 Add Candidate without enterd Mandatory values
    Launch Application    ${url}  ${browser}
    Append To File  ${log_file}   browser opened!!!!:${url}\n
    ${user}=   data.Read Excel cell  ${file}     ${sheet}    2   user
    ${pass}=    data.Read Excel cell  ${file}     ${sheet}    2   pass
    Perform Login   ${user}    ${pass}
    Append To File  ${log_file}   logged\n
    Wait Until Page Contains Element    ${requirement_link}     10s
    Save the candidate details
    Append To File  ${log_file}    SAve button cliked\n
    Verify the mandatory field errors
    Append To File  ${log_file}    Validation checked!!!
