*** Settings ***
Resource    Variables.robot

*** Keywords ***
Get shadow element
    [Documentation]    ดึง element ที่อยู่ใน shadow DOM โดยใช้ CSS selector
    [Arguments]    ${element_selector}
    ${element}=    Execute Javascript    return document.querySelector('${shadow_host}').shadowRoot.querySelector('${element_selector}')
    RETURN       ${element}

Get shadow text
    [Documentation]    ดึงข้อความจาก element ที่อยู่ใน shadow DOM และรอให้ element ปรากฏก่อน
    [Arguments]    ${element_selector}
    Wait Until Keyword Succeeds    10x    0.5s    Execute Javascript    var h=document.querySelector('${shadow_host}'); return !!(h && h.shadowRoot && h.shadowRoot.querySelector('${element_selector}'));
    ${text}=    Execute Javascript    var h=document.querySelector('${shadow_host}'); if(h && h.shadowRoot){ var el=h.shadowRoot.querySelector('${element_selector}'); return el ? (el.textContent||'') : ''; } return '';
    RETURN       ${text}





  

    
