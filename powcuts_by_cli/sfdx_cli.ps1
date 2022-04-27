

function SetupLocalGitHubActionsEnvironment {
	$env:SFDX_AUTH_URL = "force://PlatformCLI::.com"
	$env:ORG_ALIAS = "dev"
}

Set-Alias -Name np -Value c:\windows\notepad.exe

Set-Alias -Name jonwh -Value  "Write-Host"


function pernit {
    Write-Host "SetupLocalGitHubActionsEnvironment"
	SetupLocalGitHubActionsEnvironment
}

function is_workflow_alert_with_orrgWideEmailAddress {
    param($alert)

    [boolean]$isWorkflowAlertWithOrgWideEmailAddress = $(
                                                    $alert -ne $null                            -and
                                                    $alert.senderType -ne $null                -and 
                                                    $alert.senderType -eq 'OrgWideEmailAddress' 
                                                )
    $isWorkflowAlertWithOrgWideEmailAddress
}

function is_workflow_alert_with_currentUser {
    param($alert)

    [boolean]$is_workflow_alert_with_currentUser = $(
                                                    $alert -ne $null                            -and
                                                    $alert.senderType -ne $null                -and 
                                                    $alert.senderType -eq 'CurrentUser' 
                                                )
    $is_workflow_alert_with_currentUser
}

function dx-temporary-replacement-orgwideemail-replace-for-scratch-org-push {
    
    $all_workflow_files = Get-ChildItem -Recurse -File *.workflow-meta.xml

    foreach ($file in $all_workflow_files) {
        $xml_file = [xml](Get-Content $file -Raw)

        if ($xml_file.Workflow.alerts -ne $null) {
            (0..($xml_file.Workflow.alerts.count - 1)) | foreach {

                if (is_workflow_alert_with_orrgWideEmailAddress -alert $xml_file.Workflow.alerts[$_]) {
                    $xml_file.Workflow.alerts[$_].senderType = 'CurrentUser'
                    $sender_address_xml_node = $xml_file.Workflow.alerts[$_].ChildNodes | where Name -eq 'senderAddress'
                    $sender_address_xml_node.ParentNode.RemoveChild($sender_address_xml_node) | Out-Null  
                }
       
            }

            $xml_file.Save($file)
        }
    }

}

function dx-undo-temporary-replacement-orgwideemail-replace-for-scratch-org-push {
    
    $all_workflow_files = Get-ChildItem -Recurse -File *.workflow-meta.xml

    foreach ($file in $all_workflow_files) {
        $xml_file = [xml](Get-Content $file -Raw)

        if ($xml_file.Workflow.alerts -ne $null) {
            (0..($xml_file.Workflow.alerts.count - 1)) | foreach {

                if (is_workflow_alert_with_currentUser -alert $xml_file.Workflow.alerts[$_]) {
                    $xml_file.Workflow.alerts[$_].senderType = 'OrgWideEmailAddress'
                    $sender_address_xml_node = $xml_file.Workflow.alerts[$_].ChildNodes | where Name -eq 'senderAddress'
                    $sender_address_xml_node.ParentNode.RemoveChild($sender_address_xml_node) | Out-Null  
                }
       
            }

            $xml_file.Save($file)
        }
    }

}

function dx-create-scratch-org-orgwideemail-replace-with-current-user-and-push {
    $devhub = Read-Host "What DevHub will this Scratch Org be created from (--targetdevhubusername |-v)?"
    $durationDays = Read-Host "How many days (--durationdays) will this scratch org Exist (1-30)?"
    $alias = Read-Host "What will the scratch org's alias(--setalias) be?"
    echo "sfdx force:org:create --targetdevhubusername $devHub --definitionfile config/project-scratch-def.json --setalias $alias --durationdays $durationDays --setdefaultusername --wait 5 --loglevel ERROR"
    $command_result=$(sfdx force:org:create --targetdevhubusername $devHub --definitionfile config/project-scratch-def.json --setalias $alias --durationdays $durationDays --setdefaultusername --wait 5 --loglevel ERROR)
    echo $command_result
    $isSuccessful = $($command_result -like "*successfully*")
    if ($isSuccessful) {
        echo "RUNNING REPLACE SPECIFIC XML USERLOOKUP WITH ACTIVE SCRATCH ORG USER"
        dx-replace-user-info-instances-with-active-scratch-org-users $alias        
        echo "PUSHING CODEBASE TO $alias"
        echo "sfdx force:source:push --targetusername $alias --wait 10"
        sfdx force:source:push --targetusername $alias --wait 10
    } else {
        "The creation of the scratch org was unsucessful"
    }
}

