# Module manifest for module 'DRSRule'
# Generated by: Luc Dekens, Matt Boren
# Generated on: 1/7/2015

@{
	# Script module or binary module file associated with this manifest.
	RootModule = 'DRSRule.psm1'

	# Version number of this module.
	ModuleVersion = '1.2.1'

	# ID used to uniquely identify this module
	GUID = 'f7edec59-261e-43e3-818c-6d92653ff05c'

	# Author of this module
	Author = 'Luc Dekens, Matt Boren'

	# Company or vendor of this module
	CompanyName = 'PowerCLIGoodies'

	# Copyright statement for this module
	Copyright = 'MIT License (included in module)'

	# Description of the functionality provided by this module
	Description = 'Module with functions to manage VMware DRS rule items (rules, VM- and VMHost groups, etc)'

	# Minimum version of the Windows PowerShell engine required by this module
	PowerShellVersion = '4.0'

	# Name of the Windows PowerShell host required by this module
	# PowerShellHostName = ''

	# Minimum version of the Windows PowerShell host required by this module
	# PowerShellHostVersion = ''

	# Minimum version of Microsoft .NET Framework required by this module
	# DotNetFrameworkVersion = ''

	# Minimum version of the common language runtime (CLR) required by this module
	# CLRVersion = ''

	# Processor architecture (None, X86, Amd64) required by this module
	# ProcessorArchitecture = ''

	# Modules that must be imported into the global environment prior to importing this module
	RequiredModules = @('VMware.Vim')

	# Assemblies that must be loaded prior to importing this module
	#RequiredAssemblies = 'VMware.Vim.dll'

	# Script files (.ps1) that are run in the caller's environment prior to importing this module.
	ScriptsToProcess = 'DRSRule.init.ps1'

	# Type files (.ps1xml) to be loaded when importing this module
	# TypesToProcess = @()

	# Format files (.ps1xml) to be loaded when importing this module
	FormatsToProcess = 'DRSRule.format.ps1xml'

	# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
	NestedModules = 'DRSRuleUtil'

	# Functions to export from this module
	FunctionsToExport = 'Get-DrsVMGroup','Get-DrsVMHostGroup','Get-DrsVMToVMHostRule','Get-DrsVMToVMRule',
	    'New-DrsVMGroup','New-DrsVMHostGroup','New-DrsVMToVMHostRule','New-DrsVMToVMRule',
	    'Remove-DrsVMGroup','Remove-DrsVMHostGroup','Remove-DrsVMToVMHostRule','Remove-DrsVMToVMRule',
	    'Set-DrsVMGroup','Set-DrsVMHostGroup','Set-DrsVMToVMHostRule','Set-DrsVMToVMRule',
	    'Import-DrsRule','Export-DrsRule'

	# Cmdlets to export from this module
	CmdletsToExport = '*'

	# Variables to export from this module
	VariablesToExport = '*'

	# Aliases to export from this module
	AliasesToExport = '*'

	# List of all modules packaged with this module
	# ModuleList = @()

	# List of all files packaged with this module
	FileList = 'DRSRule.psm1','DRSRule.psd1',
	   'DRSRuleUtil.psm1','DRSRuleUtil.psd1',
	   'DRSRule.format.ps1xml','DRSRule.init.ps1','DRSRule.Help.xml','About_DRSRule.help.txt'

	# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
	PrivateData = @{
	    PSData = @{
	        # Tags applied to this module. These help with module discovery in online galleries.
	        Tags = 'DRS', 'DRSRule', 'VMware DRS', 'VMGroup', 'VMHostGroup', 'VMToVMRule', 'VMToVMHostRule'

	        # A URL to the license for this module.
	        LicenseUri = 'https://github.com/PowerCLIGoodies/DRSRule/blob/master/MITLicense.txt'

	        # A URL to the main website for this project.
	        ProjectUri = 'https://github.com/PowerCLIGoodies/DRSRule'

	        # A URL to an icon representing this module.
	        # IconUri = ''

	        # ReleaseNotes of this module
	        ReleaseNotes = 'see changelog at https://github.com/PowerCLIGoodies/DRSRule/blob/master/changelog.md'
	    } # end of PSData hashtable
	} # end of PrivateData hashtable

	# HelpInfo URI of this module
	# HelpInfoURI = ''

	# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
	# DefaultCommandPrefix = ''
}
