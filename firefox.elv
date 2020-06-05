sudo mkdir -p /usr/lib/firefox/distribution/
echo '{
  "policies": {
    "Extensions": {
      "Install": [
        "https://addons.mozilla.org/firefox/downloads/file/3048083/latest", 
        "https://addons.mozilla.org/firefox/downloads/file/3521827/latest",
        "https://addons.mozilla.org/firefox/downloads/file/3528100/latest",
        "https://addons.mozilla.org/firefox/downloads/file/3509922/latest",
        "https://addons.mozilla.org/firefox/downloads/file/3535304/latest",
        "https://addons.mozilla.org/firefox/downloads/file/3519533/latest",
        "https://addons.mozilla.org/firefox/downloads/file/3530747/latest",
        "https://addons.mozilla.org/firefox/downloads/file/3539177/latest",
        "https://addons.mozilla.org/firefox/downloads/file/3522186/latest",
        "https://addons.mozilla.org/firefox/downloads/file/3437574/latest",
        "https://addons.mozilla.org/firefox/downloads/file/2419610/latest",
        "https://addons.mozilla.org/firefox/downloads/file/3493414/latest"
      ]
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
    "FirefoxHome": {
      "Search": true,
      "TopSites": false,
      "Highlights": false,
      "Pocket": false,
      "Snippets": false,
      "Locked": false
    }
  }
}' | sudo tee /usr/lib/firefox/distribution/policies.json > /dev/null

# profile-name = (grep 'Default=' ~/.mozilla/firefox/profiles.ini | sed 's/^Default=//' | head -n 1)
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