sudo mkdir -p /usr/lib/firefox/distribution/

# Removing in favour of native readers
# epub-reader = "https://addons.mozilla.org/firefox/downloads/file/3048083/latest"

# Inbuilt learning disabled - consider renabling when https://github.com/EFForg/privacybadger/issues/1299 bears fruit
# privacy-badger = "https://addons.mozilla.org/firefox/downloads/file/3509922/latest"

# Removing this in favour of temporary containers
# cookie-autodelete = "https://addons.mozilla.org/firefox/downloads/file/3530747/latest"

# Out of date
# decentraleyes = "https://addons.mozilla.org/firefox/downloads/file/3539177/latest"

# Dead, use Privacy Redirect instead
# invidition = "https://addons.mozilla.org/firefox/downloads/file/3437574/latest"

# Appears to be unmaintained, reenable if the developer comes back
# privacy-possum = "https://addons.mozilla.org/firefox/downloads/file/3360398/latest"

# Using Nextcloud News instead
#feedbro = "https://addons.mozilla.org/firefox/downloads/file/3611394/latest"

ublock-origin = "https://addons.mozilla.org/firefox/downloads/file/3521827/latest"
https-everywhere = "https://addons.mozilla.org/firefox/downloads/file/3528100/latest"
keepassxc = "https://addons.mozilla.org/firefox/downloads/file/3535304/latest"
old-reddit-redirect = "https://addons.mozilla.org/firefox/downloads/file/3522186/latest"
privacy-redirect = "https://addons.mozilla.org/firefox/downloads/file/3635417/latest"
dark-fox-theme = "https://addons.mozilla.org/firefox/downloads/file/2419610/latest"
rss-preview = "https://addons.mozilla.org/firefox/downloads/file/3493414/latest"
play-with = "https://addons.mozilla.org/firefox/downloads/file/974448/latest"
dark-reader = "https://addons.mozilla.org/firefox/downloads/file/3606434/latest"
firefox-multi-account-containers = "https://addons.mozilla.org/firefox/downloads/file/3610087/latest"
temporary-containers = "https://addons.mozilla.org/firefox/downloads/file/3511233/latest"
tree-style-tabs = "https://addons.mozilla.org/firefox/downloads/file/3611750/latest"
user-agent-switcher = "https://addons.mozilla.org/firefox/downloads/file/3654840/latest"
cookie-manager = "https://addons.mozilla.org/firefox/downloads/file/3343599/latest"
tab-saver = "https://addons.mozilla.org/firefox/downloads/file/3543714/latest"
dont-touch-my-tabs = "https://addons.mozilla.org/firefox/downloads/file/3531936/latest"
twitchtv = "https://addons.mozilla.org/firefox/downloads/file/3662049/latest"
twitch-now = "https://addons.mozilla.org/firefox/downloads/file/3511497/latest"
tab-reloader = "https://addons.mozilla.org/firefox/downloads/file/3582470/latest"
twitter-original-images = "https://addons.mozilla.org/firefox/downloads/file/3422420/latest"
violent-monkey = "https://addons.mozilla.org/firefox/downloads/file/3505281/latest"
youtube-enhancer = "https://addons.mozilla.org/firefox/downloads/file/3537917/latest"
tabliss = "https://addons.mozilla.org/firefox/downloads/file/3549950/latest"

# From https://github.com/arkenfox/user.js/wiki/4.1-Extensions

canvas-blocker = "https://addons.mozilla.org/firefox/downloads/file/3586373/latest"
css-exfil-protection = "https://addons.mozilla.org/firefox/downloads/file/3631278/latest"
smart-referrer = "https://addons.mozilla.org/firefox/downloads/file/3470999/latest"
neat-url = "https://addons.mozilla.org/firefox/downloads/file/3557562/latest"
skip-redirect = "https://addons.mozilla.org/firefox/downloads/file/3632211/latest"
clear-urls = "https://addons.mozilla.org/firefox/downloads/file/3612592/latest"

policiesJson = (dirname (src)[name])'/policies.json'

json = (cat $policiesJson | from-json)

json[policies][Extensions][Install] = [ $ublock-origin $https-everywhere $keepassxc $old-reddit-redirect $privacy-redirect $dark-fox-theme $rss-preview $play-with $dark-reader $firefox-multi-account-containers $temporary-containers $tree-style-tabs $canvas-blocker $css-exfil-protection $smart-referrer $neat-url $skip-redirect $clear-urls $user-agent-switcher $cookie-manager $tab-saver $dont-touch-my-tabs $twitchtv $twitch-now $tab-reloader $twitter-original-images $violent-monkey $youtube-enhancer $tabliss ]

put $json | to-json | sudo tee /usr/lib/firefox/distribution/policies.json > /dev/null
