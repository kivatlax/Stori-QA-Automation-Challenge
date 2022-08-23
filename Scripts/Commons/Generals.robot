*** Keywords ***
SetUp Browser and Open Url
    [Arguments]  ${browser}  ${url}  ${seleniumSpeed}=0.5 seconds
    Open Browser    ${url}  ${browser}
    Set Selenium Speed	1 seconds

TearDown Browser
    Close All Browsers