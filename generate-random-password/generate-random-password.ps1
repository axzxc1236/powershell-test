if (!$character_table) {
    Set-Variable character_table -Option Constant -value "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz123456789``~!@#$%^&*()_-+=\|[]{}',./<>?"""
}
# ` is escape character, so there are two ` in $character_table
Function Get-NewPassword() {
    param (
      [int] $length
    )
    $output = ""
    if (!$length) {
        $length=10
    }
    for ($i=0; $i -lt $length; $i++) {
        $random = Get-Random -Minimum 0 -Maximum $character_table.Length
        $output += $character_table.Substring($random, 1)
    }
    return $output
}

Write-Host (Get-NewPassword 26)