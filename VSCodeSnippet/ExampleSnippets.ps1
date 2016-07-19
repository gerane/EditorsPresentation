# Example of how Label Variables work
function ${name:Verb-Noun}
{
    [CmdletBinding($1)]
    param
    (
        $2
    )

    ${name}
    
    ${name:Test2}

}


## Advanced Function
function ${name:Verb-Noun}
{
    [CmdletBinding($1)]
    param
    (
        $2
    )

    Begin
    {

    }

    Process
    {
        
    }

    End
    {

    }
    
}


## CmdletBinding
[CmdletBinding($1)]


# If 
if ($1)
{
    $2
}


# else
else
{
    $1
}


# Parameter
[Parameter($1)]
[${Type:Enter Type Name}]${Name:Enter Variable Name}




if ($variable)
{
    
}


