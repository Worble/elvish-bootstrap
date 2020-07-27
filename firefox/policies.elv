sudo mkdir -p /usr/lib/firefox/distribution/

# Removing in favour of native readers
# epub-reader = "https://addons.mozilla.org/firefox/downloads/file/3048083/latest"
ublock-origin = "https://addons.mozilla.org/firefox/downloads/file/3521827/latest"
https-everywhere = "https://addons.mozilla.org/firefox/downloads/file/3528100/latest"
privacy-badger = "https://addons.mozilla.org/firefox/downloads/file/3509922/latest"
keepassxc = "https://addons.mozilla.org/firefox/downloads/file/3535304/latest"
# Removing this in favour of temporary containers
# cookie-autodelete = "https://addons.mozilla.org/firefox/downloads/file/3530747/latest"
decentraleyes = "https://addons.mozilla.org/firefox/downloads/file/3539177/latest"
old-reddit-redirect = "https://addons.mozilla.org/firefox/downloads/file/3522186/latest"
invidition = "https://addons.mozilla.org/firefox/downloads/file/3437574/latest"
dark-fox-theme = "https://addons.mozilla.org/firefox/downloads/file/2419610/latest"
rss-preview = "https://addons.mozilla.org/firefox/downloads/file/3493414/latest"
play-with = "https://addons.mozilla.org/firefox/downloads/file/974448/latest"
dark-reader = "https://addons.mozilla.org/firefox/downloads/file/3606434/latest"
# Appears to be unmaintained, reenable if the developer comes back
# privacy-possum = "https://addons.mozilla.org/firefox/downloads/file/3360398/latest"
firefox-multi-account-containers = "https://addons.mozilla.org/firefox/downloads/file/3610087/latest"
temporary-containers = "https://addons.mozilla.org/firefox/downloads/file/3511233/latest"

policiesJson = (dirname (src)[name])'/policies.json'

json = (cat $policiesJson | from-json)

json[policies][Extensions][Install] = [ $ublock-origin $https-everywhere $privacy-badger $keepassxc $decentraleyes $old-reddit-redirect $invidition $dark-fox-theme $rss-preview $play-with $dark-reader $privacy-possum $firefox-multi-account-containers $temporary-containers ]

put $json | to-json | sudo tee /usr/lib/firefox/distribution/policies.json > /dev/null