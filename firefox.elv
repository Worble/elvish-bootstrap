sudo mkdir -p /usr/lib/firefox/distribution/

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
privacy-possum = "https://addons.mozilla.org/firefox/downloads/file/3360398/latest"
firefox-multi-account-containers = "https://addons.mozilla.org/firefox/downloads/file/3610087/latest"
temporary-containers = "https://addons.mozilla.org/firefox/downloads/file/3511233/latest"

json = (echo '{
  "policies": {
    "AppAutoUpdate": false,
    "Extensions": {
      "Install": []
    },
    "DisableFirefoxStudies": true,
    "DisablePocket": true,
    "EnableTrackingProtection": {
      "Value": true,
      "Locked": false,
      "Cryptomining": true,
      "Fingerprinting": true,
      "Exceptions": []
    },
    "NoDefaultBookmarks": true,
    "OfferToSaveLogins": false,
    "Permissions": {
      "Notifications": {
        "Allow": [],
        "Block": [],
        "BlockNewRequests": true,
        "Locked": false
      }
    },
    "SearchEngines": {
      "Default": "DuckDuckGo"
    },
    "DisplayBookmarksToolbar": true,
    "SearchSuggestEnabled": false,
    "OverrideFirstRunPage": "",
    "OverridePostUpdatePage": "",
    "FirefoxHome": {
      "Search": true,
      "TopSites": false,
      "Highlights": false,
      "Pocket": false,
      "Snippets": false,
      "Locked": false
    }
  }
}' | from-json)

json[policies][Extensions][Install] = [ $ublock-origin $https-everywhere $privacy-badger $keepassxc $decentraleyes $old-reddit-redirect $invidition $dark-fox-theme $rss-preview $play-with $dark-reader $privacy-possum $firefox-multi-account-containers $temporary-containers ]

put $json | to-json | sudo tee /usr/lib/firefox/distribution/policies.json > /dev/null

profile-name = (grep 'Default=' ~/.mozilla/firefox/profiles.ini | sed 's/^Default=//' | head -n 1)

mkdir -p ~/.mozilla/firefox/$profile-name/chrome
echo '#tabbrowser-tabs .tabbrowser-tab .tab-close-button { display:none!important; }' > ~/.mozilla/firefox/$profile-name/chrome/userChrome.css

echo 'user_pref("browser.tabs.drawInTitlebar", true);
user_pref("browser.uidensity", 1);
user_pref("browser.urlbar.suggest.openpage", false);
user_pref("browser.urlbar.suggest.topsites", false);
user_pref("browser.urlbar.update1.interventions", false);
user_pref("browser.urlbar.update1.searchTips", false);
user_pref("browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.havePinned", "");
user_pref("browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.searchEngines", "");
user_pref("browser.newtabpage.pinned", "");
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
user_pref("browser.link.open_newwindow.restriction", 0);' > ~/.mozilla/firefox/$profile-name/user.js

# updater-path = "~/.mozilla/firefox/"$profile-name"/updater.sh"
# wget -O $updater-path https://raw.githubusercontent.com/ghacksuserjs/ghacks-user.js/master/updater.sh

# echo 'user_pref("_user.js.parrot", "Start custom prefs");
# user_pref("privacy.clearOnShutdown.cache", false);
# user_pref("privacy.clearOnShutdown.cookies", false);
# user_pref("privacy.clearOnShutdown.downloads", false);
# user_pref("privacy.clearOnShutdown.history", false);
# user_pref("privacy.clearOnShutdown.sessions", false);
# user_pref("privacy.clearOnShutdown.offlineApps", false); 
# user_pref("browser.cache.disk.enable", true);
# user_pref("browser.sessionstore.interval", 15000);
# user_pref("browser.cache.offline.enable", true);
# user_pref("dom.serviceWorkers.enabled", true);
# user_pref("_user.js.parrot", "End custom prefs");' > ~/.mozilla/firefox/$profile-name/user-overrides.js

# bash $updater-path -us
