*** Settings ***
Library    SeleniumLibrary
Library    String

Resource    ../Locators/Dashboard.robot

*** Keywords ***
Validate if Dashboard page is visible
    page should contain    Dashboard

check the collapse expand button
    click button                ${btn_menu_collapse_css}
    sleep    1
    click button                ${btn_menu_collapse_css}
    sleep    2

provide new employee details
    [Arguments]    ${first}     ${middle}       ${last}
    input text    firstName         ${first}
    input text    middleName       ${middle}
    input text    lastName          ${last}
    click button    xpath://button[@type='submit']

#generate random user name
generate random user name
    ${user}     generate random string    8         [UPPER][LOWER]
    [Return]    ${user}


adding new employee in the website
    click link    xpath:(//a[@class='oxd-topbar-body-nav-tab-item'])[2]
    provide new employee details    Rock  The     Lesnar


adding user role in the website
    click element    xpath://button/i[contains(@class,'bi-plus')]
    wait until page contains    Add User
    click element    xpath:(//div[@class='oxd-select-text-input'])[1]
    click element    xpath://div[@role='listbox']//span[text()='Admin']
    input text      ${empolyeename_xpath}     Rock
    sleep    2
    press keys      ${empolyeename_xpath}       ARROW_DOWN    ENTER
    click element    xpath:(//div[@class='oxd-select-text-input'])[2]
    click element    xpath://div[@role='listbox']//span[text()='Enabled']
    ${user_name}         generate random user name
    input text       xpath:(//div[@class='oxd-form-row']//input)[2]     ${user_name}
    set suite variable    ${user_name}
    sleep    2
    input password    xpath:(//div[contains(@class,'user-password-row')]//input)[1]     Secret123456
    input password    xpath:(//div[contains(@class,'user-password-row')]//input)[2]     Secret123456
    submit form
    sleep    5

searching user in the website
    click element    xpath://li/span[text()="User Management "]
    click element    xpath://a[@role='menuitem']
    input text       css:.oxd-form-row .oxd-input       ${user_name}
    submit form
    wait until page contains     Rock Lesnar

deleting user from the website
    click element       xpath://li/span[text()="User Management "]
    click element       xpath://a[@role='menuitem']
    scroll element into view    xpath:(//input[@type="checkbox"])[5]
    sleep    3
    capture page screenshot     ../screenshots/beforedelete.png
    click element       xpath:(//input[@type="checkbox"])[5]/following-sibling::span/i
    click button        xpath://button[text()=' Delete Selected ']
    click button        xpath:(//div[@class='orangehrm-modal-footer']/button)[2]
    wait until page contains element    css:.oxd-table-body
    scroll element into view    xpath:(//input[@type="checkbox"])[5]
    capture page screenshot     ../screenshots/afterdelete.png
