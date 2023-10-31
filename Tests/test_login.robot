*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/Pages/DashboardPage.robot
Resource    ../Resources/Pages/LoginPage.robot

*** Test Cases ***
Login to the orangehrm
    Go to Landing Page
    Login to the website        Admin       admin123
    Validate if Dashboard page is visible




