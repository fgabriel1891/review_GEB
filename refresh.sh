#!/bin/sh
set -eu

# Run after rendering the main notebook. Works from any directory.
site=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
repo=$(dirname "$site")
notebooks="$repo/fta_revision_assessment/notebooks"
base="01_fta_patterns_mechanisms_consequences"
images="$repo/fta_revision_assessment/imgs"

mkdir -p "$site/imgs"
cp -R "$notebooks/${base}_files" "$site/"
cp "$images/review_climate_pca_loadings.png" "$site/imgs/"
cp "$images/review_climate_predictor_correlations.png" "$site/imgs/"
cp "$images/review_range_rule_sensitivity.png" "$site/imgs/"
sed 's|../imgs/|imgs/|g' "$notebooks/$base.html" > "$site/index.html"

echo 'Site refreshed. Review index.html before publishing.'
