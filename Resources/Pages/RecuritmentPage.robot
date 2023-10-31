*** Settings ***
Library     SeleniumLibrary
Library     ../../CustomLibrary/Dashboard.py
Resource    ../Locators/Dashboard.robot


*** Variables ***

*** Keywords ***

Open Recruitment page
    click on dashboard menu item        ${links_menu_css}       Recruitment
    page should contain element        ${recruitment_h6_xpath}
    should be true
