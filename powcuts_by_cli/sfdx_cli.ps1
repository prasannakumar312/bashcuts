

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

function dx-temporary_replacement_orgwideemail_replace_for_scratch_org_push {
    
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

function dx-undo-temporary_replacement_orgwideemail_replace_for_scratch_org_push {
    
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



