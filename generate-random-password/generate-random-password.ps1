﻿if (!$character_table) {Set-Variable -Name character_table -Option Constant -Value "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz123456789``~!@#$%^&*()_-+=\|[]{}',./<>?"""}
# ` is escape character, so there are two ` in $character_table
Function Get-NewPassword() {
	param (
		[int] $length
	)
	$output = ""
	if (!$length) {$length = 10}
	for ($i = 0; $i -lt $length; $i++) {
		$random = Get-Random -Minimum 0 -Maximum $character_table.Length
		$output += $character_table.Substring($random, 1)
	}
	return $output
}

Write-Host -Object (Get-NewPassword -length 26)