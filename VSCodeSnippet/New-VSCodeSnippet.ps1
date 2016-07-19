function New-VSCodeSnippet
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$true,ValueFromPipelineByPropertyName=$true)]
        [string]$Language,

        [Parameter(Mandatory=$true,ValueFromPipelineByPropertyName=$true)]
        [string]$Name,

        [Parameter(Mandatory=$true,ValueFromPipelineByPropertyName=$true)]
        [string]$Prefix,

        [Parameter(Mandatory=$true,ValueFromPipelineByPropertyName=$true)]
        [string]$Body,

        [Parameter(Mandatory=$true,ValueFromPipelineByPropertyName=$true)]
        [string]$Description,

        [switch]$Insiders
    )

    begin {}

    process 
    {
        if ($Insiders)
        {
            $CodeDir = 'Code - Insiders'
        }
        else 
        {
            $CodeDir = 'Code'
        }

        Add-Type -Path "$PSScriptRoot\lib\Newtonsoft.Json.dll"
        . "$PSScriptRoot\Newtonsoft.json.ps1"

        $Path = "$ENV:AppData\$CodeDir\User\snippets\$Language.json"

        if (Test-Path $Path)
        {        
            $Json = Get-Content -Path $Path -Raw | ConvertFrom-JsonNewtonsoft
            # $Json | Out-File -Encoding ascii -Path 'C:\TestPowershell.json'
        }
        else 
        {
            $Null = New-Item -Path $Path 
            $Json = @{}
        }

        $Snippet = @{
            'prefix'      = $Prefix
            'body'        = $Body
            'description' = $Description
        }

        $json.add($Name,$Snippet)
        #$json | ConvertTo-JsonNewtonsoft | Out-File C:\TestPowerShell.json -encoding ascii                
        $Json | ConvertTo-JsonNewtonsoft | Out-File $Path -Encoding ascii -force
    }

    end {}
}