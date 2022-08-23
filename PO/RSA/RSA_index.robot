*** Variables ***
${viewAllCoursesLink_xpath}     //a[text()='VIEW ALL COURSES']
${mentorshipLi_xpath}           //li[starts-with(text(), 'His mentorship')]

*** Keywords ***
Scroll to view all courses and capture screenshot
    Wait Until Element Is Visible  ${viewAllCoursesLink_xpath}  10s
    Scroll Element Into View  ${viewAllCoursesLink_xpath}
    Capture Page Screenshot  ${TEST NAME}.png

Get list text
    ${text} =  Get text  ${mentorshipLi_xpath}
    Return From Keyword    ${text}