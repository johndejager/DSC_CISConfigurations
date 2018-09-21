Configuration CIS_WindowsServer2016_v100_MS_lvl1
{

    Import-DscResource -ModuleName 'PSDesiredStateConfiguration'
    Import-DscResource -ModuleName 'AuditPolicyDsc'

    Node localhost
    {
        ## Security Configuration

        # CIS Hardening Level 1 for Member Servers
        # 18.9.10.1.1 (L1) Ensure 'Use enhanced anti-spoofing when available' is set to 'Enabled'
        Registry 'EnhancedAntiSpoofing' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Biometrics\FacialFeatures'
            ValueName = 'EnhancedAntiSpoofing'
            ValueType = 'DWord'
            ValueData = '1'
        }

        # 18.1.2.1 (L1) Ensure 'Allow Input Personalization' is set to 'Disabled'
        Registry 'AllowInputPersonalization' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\InputPersonalization'
            ValueName = 'AllowInputPersonalization'
            ValueType = 'DWord'
            ValueData = '0'
        }

        # 18.9.53.1 (L1) Ensure 'Prevent downloading of enclosures' is set to 'Enabled'
        Registry 'DisableEnclosureDownload' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Internet Explorer\Feeds'
            ValueName = 'DisableEnclosureDownload'
            ValueType = 'DWord'
            ValueData = '1'
        }
        
        # 18.9.41.3 (L1) Ensure 'Configure cookies' is set to 'Enabled: Block only 3rd-party cookies' or higher
        Registry 'Cookies' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\MicrosoftEdge\Main'
            ValueName = 'Cookies'
            ValueType = 'DWord'
            ValueData = '1'
        }

        # 18.9.41.4 (L1) Ensure 'Configure Password Manager' is set to 'Disabled'
        Registry 'FormSuggest Passwords' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\MicrosoftEdge\Main'
            ValueName = 'FormSuggest Passwords'
            ValueType = 'String'
            ValueData = 'no'
        }

        # 18.9.41.7 (L1) Ensure 'Configure SmartScreen Filter' is set to 'Enabled'
        Registry 'EnabledV9' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\MicrosoftEdge\PhishingFilter'
            ValueName = 'EnabledV9'
            ValueType = 'DWord'
            ValueData = '1'
        }

        # 18.9.41.6 (L1) Ensure 'Configure search suggestions in Address bar' is set to 'Disabled' 
        Registry 'ShowSearchSuggestionsGlobal' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\MicrosoftEdge\SearchScopes'
            ValueName = 'ShowSearchSuggestionsGlobal'
            ValueType = 'DWord'
            ValueData = '0'
        }

        # 18.9.13.1 (L1) Ensure 'Turn off Microsoft consumer experiences' is set to 'Enabled' 
        Registry 'DisableWindowsConsumerFeatures' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\CloudContent'
            ValueName = 'DisableWindowsConsumerFeatures'
            ValueType = 'DWord'
            ValueData = '1'
        }

        # 18.9.14.1 (L1) Ensure 'Require pin for pairing' is set to 'Enabled'
        Registry 'RequirePinForPairing' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Connect'
            ValueName = 'RequirePinForPairing'
            ValueType = 'DWord'
            ValueData = '1'
        }

        # 18.9.15.1 (L1) Ensure 'Do not display the password reveal button' is set to 'Enabled'
        Registry 'DisablePasswordReveal' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\CredUI'
            ValueName = 'DisablePasswordReveal'
            ValueType = 'DWord'
            ValueData = '1'
        }

        # 18.9.16.1 (L1) Ensure 'Allow Telemetry' is set to 'Enabled: 0 - Security [Enterprise Only]'
        Registry 'AllowTelemetry' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\DataCollection'
            ValueName = 'AllowTelemetry'
            ValueType = 'DWord'
            ValueData = '0'
        }

        # 18.9.16.3 (L1) Ensure 'Do not show feedback notifications' is set to 'Enabled'
        Registry 'DoNotShowFeedbackNotifications' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\DataCollection'
            ValueName = 'DoNotShowFeedbackNotifications'
            ValueType = 'DWord'
            ValueData = '1'
        }

        # 18.9.26.1.1 (L1) Ensure 'Application: Control Event Log behavior when the log file reaches its maximum size' is set to 'Disabled'
        Registry 'Retention' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\EventLog\Application'
            ValueName = 'Retention'
            ValueType = 'String'
            ValueData = '0'
        }

        # 18.9.26.1.2 (L1) Ensure 'Application: Specify the maximum log file size (KB)' is set to 'Enabled: 32,768 or greater'
        Registry 'MaxSize' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\EventLog\Application'
            ValueName = 'MaxSize'
            ValueType = 'DWord'
            ValueData = '32768'
        }

        # 18.9.26.2.1 (L1) Ensure 'Security: Control Event Log behavior when the log file reaches its maximum size' is set to 'Disabled'
        Registry 'Retention1' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\EventLog\Security'
            ValueName = 'Retention'
            ValueType = 'String'
            ValueData = '0'
        }

        # 18.9.26.2.2 (L1) Ensure 'Security: Specify the maximum log file size (KB)' is set to 'Enabled: 196,608 or greater'
        Registry 'MaxSize1' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\EventLog\Security'
            ValueName = 'MaxSize'
            ValueType = 'DWord'
            ValueData = '196608'
        }

        # 18.9.26.3.2 (L1) Ensure 'Setup: Specify the maximum log file size (KB)' is set to 'Enabled: 32,768 or greater'
        Registry 'MaxSize2' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\EventLog\Setup'
            ValueName = 'MaxSize'
            ValueType = 'DWord'
            ValueData = '32768'
        }

        # 18.9.26.3.1 (L1) Ensure 'Setup: Control Event Log behavior when the log file reaches its maximum size' is set to 'Disabled' 
        Registry 'Retention2' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\EventLog\Setup'
            ValueName = 'Retention'
            ValueType = 'String'
            ValueData = '0'
        }

        # 18.9.26.4.1 (L1) Ensure 'System: Control Event Log behavior when the log file reaches its maximum size' is set to 'Disabled'
        Registry 'Retention3' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\EventLog\System'
            ValueName = 'Retention'
            ValueType = 'String'
            ValueData = '0'
        }

        # 18.9.26.4.2 (L1) Ensure 'System: Specify the maximum log file size (KB)' is set to 'Enabled: 32,768 or greater' 
        Registry 'MaxSize3' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\EventLog\System'
            ValueName = 'MaxSize'
            ValueType = 'DWord'
            ValueData = '32768'
        }

        # 18.9.8.1 (L1) Ensure 'Disallow Autoplay for non-volume devices' is set to 'Enabled' 
        Registry 'NoAutoplayfornonVolume' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Explorer'
            ValueName = 'NoAutoplayfornonVolume'
            ValueType = 'DWord'
            ValueData = '1'
        }

        # 18.9.30.3 (L1) Ensure 'Turn off Data Execution Prevention for Explorer' is set to 'Disabled' 
        Registry 'NoDataExecutionPrevention' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Explorer'
            ValueName = 'NoDataExecutionPrevention'
            ValueType = 'DWord'
            ValueData = '0'
        }

        # 18.9.30.4 (L1) Ensure 'Turn off heap termination on corruption' is set to 'Disabled' 
        Registry 'NoHeapTerminationOnCorruption' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Explorer'
            ValueName = 'NoHeapTerminationOnCorruption'
            ValueType = 'DWord'
            ValueData = '0'
        }

        # 18.8.19.2 (L1) Ensure 'Configure registry policy processing: Do not apply during periodic background processing' is set to 'Enabled: FALSE'
        Registry 'NoBackgroundPolicy' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}
