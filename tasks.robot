# TODO. Add attribute selection
*** Settings ***
Library           RPA.Dialogs
Library           RPA.Windows    WITH NAME    Windows
Library           RPA.Desktop    WITH NAME    Desktop

*** Keywords ***
Collect Search Query From User
    Add text input    search    label=Windowtitle to inspect
    Add text input    classes    label=Classes
    ${response}=    Run dialog
    [Return]    ${response}

*** Tasks ***
Minimal task
    ${search_query}=    Collect search query from user
    ${classes}=    Create List
    IF    "${search_query.classes}" != ""
        ${classes}=    Evaluate    [c.strip() for c in $search_query.classes.split(',')]
    END
    #Open Dialog    ${search_query.search}    wildcard=True
    ${attrs}=    Create List    name    class_name    control_type    legacy_value
    #Press Keys    cmd    m
    Log    Done.
