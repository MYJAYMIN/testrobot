*** Settings ***
Documentation     This is a sample test suite using Robot Framework
Library           SeleniumLibrary
Suite Setup       Open Browser    https://app.futureskill.co/login


*** Variables ***
${email}         akapre@gmail.com 
${name}          akapre  
${lastName}      preaka
${PhoneNumber}   0900000000
${password}      Ab12345678



*** Keywords ***

Click Register Element
    Click Element       //*[@id="__next"]/div[2]/div/div[2]/div/div/a/h6
    
Checked Checkbox
    Click Element       //*[@id="__next"]/div[2]/div/div[2]/div/form/div/div[6]/label/input

Click Register Button
    Click Button        //*[@id="__next"]/div[2]/div/div[2]/div/form/div/div[7]/button


Input Email
    [Arguments]    ${email}
    Input Text    //*[@name="email"]    ${email}

Input name
    [Arguments]    ${name}
    Input Text    //*[@name="firstName"]    ${name}

Input lastName
    [Arguments]    ${lastName}
    Input Text    //*[@name="lastName"]    ${lastName}

Input phoneNumber
    [Arguments]    ${PhoneNumber}
    Input Text    //*[@name="phoneNumber"]    ${PhoneNumber}

Input nemPassword
    [Arguments]    ${password}
    Input Text    //*[@name="newPassword"]    ${password}

Input confirmPassword
    [Arguments]    ${password}
    Input Text    //*[@name="confirmPassword"]    ${password}



*** Test Cases ***
Register with valid info
   [Documentation]    Test the login functionality with valid credentials
   Click Register Element
   
   Input Email                  ${email}
   Input name                   ${name}
   Input lastName               ${lastName}
   Input phoneNumber            ${PhoneNumber}
   Input nemPassword            ${password}
   Input confirmPassword        ${password}
   
   Checked Checkbox 
   Click Register Button
   Page Should Contain Element          //*[@id="__next"]/div[2]/div/div[2]/h6[1] 