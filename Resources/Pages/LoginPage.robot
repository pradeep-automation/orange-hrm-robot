*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${BASE_URL}     https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${BROWSER}      chrome

*** Keywords ***
Go to Landing Page
    open browser    ${BASE_URL}     ${BROWSER}
    maximize browser window
    set selenium implicit wait    10seconds
Login to the website
    [Arguments]    ${username}      ${password}
    input text      username        ${username}
    input password  password        ${password}
    submit form