*** Settings ***
Resource    ../Resources/Pages/DashboardPage.robot
Resource    ../Resources/Pages/LoginPage.robot
Resource    ../Resources/Pages/Common.robot
Resource    ../Resources/Locators/Dashboard.robot
Library     ../CustomLibrary/Dashboard.py
#Suite Teardown   Close the resources


*** Test Cases ***
Validate the Dashboard page
    Go to Landing Page
    Login to the website        Admin       admin123
    check the collapse expand button

Validate the menus in Dashboard page
    page should contain                     Dashboard
    get the dashboard menu items            ${links_menu_css}

add employee in the website
    wait until page contains element        ${links_menu_css}
    click on dashboard menu item            ${links_menu_css}               PIM
    sleep    2
    adding new employee in the website
    sleep    3


Add role to the employee in the website
    wait until page contains element        ${links_menu_css}
    click on dashboard menu item            ${links_menu_css}               Admin
    sleep    2
    adding user role in the website


Search User in the Website
    searching user in the website
    capture page screenshot    ../screenshots/userFound.png

Delete a user from the Website
    deleting user from the website











