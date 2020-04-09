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