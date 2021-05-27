*** Settings ***
Library    Selenium2Library
Library    DateTime

*** Variables ***
${browser}      Chrome
${file_type}    png
${url}          http://165.227.93.41/lojinha-web

*** Keywords ***
Get DateTime
    ${current_date}=    Get Current Date    result_format=%d.%m.%Y_%H.%M.%S
    [Return]            ${current_date}

Inicia sessão
    Open Browser               ${url}          ${browser}
    Maximize Browser Window
    ${_date_}=                 Get DateTime
    Set Global Variable        ${path}         ./log/screenshots/${_date_}

Encerra sessão
    Screenshot       picture
    Close Browser

Screenshot
    [Arguments]                 ${filename}
    Set Screenshot Directory    ${path}
    Capture Page Screenshot     ${filename}.${file_type}
    ${_date_}=                  Get DateTime
    Log To Console              \nDate of execution: ${_date_}