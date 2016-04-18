#!/bin/bash

set -e

RELEASE=2.0.0.10

devel-su sed -i -e "s|^adaptation=.*$|adaptation=http://repo.merproject.org/obs/nemo:/testing:/hw:/lge:/mako/sailfish_latest_armv7hl/|" \
/usr/share/ssu/repos.ini

ssu dr adaptation0

ssu release $RELEASE
ssu dr extra
ssu dr mw
ssu ar mw http://repo.merproject.org/obs/nemo:/testing:/hw:/common/sailfish_latest_armv7hl/
ssu er mw
ssu ar dhd http://repo.merproject.org/obs/nemo:/testing:/hw:/lge:/mako/sailfish_latest_armv7hl/

echo "BELOW: double-triple check that no -two- enabled repos point to the same URL"
ssu lr
echo "ABOVE: double-triple check that no -two- enabled repos point to the same URL"
# ^ double-triple check that no -two- enabled repos point to the same URL

# You may have many of OpenRepos enabled. It's recommended to disable them, even
# though version --dup will do its best-effort to isolate repositories:
echo "Below: it's recommended to disable OpenRepos during upgrade. \nSee if any OpenRepos repository is enabled"
ssu lr | grep openrepos