'
            ValueName = 'NoBackgroundPolicy'
            ValueType = 'DWord'
            ValueData = '0'
        }

        # 18.8.19.3 (L1) Ensure 'Configure registry policy processing: Process even if the Group Policy objects have not changed' is set to 'Enabled: TRUE' 
        Registry 'NoGPOListChanges' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}
'
            ValueName = 'NoGPOListChanges'
            ValueType = 'DWord'
            ValueData = '0'
        }

        # 18.9.74.1 (L1) Ensure 'Allow user control over installs' is set to 'Disabled'
        Registry 'EnableUserControl' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Installer'
            ValueName = 'EnableUserControl'
            ValueType = 'DWord'
            ValueData = '0'
        }

        # 18.9.74.2 (L1) Ensure 'Always install with elevated privileges' is set to 'Disabled' 
        Registry 'AlwaysInstallElevated' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Installer'
            ValueName = 'AlwaysInstallElevated'
            ValueType = 'DWord'
            ValueData = '0'
        }

        # 18.4.8.1 (L1) Ensure 'Enable insecure guest logons' is set to 'Disabled'
        Registry 'AllowInsecureGuestAuth' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\LanmanWorkstation'
            ValueName = 'AllowInsecureGuestAuth'
            ValueType = 'DWord'
            ValueData = '0'
        }

        # 18.4.11.2 (L1) Ensure 'Prohibit installation and configuration of Network Bridge on your DNS domain network' is set to 'Enabled'
        Registry 'NC_AllowNetBridge_NLA' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Network Connections'
            ValueName = 'NC_AllowNetBridge_NLA'
            ValueType = 'DWord'
            ValueData = '0'
        }

        # 18.4.11.3 (L1) Ensure 'Prohibit use of Internet Connection Sharing on your DNS domain network' is set to 'Enabled' 
        Registry 'NC_ShowSharedAccessUI' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Network Connections'
            ValueName = 'NC_ShowSharedAccessUI'
            ValueType = 'DWord'
            ValueData = '0'
        }

        # 18.4.11.4 (L1) Ensure 'Require domain users to elevate when setting a network's location' is set to 'Enabled' 
        Registry 'NC_StdDomainUserSetLocation' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Network Connections'
            ValueName = 'NC_StdDomainUserSetLocation'
            ValueType = 'DWord'
            ValueData = '1'
        }

        # 18.4.14.1 (L1) Ensure 'Hardened UNC Paths' is set to 'Enabled, with "Require Mutual Authentication" and "Require Integrity" set for all NETLOGON and SYSVOL shares' 
        Registry '\\*\NETLOGON' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths'
            ValueName = '\\*\NETLOGON'
            ValueType = 'String'
            ValueData = 'RequireMutualAuthentication=1,RequireIntegrity=1'
        }

        # 18.4.14.1 (L1) Ensure 'Hardened UNC Paths' is set to 'Enabled, with "Require Mutual Authentication" and "Require Integrity" set for all NETLOGON and SYSVOL shares' 
        Registry '\\*\SYSVOL' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths'
            ValueName = '\\*\SYSVOL'
            ValueType = 'String'
            ValueData = 'RequireMutualAuthentication=1,RequireIntegrity=1'
        }

        # 18.9.47.1 (L1) Ensure 'Prevent the usage of OneDrive for file storage' is set to 'Enabled'
        Registry 'DisableFileSyncNGSC' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\OneDrive'
            ValueName = 'DisableFileSyncNGSC'
            ValueType = 'DWord'
            ValueData = '1'
        }

        # 18.1.1.1 (L1) Ensure 'Prevent enabling lock screen camera' is set to 'Enabled'
        Registry 'NoLockScreenCamera' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Personalization'
            ValueName = 'NoLockScreenCamera'
            ValueType = 'DWord'
            ValueData = '1'
        }

        # 18.1.1.2 (L1) Ensure 'Prevent enabling lock screen slide show' is set to 'Enabled' 
        Registry 'NoLockScreenSlideshow' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Personalization'
            ValueName = 'NoLockScreenSlideshow'
            ValueType = 'DWord'
            ValueData = '1'
        }

        # 18.9.84.1 (L1) Ensure 'Turn on PowerShell Script Block Logging' is set to 'Disabled'
        Registry 'EnableScriptBlockLogging' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging'
            ValueName = 'EnableScriptBlockLogging'
            ValueType = 'DWord'
            ValueData = '0'
        }

        # 18.9.84.1 (L1) Ensure 'Turn on PowerShell Script Block Logging' is set to 'Disabled' 
        Registry 'EnableScriptBlockInvocationLogging' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging'
            ValueName = 'EnableScriptBlockInvocationLogging'
            ValueType = 'String'
            ValueData = ' '
        }

        # 18.9.84.2 (L1) Ensure 'Turn on PowerShell Transcription' is set to 'Disabled' 
        Registry 'EnableTranscripting' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\PowerShell\Transcription'
            ValueName = 'EnableTranscripting'
            ValueType = 'DWord'
            ValueData = '0'
        }

        # 18.9.84.1 (L1) Ensure 'Turn on PowerShell Script Block Logging' is set to 'Disabled' 
        Registry 'OutputDirectory' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\PowerShell\Transcription'
            ValueName = 'OutputDirectory'
            ValueType = 'String'
            ValueData = ' '
        }

        # 18.9.84.1 (L1) Ensure 'Turn on PowerShell Script Block Logging' is set to 'Disabled' 
        Registry 'EnableInvocationHeader' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\PowerShell\Transcription'
            ValueName = 'EnableInvocationHeader'
            ValueType = 'String'
            ValueData = ' '
        }

        # 18.9.16.2 (L1) Ensure 'Disable pre-release features or settings' is set to 'Disabled'
        Registry 'EnableConfigFlighting' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\PreviewBuilds'
            ValueName = 'EnableConfigFlighting'
            ValueType = 'DWord'
            ValueData = '0'
        }

        # 18.9.16.2 (L1) Ensure 'Disable pre-release features or settings' is set to 'Disabled'
        Registry 'EnableExperimentation' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\PreviewBuilds'
            ValueName = 'EnableExperimentation'
            ValueType = 'String'
            ValueData = ' '
        }

        # 18.9.16.2 (L1) Ensure 'Disable pre-release features or settings' is set to 'Disabled'
        Registry 'AllowBuildPreview' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\PreviewBuilds'
            ValueName = 'AllowBuildPreview'
            ValueType = 'DWord'
            ValueData = '0'
        }

        # 18.8.19.4 (L1) Ensure 'Continue experiences on this device' is set to 'Disabled'
        Registry 'EnableCdp' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\System'
            ValueName = 'EnableCdp'
            ValueType = 'DWord'
            ValueData = '0'
        }

        # 18.8.25.1 (L1) Ensure 'Block user from showing account details on signin' is set to 'Enabled'
        Registry 'BlockUserFromShowingAccountDetailsOnSignin' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\System'
            ValueName = 'BlockUserFromShowingAccountDetailsOnSignin'
            ValueType = 'DWord'
            ValueData = '1'
        }

        # 18.8.25.2 (L1) Ensure 'Do not display network selection UI' is set to 'Enabled' 
        Registry 'DontDisplayNetworkSelectionUI' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\System'
            ValueName = 'DontDisplayNetworkSelectionUI'
            ValueType = 'DWord'
            ValueData = '1'
        }

        # 18.8.25.3 (L1) Ensure 'Do not enumerate connected users on domain-joined computers' is set to 'Enabled' 
        Registry 'DontEnumerateConnectedUsers' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\System'
            ValueName = 'DontEnumerateConnectedUsers'
            ValueType = 'DWord'
            ValueData = '1'
        }

        # 18.8.25.4 (L1) Ensure 'Enumerate local users on domain-joined computers' is set to 'Disabled'
        Registry 'EnumerateLocalUsers' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\System'
            ValueName = 'EnumerateLocalUsers'
            ValueType = 'DWord'
            ValueData = '0'
        }

        # 18.8.25.5 (L1) Ensure 'Turn off app notifications on the lock screen' is set to 'Enabled'
        Registry 'DisableLockScreenAppNotifications' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\System'
            ValueName = 'DisableLockScreenAppNotifications'
            ValueType = 'DWord'
            ValueData = '1'
        }

        # 18.8.25.6 (L1) Ensure 'Turn on convenience PIN sign-in' is set to 'Disabled
        Registry 'AllowDomainPINLogon' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\System'
            ValueName = 'AllowDomainPINLogon'
            ValueType = 'DWord'
            ValueData = '0'
        }

        # 18.9.30.2 (L1) Ensure 'Configure Windows SmartScreen' is set to 'Enabled' 
        Registry 'EnableSmartScreen' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\System'
            ValueName = 'EnableSmartScreen'
            ValueType = 'DWord'
            ValueData = '1'
        }

        # 18.4.21.1 (L1) Ensure 'Minimize the number of simultaneous connections to the Internet or a Windows Domain' is set to 'Enabled'
        Registry 'fMinimizeConnections' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WcmSvc\GroupPolicy'
            ValueName = 'fMinimizeConnections'
            ValueType = 'DWord'
            ValueData = '1'
        }

        # 18.9.54.2 (L1) Ensure 'Allow Cortana' is set to 'Disabled'
        Registry 'AllowCortana' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Windows Search'
            ValueName = 'AllowCortana'
            ValueType = 'DWord'
            ValueData = '0'
        }

        # 18.9.54.3 (L1) Ensure 'Allow Cortana above lock screen' is set to 'Disabled'
        Registry 'AllowCortanaAboveLock' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Windows Search'
            ValueName = 'AllowCortanaAboveLock'
            ValueType = 'DWord'
            ValueData = '0'
        }

        # 18.9.54.4 (L1) Ensure 'Allow indexing of encrypted files' is set to 'Disabled'
        Registry 'AllowIndexingEncryptedStoresOrItems' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Windows Search'
            ValueName = 'AllowIndexingEncryptedStoresOrItems'
            ValueType = 'DWord'
            ValueData = '0'
        }

        # 18.9.54.5 (L1) Ensure 'Allow search and Cortana to use location' is set to 'Disabled'
        Registry 'AllowSearchToUseLocation' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Windows Search'
            ValueName = 'AllowSearchToUseLocation'
            ValueType = 'DWord'
            ValueData = '0'
        }

        # 18.9.90.2 (L1) Ensure 'Configure Automatic Updates' is set to 'Enabled' 
        Registry 'NoAutoUpdate' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate\AU'
            ValueName = 'NoAutoUpdate'
            ValueType = 'DWord'
            ValueData = '0'
        }

        # 18.9.90.2 (L1) Ensure 'Configure Automatic Updates' is set to 'Enabled' 
        Registry 'AUOptions' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate\AU'
            ValueName = 'AUOptions'
            ValueType = 'DWord'
            ValueData = '5'
        }

        # 18.9.90.2 (L1) Ensure 'Configure Automatic Updates' is set to 'Enabled' 
        Registry 'AutomaticMaintenanceEnabled' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate\AU'
            ValueName = 'AutomaticMaintenanceEnabled'
            ValueType = 'String'
            ValueData = ' '
        }

        # 18.9.90.3 (L1) Ensure 'Configure Automatic Updates: Scheduled install day' is set to '0 - Every day' 
        Registry 'ScheduledInstallDay' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate\AU'
            ValueName = 'ScheduledInstallDay'
            ValueType = 'DWord'
            ValueData = '0'
        }

        # 18.9.90.3 (L1) Ensure 'Configure Automatic Updates: Scheduled install day' is set to '0 - Every day' 
        Registry 'ScheduledInstallTime' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate\AU'
            ValueName = 'ScheduledInstallTime'
            ValueType = 'DWord'
            ValueData = '3'
        }

        # 18.9.90.3 (L1) Ensure 'Configure Automatic Updates: Scheduled install day' is set to '0 - Every day' 
        Registry 'AllowMUUpdateService' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate\AU'
            ValueName = 'AllowMUUpdateService'
            ValueType = 'String'
            ValueData = ' '
        }

        # 18.9.90.4 (L1) Ensure 'No auto-restart with logged on users for scheduled automatic updates installations' is set to 'Disabled' 
        Registry 'NoAutoRebootWithLoggedOnUsers' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate\AU'
            ValueName = 'NoAutoRebootWithLoggedOnUsers'
            ValueType = 'DWord'
            ValueData = '0'
        }

        # 18.9.90.1.1 (L1) Ensure 'Select when Feature Updates are received' is set to 'Enabled: Current Branch for Business, 180 days'
        Registry 'DeferFeatureUpdates' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate'
            ValueName = 'DeferFeatureUpdates'
            ValueType = 'DWord'
            ValueData = '1'
        }

        # 18.9.90.1.1 (L1) Ensure 'Select when Feature Updates are received' is set to 'Enabled: Current Branch for Business, 180 days'
        Registry 'BranchReadinessLevel' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate'
            ValueName = 'BranchReadinessLevel'
            ValueType = 'DWord'
            ValueData = '32'
        }

        # 18.9.90.1.1 (L1) Ensure 'Select when Feature Updates are received' is set to 'Enabled: Current Branch for Business, 180 days'
        Registry 'DeferFeatureUpdatesPeriodInDays' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate'
            ValueName = 'DeferFeatureUpdatesPeriodInDays'
            ValueType = 'DWord'
            ValueData = '180'
        }

        # 18.9.90.1.1 (L1) Ensure 'Select when Feature Updates are received' is set to 'Enabled: Current Branch for Business, 180 days'
        Registry 'PauseFeatureUpdatesStartTime' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate'
            ValueName = 'PauseFeatureUpdatesStartTime'
            ValueType = 'String'
            ValueData = ''
        }

        # 18.9.90.1.2 (L1) Ensure 'Select when Quality Updates are received' is set to 'Enabled: 0 days'
        Registry 'DeferQualityUpdates' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate'
            ValueName = 'DeferQualityUpdates'
            ValueType = 'DWord'
            ValueData = '1'
        }

        # 18.9.90.1.2 (L1) Ensure 'Select when Quality Updates are received' is set to 'Enabled: 0 days'
        Registry 'DeferQualityUpdatesPeriodInDays' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate'
            ValueName = 'DeferQualityUpdatesPeriodInDays'
            ValueType = 'DWord'
            ValueData = '0'
        }

        # 18.9.90.1.2 (L1) Ensure 'Select when Quality Updates are received' is set to 'Enabled: 0 days'
        Registry 'PauseQualityUpdatesStartTime' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate'
            ValueName = 'PauseQualityUpdatesStartTime'
            ValueType = 'String'
            ValueData = ''
        }

        # 18.9.86.1.1 (L1) Ensure 'Allow Basic authentication' is set to 'Disabled'
        Registry 'AllowBasic' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WinRM\Client'
            ValueName = 'AllowBasic'
            ValueType = 'DWord'
            ValueData = '0'
        }

        # 18.9.86.1.2 (L1) Ensure 'Allow unencrypted traffic' is set to 'Disabled'
        Registry 'AllowUnencryptedTraffic' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WinRM\Client'
            ValueName = 'AllowUnencryptedTraffic'
            ValueType = 'DWord'
            ValueData = '0'
        }

        # 18.9.86.1.3 (L1) Ensure 'Disallow Digest authentication' is set to 'Enabled'
        Registry 'AllowDigest' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WinRM\Client'
            ValueName = 'AllowDigest'
            ValueType = 'DWord'
            ValueData = '0'
        }

        # 18.9.86.2.1 (L1) Ensure 'Allow Basic authentication' is set to 'Disabled' 
        Registry 'AllowBasic1' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WinRM\Service'
            ValueName = 'AllowBasic'
            ValueType = 'DWord'
            ValueData = '0'
        }

        # 18.9.86.2.3 (L1) Ensure 'Allow unencrypted traffic' is set to 'Disabled'
        Registry 'AllowUnencryptedTraffic1' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WinRM\Service'
            ValueName = 'AllowUnencryptedTraffic'
            ValueType = 'DWord'
            ValueData = '0'
        }

        # 18.9.86.2.4 (L1) Ensure 'Disallow WinRM from storing RunAs credentials' is set to 'Enabled'
        Registry 'DisableRunAs' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WinRM\Service'
            ValueName = 'DisableRunAs'
            ValueType = 'DWord'
            ValueData = '1'
        }

        # 18.4.4.2 (L1) Ensure 'Turn off multicast name resolution' is set to 'Enabled' (MS Only) 
        Registry 'EnableMulticast' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\DNSClient'
            ValueName = 'EnableMulticast'
            ValueType = 'DWord'
            ValueData = '0'
        }

        # 18.8.26.1 (L1) Ensure 'Untrusted Font Blocking' is set to 'Enabled: Block untrusted fonts and log events'
        Registry 'MitigationOptions_FontBocking' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\MitigationOptions'
            ValueName = 'MitigationOptions_FontBocking'
            ValueType = 'String'
            ValueData = '1000000000000'
        }

        # 18.8.32.1 (L1) Ensure 'Enable RPC Endpoint Mapper Client Authentication' is set to 'Enabled' (MS only)
        Registry 'EnableAuthEpResolution' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Rpc'
            ValueName = 'EnableAuthEpResolution'
            ValueType = 'DWord'
            ValueData = '1'
        }

        # 18.9.52.2.2 (L1) Ensure 'Do not allow passwords to be saved' is set to 'Enabled'
        Registry 'DisablePasswordSaving' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Terminal Services'
            ValueName = 'DisablePasswordSaving'
            ValueType = 'DWord'
            ValueData = '1'
        }

        # 18.9.52.3.3.2 (L1) Ensure 'Do not allow drive redirection' is set to 'Enabled'
        Registry 'fDisableCdm' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Terminal Services'
            ValueName = 'fDisableCdm'
            ValueType = 'DWord'
            ValueData = '1'
        }

        # 18.9.52.3.9.3 (L1) Ensure 'Set client connection encryption level' is set to 'Enabled: High Level'
        Registry 'MinEncryptionLevel' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Terminal Services'
            ValueName = 'MinEncryptionLevel'
            ValueType = 'DWord'
            ValueData = '3'
        }

        # 18.9.52.3.9.2 (L1) Ensure 'Require secure RPC communication' is set to 'Enabled'
        Registry 'fEncryptRPCTraffic' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Terminal Services'
            ValueName = 'fEncryptRPCTraffic'
            ValueType = 'DWord'
            ValueData = '1'
        }

        # 18.9.52.3.9.1 (L1) Ensure 'Always prompt for password upon connection' is set to 'Enabled'
        Registry 'fPromptForPassword' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Terminal Services'
            ValueName = 'fPromptForPassword'
            ValueType = 'DWord'
            ValueData = '1'
        }

        # 18.9.52.3.11.1 (L1) Ensure 'Do not delete temp folders upon exit' is set to 'Disabled'
        Registry 'DeleteTempDirsOnExit' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Terminal Services'
            ValueName = 'DeleteTempDirsOnExit'
            ValueType = 'DWord'
            ValueData = '1'
        }

        # 18.9.52.3.11.2 (L1) Ensure 'Do not use temporary folders per session' is set to 'Disabled'
        Registry 'PerSessionTempDir' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Terminal Services'
            ValueName = 'PerSessionTempDir'
            ValueType = 'DWord'
            ValueData = '1'
        }

        # 9.1.7 (L1) Ensure 'Windows Firewall: Domain: Logging: Name' is set to '%SYSTEMROOT%\System32\logfiles\firewall\domainfw.log'
        Registry 'LogFilePath' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging'
            ValueName = 'LogFilePath'
            ValueType = 'String'
            ValueData = '%systemroot%\system32\logfiles\firewall\domainfw.log'
        }

        # 9.1.8 (L1) Ensure 'Windows Firewall: Domain: Logging: Size limit (KB)' is set to '16,384 KB or greater'
        Registry 'LogFileSize' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging'
            ValueName = 'LogFileSize'
            ValueType = 'DWord'
            ValueData = '16384'
        }

        # 9.1.9 (L1) Ensure 'Windows Firewall: Domain: Logging: Log dropped packets' is set to 'Yes'
        Registry 'LogDroppedPackets' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging'
            ValueName = 'LogDroppedPackets'
            ValueType = 'DWord'
            ValueData = '1'
        }

        # 9.1.10 (L1) Ensure 'Windows Firewall: Domain: Logging: Log successful connections' is set to 'Yes' 
        Registry 'LogSuccesssfulConnections' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging'
            ValueName = 'LogSuccesssfulConnections'
            ValueType = 'DWord'
            ValueData = '1'
        }

        # 9.1.1 (L1) Ensure 'Windows Firewall: Domain: Firewall state' is set to 'On (recommended)'
        Registry 'EnableFirewall' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\DomainProfile'
            ValueName = 'EnableFirewall'
            ValueType = 'DWord'
            ValueData = '1'
        }

        # 9.1.3 (L1) Ensure 'Windows Firewall: Domain: Outbound connections' is set to 'Allow (default)'
        Registry 'DefaultOutboundAction' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\DomainProfile'
            ValueName = 'DefaultOutboundAction'
            ValueType = 'DWord'
            ValueData = '0'
        }

        # 9.1.2 (L1) Ensure 'Windows Firewall: Domain: Inbound connections' is set to 'Block (default)'
        Registry 'DefaultInboundAction' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\DomainProfile'
            ValueName = 'DefaultInboundAction'
            ValueType = 'DWord'
            ValueData = '1'
        }

        # 9.1.4 (L1) Ensure 'Windows Firewall: Domain: Settings: Display a notification' is set to 'No'
        Registry 'DisableNotifications' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\DomainProfile'
            ValueName = 'DisableNotifications'
            ValueType = 'DWord'
            ValueData = '1'
        }

        # 9.1.5 (L1) Ensure 'Windows Firewall: Domain: Settings: Apply local firewall rules' is set to 'Yes (default)'
        Registry 'AllowLocalPolicyMerge' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\DomainProfile'
            ValueName = 'AllowLocalPolicyMerge'
            ValueType = 'DWord'
            ValueData = '1'
        }

        # 9.1.6 (L1) Ensure 'Windows Firewall: Domain: Settings: Apply local connection security rules' is set to 'Yes (default)'
        Registry 'AllowLocalIPsecPolicyMerge' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\DomainProfile'
            ValueName = 'AllowLocalIPsecPolicyMerge'
            ValueType = 'DWord'
            ValueData = '1'
        }

        # 9.2.7 (L1) Ensure 'Windows Firewall: Private: Logging: Name' is set to '%SYSTEMROOT%\System32\logfiles\firewall\privatefw.log'
        Registry 'LogFilePath1' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging'
            ValueName = 'LogFilePath'
            ValueType = 'String'
            ValueData = '%systemroot%\system32\logfiles\firewall\privatefw.log'
        }

        # 9.2.8 (L1) Ensure 'Windows Firewall: Private: Logging: Size limit (KB)' is set to '16,384 KB or greater'
        Registry 'LogFileSize1' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging'
            ValueName = 'LogFileSize'
            ValueType = 'DWord'
            ValueData = '16384'
        }

        # 9.2.9 (L1) Ensure 'Windows Firewall: Private: Logging: Log dropped packets' is set to 'Yes'
        Registry 'LogDroppedPackets1' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging'
            ValueName = 'LogDroppedPackets'
            ValueType = 'DWord'
            ValueData = '1'
        }

        # 9.2.10 (L1) Ensure 'Windows Firewall: Private: Logging: Log successful connections' is set to 'Yes'
        Registry 'LogSuccesssfulConnections1' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging'
            ValueName = 'LogSuccesssfulConnections'
            ValueType = 'DWord'
            ValueData = '1'
        }

        # 9.2.4 (L1) Ensure 'Windows Firewall: Private: Settings: Display a notification' is set to 'No' 
        Registry 'DisableNotifications1' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile'
            ValueName = 'DisableNotifications'
            ValueType = 'DWord'
            ValueData = '1'
        }

        # 9.2.5 (L1) Ensure 'Windows Firewall: Private: Settings: Apply local firewall rules' is set to 'Yes (default)'
        Registry 'AllowLocalPolicyMerge1' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile'
            ValueName = 'AllowLocalPolicyMerge'
            ValueType = 'DWord'
            ValueData = '1'
        }

        # 9.2.6 (L1) Ensure 'Windows Firewall: Private: Settings: Apply local connection security rules' is set to 'Yes (default)'
        Registry 'AllowLocalIPsecPolicyMerge1' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile'
            ValueName = 'AllowLocalIPsecPolicyMerge'
            ValueType = 'DWord'
            ValueData = '1'
        }

        # 9.2.1 (L1) Ensure 'Windows Firewall: Private: Firewall state' is set to 'On (recommended)'
        Registry 'EnableFirewall1' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile'
            ValueName = 'EnableFirewall'
            ValueType = 'DWord'
            ValueData = '1'
        }

        # 9.2.3 (L1) Ensure 'Windows Firewall: Private: Outbound connections' is set to 'Allow (default)'
        Registry 'DefaultOutboundAction1' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile'
            ValueName = 'DefaultOutboundAction'
            ValueType = 'DWord'
            ValueData = '0'
        }

        # 9.2.2 (L1) Ensure 'Windows Firewall: Private: Inbound connections' is set to 'Block (default)'
        Registry 'DefaultInboundAction1' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile'
            ValueName = 'DefaultInboundAction'
            ValueType = 'DWord'
            ValueData = '1'
        }

        # 9.3.7 (L1) Ensure 'Windows Firewall: Public: Logging: Name' is set to '%SYSTEMROOT%\System32\logfiles\firewall\publicfw.log'
        Registry 'LogFilePath2' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging'
            ValueName = 'LogFilePath'
            ValueType = 'String'
            ValueData = '%systemroot%\system32\logfiles\firewall\publicfw.log'
        }

        # 9.3.8 (L1) Ensure 'Windows Firewall: Public: Logging: Size limit (KB)' is set to '16,384 KB or greater'
        Registry 'LogFileSize2' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging'
            ValueName = 'LogFileSize'
            ValueType = 'DWord'
            ValueData = '16384'
        }

        # 9.3.9 (L1) Ensure 'Windows Firewall: Public: Logging: Log dropped packets' is set to 'Yes'
        Registry 'LogDroppedPackets2' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging'
            ValueName = 'LogDroppedPackets'
            ValueType = 'DWord'
            ValueData = '1'
        }

        # 9.3.10 (L1) Ensure 'Windows Firewall: Public: Logging: Log successful connections' is set to 'Yes'
        Registry 'LogSuccesssfulConnections2' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging'
            ValueName = 'LogSuccesssfulConnections'
            ValueType = 'DWord'
            ValueData = '1'
        }

        # 9.3.4 (L1) Ensure 'Windows Firewall: Public: Settings: Display a notification' is set to 'Yes'
        Registry 'DisableNotifications2' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PublicProfile'
            ValueName = 'DisableNotifications'
            ValueType = 'DWord'
            ValueData = '0'
        }

        # 9.3.5 (L1) Ensure 'Windows Firewall: Public: Settings: Apply local firewall rules' is set to 'No'
        Registry 'AllowLocalPolicyMerge2' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PublicProfile'
            ValueName = 'AllowLocalPolicyMerge'
            ValueType = 'DWord'
            ValueData = '0'
        }

        # 9.3.6 (L1) Ensure 'Windows Firewall: Public: Settings: Apply local connection security rules' is set to 'No'
        Registry 'AllowLocalIPsecPolicyMerge2' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PublicProfile'
            ValueName = 'AllowLocalIPsecPolicyMerge'
            ValueType = 'DWord'
            ValueData = '0'
        }

        # 9.3.1 (L1) Ensure 'Windows Firewall: Public: Firewall state' is set to 'On (recommended)'
        Registry 'EnableFirewall2' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PublicProfile'
            ValueName = 'EnableFirewall'
            ValueType = 'DWord'
            ValueData = '1'
        }

        # 9.3.3 (L1) Ensure 'Windows Firewall: Public: Outbound connections' is set to 'Allow (default)'
        Registry 'DefaultOutboundAction2' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PublicProfile'
            ValueName = 'DefaultOutboundAction'
            ValueType = 'DWord'
            ValueData = '0'
        }

        # 9.3.2 (L1) Ensure 'Windows Firewall: Public: Inbound connections' is set to 'Block (default)'
        Registry 'DefaultInboundAction2' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PublicProfile'
            ValueName = 'DefaultInboundAction'
            ValueType = 'DWord'
            ValueData = '1'
        }

        # 18.9.73.2 (L1) Ensure 'Allow Windows Ink Workspace' is set to 'Enabled: On, but disallow access above lock' OR 'Disabled' but not 'Enabled: On'
        Registry 'AllowWindowsInkWorkspace' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsInkWorkspace'
            ValueName = 'AllowWindowsInkWorkspace'
            ValueType = 'DWord'
            ValueData = '1'
        }

        # 18.9.61.2 (L1) Ensure 'Turn off Automatic Download and Install of updates' is set to 'Disabled
        Registry 'AutoDownload' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsStore'
            ValueName = 'AutoDownload'
            ValueType = 'DWord'
            ValueData = '4'
        }

        # 18.9.61.3 (L1) Ensure 'Turn off the offer to update to the latest version of Windows' is set to 'Enabled' 
        Registry 'DisableOSUpgrade' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsStore'
            ValueName = 'DisableOSUpgrade'
            ValueType = 'DWord'
            ValueData = '1'
        }

        # 18.2.2 (L1) Ensure 'Do not allow password expiration time longer than required by policy' is set to 'Enabled' (MS only)
        Registry 'PwdExpirationProtectionEnabled' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft Services\AdmPwd'
            ValueName = 'PwdExpirationProtectionEnabled'
            ValueType = 'DWord'
            ValueData = '1'
        }

        # # 18.2.3 (L1) Ensure 'Enable Local Admin Password Management' is set to 'Enabled' (MS only)
        Registry 'AdmPwdEnabled' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft Services\AdmPwd'
            ValueName = 'AdmPwdEnabled'
            ValueType = 'DWord'
            ValueData = '1'
        }

        # 18.2.4 (L1) Ensure 'Password Settings: Password Complexity' is set to 'Enabled: Large letters + small letters + numbers + special characters' (MS only)
        Registry 'PasswordComplexity' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft Services\AdmPwd'
            ValueName = 'PasswordComplexity'
            ValueType = 'DWord'
            ValueData = '4'
        }

        # 18.2.5 (L1) Ensure 'Password Settings: Password Length' is set to 'Enabled: 15 or more' (MS only)
        Registry 'PasswordLength' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft Services\AdmPwd'
            ValueName = 'PasswordLength'
            ValueType = 'DWord'
            ValueData = '15'
        }

        # 18.2.6 (L1) Ensure 'Password Settings: Password Age (Days)' is set to 'Enabled: 30 or fewer' (MS only)
        Registry 'PasswordAgeDays' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft Services\AdmPwd'
            ValueName = 'PasswordAgeDays'
            ValueType = 'DWord'
            ValueData = '30'
        }

        # 18.3.1 (L1) Ensure 'MSS: (AutoAdminLogon) Enable Automatic Logon (not recommended)' is set to 'Disabled'
        Registry 'AutoAdminLogon' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon'
            ValueName = 'AutoAdminLogon'
            ValueType = 'String'
            ValueData = '0'
        }

        # 18.8.31.2 (L1) Ensure 'Configure Solicited Remote Assistance' is set to 'Disabled' 
        Registry 'fAllowToGetHelp' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services'
            ValueName = 'fAllowToGetHelp'
            ValueType = 'String'
            ValueData = '0'
        }

        # 18.8.31.1 (L1) Ensure 'Configure Offer Remote Assistance' is set to 'Disabled'
        Registry 'fAllowUnsolicited' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services'
            ValueName = 'fAllowUnsolicited'
            ValueType = 'String'
            ValueData = '0'
        }

        # 18.3.9 (L1) Ensure 'MSS: (ScreenSaverGracePeriod) The time in seconds before the screen saver grace period expires (0 recommended)' is set to 'Enabled: 5 or fewer seconds'
        Registry 'ScreenSaverGracePeriod' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon'
            ValueName = 'ScreenSaverGracePeriod'
            ValueType = 'String'
            ValueData = '5'
        }

        # 17.1.1 (L1) Ensure 'Audit Credential Validation' is set to 'Success and Failure'
        AuditPolicySubcategory 'Audit Credential Validation (Failure)' {
            Name      = 'Credential Validation'
            Ensure    = 'Present'
            AuditFlag = 'Failure'
        }

        # 17.1.1 (L1) Ensure 'Audit Credential Validation' is set to 'Success and Failure'
        AuditPolicySubcategory 'Audit Credential Validation (Success)' {
            Name      = 'Credential Validation'
            Ensure    = 'Present'
            AuditFlag = 'Success'
        }

        # 17.2.1 (L1) Ensure 'Audit Application Group Management' is set to 'Success and Failure'
        AuditPolicySubcategory 'Audit Application Group Management (Failure)' {
            Name      = 'Application Group Management'
            Ensure    = 'Present'
            AuditFlag = 'Failure'
        }

        # 17.2.1 (L1) Ensure 'Audit Application Group Management' is set to 'Success and Failure'
        AuditPolicySubcategory 'Audit Application Group Management (Success)' {
            Name      = 'Application Group Management'
            Ensure    = 'Present'
            AuditFlag = 'Success'
        }

        # 17.2.2 (L1) Ensure 'Audit Computer Account Management' is set to 'Success and Failure'
        AuditPolicySubcategory 'Audit Computer Account Management (Failure)' {
            Name      = 'Computer Account Management'
            Ensure    = 'Present'
            AuditFlag = 'Failure'
        }

        # 17.2.2 (L1) Ensure 'Audit Computer Account Management' is set to 'Success and Failure'
        AuditPolicySubcategory 'Audit Computer Account Management (Success)' {
            Name      = 'Computer Account Management'
            Ensure    = 'Present'
            AuditFlag = 'Success'
        }

        # 17.2.4 (L1) Ensure 'Audit Other Account Management Events' is set to 'Success and Failure'
        AuditPolicySubcategory 'Audit Other Account Management Events (Failure)' {
            Name      = 'Other Account Management Events'
            Ensure    = 'Present'
            AuditFlag = 'Failure'
        }

        # 17.2.4 (L1) Ensure 'Audit Other Account Management Events' is set to 'Success and Failure'
        AuditPolicySubcategory 'Audit Other Account Management Events (Success)' {
            Name      = 'Other Account Management Events'
            Ensure    = 'Present'
            AuditFlag = 'Success'
        }

        # 17.2.5 (L1) Ensure 'Audit Security Group Management' is set to 'Success and Failure'
        AuditPolicySubcategory 'Audit Security Group Management (Failure)' {
            Name      = 'Security Group Management'
            Ensure    = 'Present'
            AuditFlag = 'Failure'
        }

        # 17.2.5 (L1) Ensure 'Audit Security Group Management' is set to 'Success and Failure'
        AuditPolicySubcategory 'Audit Security Group Management (Success)' {
            Name      = 'Security Group Management'
            Ensure    = 'Present'
            AuditFlag = 'Success'
        }

        # 17.2.6 (L1) Ensure 'Audit User Account Management' is set to 'Success and Failure'
        AuditPolicySubcategory 'Audit User Account Management (Failure)' {
            Name      = 'User Account Management'
            Ensure    = 'Present'
            AuditFlag = 'Failure'
        }

        # 17.2.6 (L1) Ensure 'Audit User Account Management' is set to 'Success and Failure'
        AuditPolicySubcategory 'Audit User Account Management (Success)' {
            Name      = 'User Account Management'
            Ensure    = 'Present'
            AuditFlag = 'Success'
        }

        # 17.3.1 (L1) Ensure 'Audit PNP Activity' is set to 'Success'
        AuditPolicySubcategory 'Audit PNP Activity (Success)' {
            Name      = 'Plug and Play Events'
            Ensure    = 'Present'
            AuditFlag = 'Success'
        }

        # 17.3.2 (L1) Ensure 'Audit Process Creation' is set to 'Success'
        AuditPolicySubcategory 'Audit Process Creation (Success)' {
            Name      = 'Process Creation'
            Ensure    = 'Present'
            AuditFlag = 'Success'
        }

        # 17.5.1 (L1) Ensure 'Audit Account Lockout' is set to 'Success and Failure'
        AuditPolicySubcategory 'Audit Account Lockout (Success)' {
            Name      = 'Account Lockout'
            Ensure    = 'Present'
            AuditFlag = 'Success'
        }

        # 17.5.1 (L1) Ensure 'Audit Account Lockout' is set to 'Success and Failure'
        AuditPolicySubcategory 'Audit Account Lockout (Failure)' {
            Name      = 'Account Lockout'
            Ensure    = 'Present'
            AuditFlag = 'Failure'
        }

        # 17.5.2 (L1) Ensure 'Audit Group Membership' is set to 'Success'
        AuditPolicySubcategory 'Audit Group Membership (Success)' {
            Name      = 'Group Membership'
            Ensure    = 'Present'
            AuditFlag = 'Success'
        }

        # 17.5.3 (L1) Ensure 'Audit Logoff' is set to 'Success'
        AuditPolicySubcategory 'Audit Logoff (Success)' {
            Name      = 'Logoff'
            Ensure    = 'Present'
            AuditFlag = 'Success'
        }

        # 17.5.4 (L1) Ensure 'Audit Logon' is set to 'Success and Failure'
        AuditPolicySubcategory 'Audit Logon (Success)' {
            Name      = 'Logon'
            Ensure    = 'Present'
            AuditFlag = 'Success'
        }

        # 17.5.4 (L1) Ensure 'Audit Logon' is set to 'Success and Failure'
        AuditPolicySubcategory 'Audit Logon (Failure)' {
            Name      = 'Logon'
            Ensure    = 'Present'
            AuditFlag = 'Failure'
        }

        # 17.5.5 (L1) Ensure 'Audit Other Logon/Logoff Events' is set to 'Success and Failure'
        AuditPolicySubcategory 'Audit Other Logon/Logoff Events (Failure)' {
            Name      = 'Other Logon/Logoff Events'
            Ensure    = 'Present'
            AuditFlag = 'Failure'
        }

        # 17.5.5 (L1) Ensure 'Audit Other Logon/Logoff Events' is set to 'Success and Failure'
        AuditPolicySubcategory 'Audit Other Logon/Logoff Events (Success)' {
            Name      = 'Other Logon/Logoff Events'
            Ensure    = 'Present'
            AuditFlag = 'Success'
        }

        # 17.5.6 (L1) Ensure 'Audit Special Logon' is set to 'Success'
        AuditPolicySubcategory 'Audit Special Logon (Success)' {
            Name      = 'Special Logon'
            Ensure    = 'Present'
            AuditFlag = 'Success'
        }

        # 17.6.1 (L1) Ensure 'Audit Removable Storage' is set to 'Success and Failure'
        AuditPolicySubcategory 'Audit Removable Storage (Success)' {
            Name      = 'Removable Storage'
            Ensure    = 'Present'
            AuditFlag = 'Success'
        }

        # 17.6.1 (L1) Ensure 'Audit Removable Storage' is set to 'Success and Failure'
        AuditPolicySubcategory 'Audit Removable Storage (Failure)' {
            Name      = 'Removable Storage'
            Ensure    = 'Present'
            AuditFlag = 'Failure'
        }

        # 17.7.1 (L1) Ensure 'Audit Audit Policy Change' is set to 'Success and Failure'
        AuditPolicySubcategory 'Audit Policy Change (Success)' {
            Name      = 'Audit Policy Change'
            Ensure    = 'Present'
            AuditFlag = 'Success'
        }

        # 17.7.1 (L1) Ensure 'Audit Audit Policy Change' is set to 'Success and Failure'
        AuditPolicySubcategory 'Audit Policy Change (Failure)' {
            Name      = 'Audit Policy Change'
            Ensure    = 'Present'
            AuditFlag = 'Failure'
        }

        # 17.7.2 (L1) Ensure 'Audit Authentication Policy Change' is set to 'Success'
        AuditPolicySubcategory 'Audit Authentication Policy Change (Success)' {
            Name      = 'Authentication Policy Change'
            Ensure    = 'Present'
            AuditFlag = 'Success'
        }

        # 17.7.3 (L1) Ensure 'Audit Authorization Policy Change' is set to 'Success'
        AuditPolicySubcategory 'Audit Authorization Policy Change (Success)' {
            Name      = 'Authorization Policy Change'
            Ensure    = 'Present'
            AuditFlag = 'Success'
        }

        # 17.8.1 (L1) Ensure 'Audit Sensitive Privilege Use' is set to 'Success and Failure'
        AuditPolicySubcategory 'Audit Sensitive Privilege Use (Failure)' {
            Name      = 'Sensitive Privilege Use'
            Ensure    = 'Present'
            AuditFlag = 'Failure'
        }

        # 17.8.1 (L1) Ensure 'Audit Sensitive Privilege Use' is set to 'Success and Failure'
        AuditPolicySubcategory 'Audit Sensitive Privilege Use (Success)' {
            Name      = 'Sensitive Privilege Use'
            Ensure    = 'Present'
            AuditFlag = 'Success'
        }

        # 17.9.1 (L1) Ensure 'Audit IPsec Driver' is set to 'Success and Failure'
        AuditPolicySubcategory 'Audit IPsec Driver (Failure)' {
            Name      = 'IPsec Driver'
            Ensure    = 'Present'
            AuditFlag = 'Failure'
        }

        # 17.9.1 (L1) Ensure 'Audit IPsec Driver' is set to 'Success and Failure'
        AuditPolicySubcategory 'Audit IPsec Driver (Success)' {
            Name      = 'IPsec Driver'
            Ensure    = 'Present'
            AuditFlag = 'Success'
        }

        # 17.9.2 (L1) Ensure 'Audit Other System Events' is set to 'Success and Failure'
        AuditPolicySubcategory 'Audit Other System Events (Failure)' {
            Name      = 'Other System Events'
            Ensure    = 'Present'
            AuditFlag = 'Failure'
        }

        # 17.9.2 (L1) Ensure 'Audit Other System Events' is set to 'Success and Failure'
        AuditPolicySubcategory 'Audit Other System Events (Success)' {
            Name      = 'Other System Events'
            Ensure    = 'Present'
            AuditFlag = 'Success'
        }

        # 17.9.3 (L1) Ensure 'Audit Security State Change' is set to 'Success'
        AuditPolicySubcategory 'Audit Security State Change (Success)' {
            Name      = 'Security State Change'
            Ensure    = 'Present'
            AuditFlag = 'Success'
        }

        # 17.9.4 (L1) Ensure 'Audit Security System Extension' is set to 'Success and Failure'
        AuditPolicySubcategory 'Audit Security System Extension (Failure)' {
            Name      = 'Security State Change'
            Ensure    = 'Present'
            AuditFlag = 'Failure'
        }

        # 17.9.4 (L1) Ensure 'Audit Security System Extension' is set to 'Success and Failure'
        AuditPolicySubcategory 'Audit Security System Extension (Success)' {
            Name      = 'Security State Change'
            Ensure    = 'Present'
            AuditFlag = 'Success'
        }

        # 17.9.5 (L1) Ensure 'Audit System Integrity' is set to 'Success and Failure'
        AuditPolicySubcategory 'Audit System Integrity (Failure)' {
            Name      = 'System Integrity'
            Ensure    = 'Present'
            AuditFlag = 'Failure'
        }

        # 17.9.5 (L1) Ensure 'Audit System Integrity' is set to 'Success and Failure'
        AuditPolicySubcategory 'Audit System Integrity (Success)' {
            Name      = 'System Integrity'
            Ensure    = 'Present'
            AuditFlag = 'Success'
        }

    }

}

ServerBaseline

# Start a DSC Configuration run
Start-DscConfiguration -Force -Wait -Verbose -Path .\ServerBaseline
