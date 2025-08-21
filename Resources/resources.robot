*** Settings ***
Library     SeleniumLibrary
Variables   ../PageObjects/login.py

*** Keywords ***
Launch Application
    [Arguments]     ${url}  ${browser}
    open browser    ${url}  ${browser}
    maximize browser window
Perform Login
    [Arguments]     ${user}     ${pass}
    input text  ${username}     ${user}
    input text  ${password}     ${pass}
    click button    ${login_btn}
    capture page screenshot     ../results/login.png
    click link  ${requirement_link}
    click button    ${Add_btn}
Fill the Candidate Information
    [Arguments]    ${fname}     ${mname}  ${lname}  ${emailval}  ${mobile}  ${upload}  ${key}  ${text}
    input text   ${firstname}   ${fname}
    input text   ${middlename}   ${mname}
    input text   ${lastname}   ${lname}
    input text  ${email}     ${emailval}
    input text  ${contact}  ${mobile}
    choose file   ${browse_btn}   ${upload}
    input text  ${canditate_key}    ${key}
    click element   ${dateapplication}
    Clear Element Text  ${dateapplication}
    input text  ${textarea}     ${text}
    capture page screenshot     ../results/success.png
Save the candidate details
    click button    ${save_btn}
close browser
    close all browser
create log file
    remove file   ${log_file}
    Create File   ${log_file}
Verify the mandatory field errors
    element should be visible   ${fname}
    element should be visible   ${lname}
    element should be visible   ${emailcheck}
    capture page screenshot     validations.png