$ErrorActionPreference = 'Stop'
$site = $PSScriptRoot
$repo = Split-Path $site -Parent
$notebooks = Join-Path $repo 'fta_revision_assessment/notebooks'
$base = '01_fta_patterns_mechanisms_consequences'
$htmlPath = Join-Path $notebooks "$base.html"
$assets = Join-Path $notebooks "${base}_files"
$imgs = Join-Path $repo 'fta_revision_assessment/imgs'
New-Item -ItemType Directory -Force -Path (Join-Path $site 'imgs') | Out-Null
Copy-Item -Recurse -Force $assets $site
foreach ($name in @('review_climate_pca_loadings.png', 'review_climate_predictor_correlations.png', 'review_range_rule_sensitivity.png')) {
  Copy-Item -Force (Join-Path $imgs $name) (Join-Path $site 'imgs')
}
$html = [IO.File]::ReadAllText($htmlPath).Replace('../imgs/', 'imgs/')
[IO.File]::WriteAllText((Join-Path $site 'index.html'), $html, [Text.UTF8Encoding]::new($false))
Write-Host 'Site refreshed. Review index.html before publishing.'
