*** Settings ***
Documentation     Challenge Stori-QA-Automation-Challenge.
Library           SeleniumLibrary
Library             String
Library             Collections
Resource            ./Commons/Generals.robot
Resource            ../PO/RSA/RSA_home.robot
Resource            ../PO/QACA/QACA_home.robot
Resource            ../PO/RSA/RSA_index.robot
Suite Setup         Generals.SetUp Browser and Open Url  ${BROWSER}  ${RSA_URL}
Suite Teardown      Generals.TearDown Browser

*** Variables ***
${RSA_URL}        https://rahulshettyacademy.com/AutomationPractice/
${BROWSER}        Chrome
${toTypeOnAlerts}  Stori Card
${alertTextExpected}  Hello Stori Card, Are you sure you want to confirm?

*** Test Cases ***
TC_001_Guarantee text should be displayed
    RSA_home.Type Me and select Mexico on suggestion input
    RSA_home.Select value Option2 on dropdown
    RSA_home.Select value Option3 on dropdown
    RSA_home.Click Open Window button
    Switch Window	NEW
    QACA_home.Close Advertising
    ${countElem30days} =  QACA_home.Count elements for 30 day money back
    Run Keyword And Ignore Error  QACA_home.Advertising section is visible
    ${titles} =  QACA_home.Get Text titles
    Set Global Variable  ${lstTitles}  ${titles}
    Close Window
    Switch Window  MAIN
    Run Keyword If	${countElem30days} != 1  Fail  30 day money back guarantee is not shown

TC_002_Promotional text should be displayed
    ${listExpected} =	Create List	SELF PACED ONLINE TRAINING  IN DEPTH MATERIAL  LIFETIME INSTRUCTOR SUPPORT  RESUME PREPARATION
    List Should Contain Sub List  ${lstTitles}  ${listExpected}

TC_003_Capture screenshot
    RSA_home.Click Open Tab button
    Switch Window	NEW
    RSA_index.Scroll to view all courses and capture screenshot
    Switch Window	MAIN

TC_004_Alert should shown specific text
    RSA_home.Type ${toTypeOnAlerts} in switch to alert input
    RSA_home.Click alert button
    ${alertText} =  RSA_home.Get text alert and click ok alert
    Log  ${alertText}
    RSA_home.Type ${toTypeOnAlerts} in switch to alert input
    RSA_home.Click confirm button
    ${alertText} =  RSA_home.Get text alert and click ok alert
    Should Be Equal As Strings  ${alertText}  ${alertTextExpected}

TC_005_Retrieve courses that are $25
    ${totalCourses} =  RSA_home.Count courses that are 25
    Log  There are ${totalCourses} number of courses that are $25
    ${lstCourses} =  RSA_home.Get courses that are 25
    Log  ${lstCourses}

TC_006_Retrieve name engineers
    ${lstEngineers} =  RSA_home.Get engineers list
    Log  ${lstEngineers}

TC_007_Retrieve paragraph text from iframe
    ${frame_xpath} =  RSA_home.Go and Get frame xpath
    Select Frame	${frame_xpath}
    ${paragrapText} =  RSA_index.Get list text
    Log  ${paragrapText}
