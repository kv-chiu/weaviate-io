#!/bin/bash
set -e

# For Netlify - change robot.txt to Disallow - so that crawlers will ignore it
mv build/robots.txt build/robots.txt.live
echo -e "User-agent: *
Disallow: /" >> build/robots.txt

# Get the current branch
export CURRENT_BRANCH=$(git branch --show-current)

# sudo netlify deploy --dir=build --site=tangerine-buttercream-20c32f >> netlify.out
./node_modules/.bin/netlify deploy --dir=build --alias ${CURRENT_BRANCH}--site=tangerine-buttercream-20c32f > netlify.out

# Bring back the original robots.txt file
rm build/robots.txt
mv build/robots.txt.live build/robots.txt
