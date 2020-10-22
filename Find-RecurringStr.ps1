#region help
<#
.SYNOPSIS
Find the first recurring charactor within the string given parameter.
.DESCRIPTION
Find the first recurring charactor within the string given parameter.

.PARAMETER foo
String value looking for a recurring charactor.

.NOTES
FunctionName : Find-RecurringStr
Created by   : Kei Nakai
Date Coded   : 10/22/2020 20:22:30
#>
#endregion
Function Find-RecurringStr{
[CmdletBinding()]
param (
    [Parameter(Mandatory=$true,
               HelpMessage="Find recurring charactor within this string.")]
    [string]$foo
    )
    PROCESS{

        For ($i=0;$i -le $foo.Length; $i++)
        {
            if (Get-Recurring($foo.Substring(0, $i)) != "")
            {
                return $foo.Substring($i -1, 1);
            }
        }

        function Get-Recurring{
            param (
                $strValue
            )
            return $strValue.ToCharArray() | group -NoElement | sort Count | where {$_.Count -gt 1} | % Name | select -last 1
        }
    }
}