function dx-replace-user-info-instances-with-active-scratch-org-users {
    param($alias)

    $sfdx_source_path = "$((Get-Location).path)/sfdx-source"
    Write-Host $sfdx_source_path
    update_workflow_files -path_to_workflows_directory $sfdx_source_path -scratch_org_alias $alias
}

function update_workflow_files {
    param($path_to_workflows_directory, $scratch_org_alias)

    # TODO: PATH CHECK ON $path_to_workflows_directory
    if (-not (Test-Path $path_to_workflows_directory)) {
        Write-Error -Message "PATH_TO_WORKFLOWS_DIRECTORY DOES NOT EXIST: '$path_to_workflows_directory'" -ErrorAction Stop
    }

    # INITIALIZE USER EMAIL
    $user_email = get_user_username -scratch_org_alias $scratch_org_alias

    # UPDATE LOOKUPVALUE AND LOOKUPVALUETYPE
    function get_workflow_files_by_directory {
        param($path_to_workflows_directory)
        $workflow_files = Get-ChildItem $path_to_workflows_directory -Filter '*workflow-meta.xml' -Recurse
        
        foreach ($workflow_file in $workflow_files) {
            echo $workflow_file.FullName
            update_workflow_file -path_to_input_xml $workflow_file.fullname -path_to_output_xml $workflow_file.fullname -lookupValue $user_email
        }
    }

}

function get_user_username {
    param($scratch_org_alias)

    $auth_list_json = sfdx force:org:list --json
    Write-Host "auth list json"
    Write-Host $auth_list_json
    Write-Host "auth list scratch orgs"
    $auth_list = $auth_list_json | ConvertFrom-Json
    Write-Host $auth_list.result.scratchOrgs
    $matches = @($auth_list.result.scratchOrgs | where alias -eq $scratch_org_alias)
    if ($matches.count -lt 1) {
        Write-Error -Message "SCRATCH_ORG_ALIAS NOT AUTHENTICATED: '$scratch_org_alias'" -ErrorAction Stop
    }

    $user_query = "select username from User where firstname='User' and lastname='User'"
    $response_json = sfdx force:data:soql:query -q $user_query -u $scratch_org_alias --json
    $response = $response_json | convertfrom-json
    $records = $response.result.records
    if ($null -ne $records -and $records.count -gt 0) {
        $records[0].username
    }
    else { ' '}
}

function update_workflow_file {
    param($path_to_input_xml, $path_to_output_xml, $lookupValue)

    $xml = [xml](Get-Content -Raw $path_to_input_xml)

    foreach ($field_update in $xml.Workflow.fieldUpdates) {
        if ($field_update.lookupValue -ne $null -and $field_update.lookupValueType -eq 'User') {
            $field_update.lookupValue = $lookupValue;
        }
    }

    if (Test-Path $path_to_output_xml) {
        Remove-Item -Force $path_to_output_xml | Out-Null
    } 

    $utf8nobom = [System.Text.UTF8Encoding]::new($false)
    $file_writer = [System.IO.StreamWriter]::new($path_to_output_xml, $false, $utf8nobom)

    $xml.Save($file_writer) | Out-Null
    $file_writer.Dispose() | Out-Null

    # APPLY FIXES TO UPDATED XML
    $xml_content_raw = Get-Content -Raw $path_to_output_xml

    # FIX 1 - CASING: RESTORE XML UTF CASING
    $updated_xml_utf_match_pattern = '<\?xml version="1.0" encoding="utf-8"\?>'
    $original_xml_utf_value = '<?xml version="1.0" encoding="UTF-8"?>'
    $xml_utf_casing_was_updated = [regex]::match($xml_content_raw, $updated_xml_utf_match_pattern)
    if ($xml_utf_casing_was_updated.success) {
        $xml_content_raw = [regex]::replace($xml_content_raw, $updated_xml_utf_match_pattern, $original_xml_utf_value)
    }

    # FIX 2 - INDENTATION: RESTORE 2 SPACE TABS TO 4 SPACE TABS
    $xml_content_raw = $xml_content_raw -replace '  ','    '
    # SAVE UPDATED XML RESULT
    $xml_content_raw | Out-File -NoNewline $path_to_output_xml

}

