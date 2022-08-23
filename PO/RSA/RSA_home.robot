*** Variables ***
${countryInput_xpath}        //input[@id='autocomplete']
${SuggestionDiv_xpath}      //ul[@id='ui-id-1']//div[text()='__TO_REPLACE__']
${dropdownSelect_xpath}     //select[@id='dropdown-class-example']
${valueOption_xpath}        ${dropdownSelect_xpath}/option[text()='__TO_REPLACE__']
${openWindowButton_xpath}   //button[@id='openwindow']
${openTabLink_xpath}        //a[@id='opentab']
${nameInput_xpath}          //input[@id='name']
${nameInput_css}            css:input#name
${alertButton_xpath}        //input[@id='alertbtn']
${confirmButton_xpath}      //input[@id='confirmbtn']
${price25Td_xpath}          //table[@name='courses']//tr/td[3][text()='25']
${cursesPrice25Td_xpath}    ${price25Td_xpath}/../td[2]
${engineerTd_xpath}         //table[@id='product'][not(@name)]//tr/td[2][text()='Engineer']/../td[1]
${discountLink_xpath}       //a[text()='Discount Coupons']
${frame_xpath}              //iframe[@id='courses-iframe']

*** Keywords ***
Type ${word} and select ${to_select} on suggestion input
    ${suggestion_xpath} =	Replace String  ${SuggestionDiv_xpath}	__TO_REPLACE__  ${to_select}
    Input Text   ${countryInput_xpath}  ${word}
    Wait Until Element Is Visible  ${suggestion_xpath}
    Click Element  ${suggestion_xpath}

Select value ${value_to_select} on dropdown
    Click Element  ${dropdownSelect_xpath}
    ${value_xpath} =	Replace String  ${valueOption_xpath}	__TO_REPLACE__  ${value_to_select}
    Click Element  ${value_xpath}

Click Open Window button
    Click Element  ${openWindowButton_xpath}

Click Open Tab button
    Click Element  ${openTabLink_xpath}

Type ${to_type} in switch to alert input
    Input Text   ${nameInput_css}  ${to_type}

Click alert button
    Click Element  ${alertButton_xpath}

Get text alert and click ok alert
    ${message} =	Handle Alert
    Return From Keyword    ${message}

Click confirm button
    Click Element  ${confirmButton_xpath}

Count courses that are 25
    ${count} =	Get Element Count	${price25Td_xpath}
    Return From Keyword    ${count}

Get courses that are 25
    ${webElements} =  Get WebElements  ${cursesPrice25Td_xpath}
    @{lstCourses} =	Create List
    FOR	${element}	IN	@{webElements}
        ${course} =  Get Text  ${element}
        Append To List	${lstCourses}	${course}
    END
    Return From Keyword    ${lstCourses}

Get engineers list
    ${webElements} =  Get WebElements  ${engineerTd_xpath}
    @{lstEng} =	Create List
    FOR	${element}	IN	@{webElements}
        ${eng} =  Get Text  ${element}
        Append To List	${lstEng}	${eng}
    END
    Return From Keyword    ${lstEng}

Go and Get frame xpath
    Scroll Element Into View  ${discountLink_xpath}
    Return From Keyword  ${frame_xpath}