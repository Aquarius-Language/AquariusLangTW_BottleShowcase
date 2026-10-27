param([string]$Aqua = 'aqua', [string]$Target = 'wasm', [string[]]$LibraryTargets = @('windows-x64','web','android-arm64-v8a','android-x86_64'))
$ErrorActionPreference = 'Stop'
function Invoke-Aqua([string[]]$Arguments) {
    & $Aqua @Arguments
    if ($LASTEXITCODE -ne 0) { throw "aqua failed ($LASTEXITCODE): $Arguments" }
}
Invoke-Aqua @('library','build',(Join-Path $PSScriptRoot 'libraries/greeting'),'--targets',($LibraryTargets -join ','))
Invoke-Aqua @('bottle','update','--project',$PSScriptRoot,'--offline')
$output = switch ($Target) {
    'wasm' { 'dist/showcase.wasm' }
    'windows' { 'dist/showcase.exe' }
    'linux' { 'dist/showcase' }
    'web' { 'dist/web' }
    'android' { 'dist/showcase.apk' }
    default { throw "Unknown target: $Target" }
}
Invoke-Aqua @('build',$PSScriptRoot,'--target',$Target,'-o',(Join-Path $PSScriptRoot $output))
if ($Target -eq 'wasm') { Invoke-Aqua @('run',(Join-Path $PSScriptRoot $output)) }
