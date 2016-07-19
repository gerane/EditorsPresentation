Register-EditorCommand `
    -Name "Demo.Editors" `
    -DisplayName "Editors Demo" `
    -SuppressOutput `
    -ScriptBlock {
        param([Microsoft.PowerShell.EditorServices.Extensions.EditorContext]$context)        

        $script:EditorContext = $context

        $List = @(
            'Open this Presentation Repo',
            'Open Editors Blog Post',
            'OneDrive Demo',
            'Monaco Demo',
            'Snippet Demo',
            'Open EditorCommands Repo'
        )

        $Choices = [System.Management.Automation.Host.ChoiceDescription[]] @($List)
        $Selection = $host.ui.PromptForChoice('', "Please Select a Demo" , $choices,'0')
        $Demo = $List[$Selection]

        switch ($Demo)
        {
            'Open this Presentation Repo'
            {
                $Link = 'https://github.com/gerane/EditorsPresentation'
                $IExplore = "${ENV:ProgramFiles(x86)}\Internet Explorer\iexplore.exe"                            
                . $IExplore $Link
            }

            'Open Editors Blog Post'
            {
                $Link = 'http://brandonpadgett.com/releasepipeline/Part-2-Development-Environment/'
                $IExplore = "${ENV:ProgramFiles(x86)}\Internet Explorer\iexplore.exe"                            
                . $IExplore $Link
            }

            'OneDrive Demo'
            {
                $Link = 'https://1drv.ms/u/s!AtjVFRnUPSTLhMoEWPp1QzSJ2I72EQ'
                $IExplore = "${ENV:ProgramFiles(x86)}\Internet Explorer\iexplore.exe"                            
                . $IExplore $Link
            }

            'Monaco Demo'
            {
                $Link = 'https://microsoft.github.io/monaco-editor/index.html'
                $IExplore = "${ENV:ProgramFiles(x86)}\Internet Explorer\iexplore.exe"                            
                . $IExplore $Link
            }

            'Snippet Demo'
            {
                . "$PSScriptRoot\VSCodeSnippet\New-VSCodeSnippet.ps1"

                $Body = $script:EditorContext.CurrentFile.GetText($script:EditorContext.SelectedRange)

                $Name = Read-Host 'Please enter the Snippet Name'                
                $Prefix = Read-Host 'Please enter the Snippet Prefix'
                $Description = Read-Host 'Please enter the Snippet Description'
                $Language = 'powershell'
                $Insiders = $true

                New-VSCodeSnippet -Language $Language -Name $Name -Prefix $Prefix -Body $Body -Description $Description -Insiders:$Insiders
            }

            'Open EditorCommands Repo'
            {
                $Link = 'https://github.com/gerane/EditorCommands'
                $IExplore = "${ENV:ProgramFiles(x86)}\Internet Explorer\iexplore.exe"                            
                . $IExplore $Link
            }
        }
    }
