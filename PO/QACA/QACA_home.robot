*** Variables ***
${noThanksButton_xpath}     //button[text()='NO THANKS']
${guaranteeH3_xpath}     //h3[text()='30 day Money Back Guarantee']
${calendarIcon_xpath}   //h3/i[@class='icon icon-039']
${guaranteeP_xpath}     ${guaranteeH3_xpath}/following-sibling::p
${titlesH3_xpath}  //section[@id='welcome']//h3[text()]

*** Keywords ***
Close Advertising
    Run Keyword And Ignore Error  Wait Until Page Contains Element  ${noThanksButton_xpath}  3s
    Run Keyword And Ignore Error  Click Element  ${noThanksButton_xpath}

Count elements for 30 day money back
    ${count} =	Get Element Count	${guaranteeH3_xpath}
    Return From Keyword    ${count}

Advertising section is visible
    Element Should Be Visible  ${guaranteeH3_xpath}
    Element Should Be Visible  ${calendarIcon_xpath}
    Element Should Be Visible  ${guaranteeP_xpath}

Get Text titles
    ${webElements} =  Get WebElements  ${titlesH3_xpath}
    @{lstTitles} =	Create List
    FOR	${element}	IN	@{webElements}
        ${title} =  Get Text  ${element}
        Append To List	${lstTitles}	${title}
    END
    Return From Keyword    ${lstTitles}