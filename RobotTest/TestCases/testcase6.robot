*** Settings ***
Documentation    Test Case 6
Library    SeleniumLibrary
Suite Setup    Open Browser    https://automationexercise.com/

*** Variables ***
${name}    valuename
${email}    valueemail@gmail
${subject}    valuesubject
${message}    valuemessage
${pdffile}    ${CURDIR}/filetest.pdf
${choosefile}    xpath=//input[@type="file"]

*** Keywords ***
Click Contact Element
    Click Element    //*[@id="header"]/div/div/div/div[2]/div/ul/li[8]/a

Input name
    [Arguments]    ${name}
    Input Text    //*[@name="name"]    ${name}

Input email
    [Arguments]    ${email}
    Input Text    //*[@name="email"]    ${email}

Input subject
    [Arguments]    ${subject}
    Input Text    //*[@name="subject"]    ${subject}

Input message
    [Arguments]    ${message}
    Input Text    //*[@name="message"]    ${message}

Upload file
    Choose File    ${choosefile}    ${pdffile}

Click submit
    Click Button    //*[@type="submit"]

Click Home
    Click Button    //*[@id="form-section"]/a

*** Test Cases ***
Contact Test
    Click Contact Element
    Input name    ${name}
    Input email    ${email}
    Input subject    ${subject}
    Input message    ${message}
    Upload file
    Click submit
    Handle Alert    action=ACCEPT
    Page Should Contain Element    //*[@id="contact-page"]/div[2]/div[1]/div/div[2]
    Click Home
