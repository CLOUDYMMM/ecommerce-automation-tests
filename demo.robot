*** Settings ***
Library     Collections


*** Test Cases ***
Demo vs code ide hello world
    ${name} =    Set Variable    QA Hive
    Log    Hello world ${name}
