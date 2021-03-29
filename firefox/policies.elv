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

#Interesting Idea
#play-with = "https://addons.mozilla.org/firefox/downloads/file/974448/latest"

# Builtin support now
#https-everywhere = "https://addons.mozilla.org/firefox/downloads/file/3528100/latest"

ublock-origin = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi"
keepassxc = "https://addons.mozilla.org/firefox/downloads/latest/keepassxc-browser/latest.xpi"
old-reddit-redirect = "https://addons.mozilla.org/firefox/downloads/latest/old-reddit-redirect/latest.xpi"
privacy-redirect = "https://addons.mozilla.org/firefox/downloads/latest/privacy-redirect/latest.xpi"
rss-preview = "https://addons.mozilla.org/firefox/downloads/latest/rsspreview/latest.xpi"
dark-reader = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi"
firefox-multi-account-containers = "https://addons.mozilla.org/firefox/downloads/latest/multi-account-containers/latest.xpi"
temporary-containers = "https://addons.mozilla.org/firefox/downloads/latest/temporary-containers/latest.xpi"
tree-style-tabs = "https://addons.mozilla.org/firefox/downloads/latest/tree-style-tab/latest.xpi"
user-agent-switcher = "https://addons.mozilla.org/firefox/downloads/latest/user-agent-string-switcher/latest.xpi"
cookie-manager = "https://addons.mozilla.org/firefox/downloads/latest/cookie-quick-manager/latest.xpi"
tab-saver = "https://addons.mozilla.org/firefox/downloads/latest/vyrtsev-tab-saver/latest.xpi"
dont-touch-my-tabs = "https://addons.mozilla.org/firefox/downloads/latest/dont-touch-my-tabs/latest.xpi"
twitchtv = "https://addons.mozilla.org/firefox/downloads/latest/twitch_5/latest.xpi"
twitch-now = "https://addons.mozilla.org/firefox/downloads/latest/twitch-now/latest.xpi"
tab-reloader = "https://addons.mozilla.org/firefox/downloads/latest/tab-reloader/latest.xpi"
# twitter-original-images = "https://addons.mozilla.org/firefox/downloads/latest/twitter-gensun-view/latest.xpi"
violent-monkey = "https://addons.mozilla.org/firefox/downloads/latest/violentmonkey/latest.xpi"
youtube-enhancer = "https://addons.mozilla.org/firefox/downloads/latest/enhancer-for-youtube/latest.xpi"
tabliss = "https://addons.mozilla.org/firefox/downloads/latest/tabliss/latest.xpi"
search-by-image = "https://addons.mozilla.org/firefox/downloads/latest/search_by_image/latest.xpi"
theme = "https://addons.mozilla.org/firefox/downloads/latest/nord-polar-night-theme/latest.xpi"

# From https://github.com/arkenfox/user.js/wiki/4.1-Extensions

canvas-blocker = "https://addons.mozilla.org/firefox/downloads/latest/canvasblocker/latest.xpi"
css-exfil-protection = "https://addons.mozilla.org/firefox/downloads/latest/css-exfil-protection/latest.xpi"
# Might not be needed after https://blog.mozilla.org/security/2021/03/22/firefox-87-trims-http-referrers-by-default-to-protect-user-privacy/ ?
smart-referrer = "https://addons.mozilla.org/firefox/downloads/latest/smart-referer/latest.xpi"
neat-url = "https://addons.mozilla.org/firefox/downloads/latest/neat-url/latest.xpi"
skip-redirect = "https://addons.mozilla.org/firefox/downloads/latest/skip-redirect/latest.xpi"
clear-urls = "https://addons.mozilla.org/firefox/downloads/latest/clearurls/latest.xpi"

policiesJson = (dirname (src)[name])'/policies.json'

json = (cat $policiesJson | from-json)

json[policies][Extensions][Install] = [ $ublock-origin $keepassxc $old-reddit-redirect $privacy-redirect $rss-preview $dark-reader $firefox-multi-account-containers $temporary-containers $tree-style-tabs $canvas-blocker $css-exfil-protection $smart-referrer $neat-url $skip-redirect $clear-urls $user-agent-switcher $cookie-manager $tab-saver $dont-touch-my-tabs $twitchtv $twitch-now $tab-reloader $violent-monkey $youtube-enhancer $tabliss $search-by-image $theme ]

put $json | to-json | sudo tee /usr/lib/firefox/distribution/policies.json > /dev/null
put $json | to-json | sudo tee /usr/lib/firefox-developer-edition/distribution/policies.json > /dev/null
