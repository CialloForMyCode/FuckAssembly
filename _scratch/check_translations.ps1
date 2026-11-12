# 结构比对：各语言 README 必须在骨架层面与 README_zh.md 一致
$root = 'C:\Users\11722\Desktop\FuckAssembly'

function Get-Sig([string]$path) {
    $t = Get-Content -LiteralPath $path -Raw -Encoding UTF8
    $lines = $t -split "`r?`n"
    [pscustomobject]@{
        Anchors     = (([regex]::Matches($t, '<a id="([^"]+)"></a>') | ForEach-Object { $_.Groups[1].Value }) -join ',')
        Urls        = @([regex]::Matches($t, '(?:\]\(|href="|src=")([^)"]+)') | ForEach-Object { $_.Groups[1].Value } | Sort-Object -Unique)
        Rules       = ($lines | Where-Object { $_ -eq '---' }).Count
        Alerts      = ($lines | Where-Object { $_ -match '^> \[!' }).Count
        H1          = ($lines | Where-Object { $_ -match '^# ' }).Count
        H2          = ($lines | Where-Object { $_ -match '^## ' }).Count
        H3          = ($lines | Where-Object { $_ -match '^### ' }).Count
        TableDelims = ($lines | Where-Object { $_ -match '^\|\s*(:?-+:?\s*\|)+$' }).Count
        NonEmpty    = ($lines | Where-Object { $_.Trim() -ne '' }).Count
        Bytes       = (Get-Item -LiteralPath $path).Length
    }
}

$ref = Get-Sig (Join-Path $root 'README_zh.md')

$targets = [ordered]@{
    'README.md'    = 'English'
    'README_ru.md' = 'Русский'
    'README_ko.md' = '한국어'
    'README_jp.md' = '日本語'
    'README_es.md' = 'Español'
    'README_fr.md' = 'Français'
    'README_de.md' = 'Deutsch'
}

foreach ($kv in $targets.GetEnumerator()) {
    $p = Join-Path $root $kv.Key
    if (-not (Test-Path -LiteralPath $p)) {
        Write-Output ("MISSING  {0}" -f $kv.Key)
        continue
    }
    $s = Get-Sig $p
    # 语言切换行：自身这一项不加链接、简体中文改为链接，故把这两个文件名从比较中剔除
    $refUrls = @($ref.Urls | Where-Object { $_ -ne 'README_zh.md' -and $_ -ne $kv.Key } | Sort-Object)
    $actUrls = @($s.Urls   | Where-Object { $_ -ne 'README_zh.md' -and $_ -ne $kv.Key } | Sort-Object)
    $bad = @()
    foreach ($prop in 'Anchors', 'Rules', 'Alerts', 'H1', 'H2', 'H3', 'TableDelims') {
        if ($s.$prop -ne $ref.$prop) { $bad += ("{0}: {1} != ref {2}" -f $prop, $s.$prop, $ref.$prop) }
    }
    if (($refUrls -join ',') -ne ($actUrls -join ',')) { $bad += "Urls differ" }
    $t = Get-Content -LiteralPath $p -Raw -Encoding UTF8
    $ling = if ($t -match ('<b>' + [regex]::Escape($kv.Value) + '</b>')) { 'bold-ok' } else { 'BOLD-MISSING' }
    $zhLink = if ($t -match 'README_zh\.md') { 'zh-link-ok' } else { 'ZH-LINK-MISSING' }
    if ($bad.Count -eq 0) {
        Write-Output ("OK       {0,-13} bytes={1,-6} nonEmpty={2,-4} {3} {4}" -f $kv.Key, $s.Bytes, $s.NonEmpty, $ling, $zhLink)
    } else {
        Write-Output ("MISMATCH {0}: {1} | {2} {3}" -f $kv.Key, ($bad -join ' ; '), $ling, $zhLink)
    }
}

# 中文残留检查（日语允许汉字；语言切换行含语言名也算正常）
foreach ($f in 'README.md', 'README_ru.md', 'README_ko.md', 'README_es.md', 'README_fr.md', 'README_de.md') {
    $p = Join-Path $root $f
    if (-not (Test-Path -LiteralPath $p)) { continue }
    $lines = Get-Content -LiteralPath $p -Encoding UTF8
    $hits = $lines | Where-Object { $_ -match '[\u4e00-\u9fff]' -and $_ -notmatch 'README_' -and $_ -notmatch '草死汇编' }
    if ($hits) {
        Write-Output ("CJK-LEFT {0}: {1} line(s), first: {2}" -f $f, $hits.Count, $hits[0].Trim())
    }
}
