*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary

#分层测试
*** Variables ***
${URL}            https://www.baidu.com
${BROWSER}        chrome
${REMOTEURL}    http://39.108.6.47:5555/wd/hub

*** Test Cases ***
case1
    Open Browser    ${URL}    browser=${BROWSER}    remote_url=${REMOTEURL}
    ${title}    Baidu Search    robot framework
    should contain    ${title}    robot framework_百度搜索
    close browser

case2
    Open Browser    ${URL}    browser=${BROWSER}    remote_url=${REMOTEURL}
    ${title}    Baidu Search    selenium
    should contain    ${title}    selenium_百度搜索
    close browser


*** Keywords ***
Baidu Search
    [Arguments]    ${search_key}
    Input text    id:kw    ${search_key}
    click button    id:su
    Evaluate    time.sleep(2)    time
    ${title}    Get Title
    [Return]    ${title}