profile-name = (grep 'Default=' ~/.mozilla/firefox/profiles.ini | sed 's/^Default=//' | head -n 1)

mkdir -p ~/.mozilla/firefox/$profile-name/chrome
user-chrome = (dirname (src)[name])'/userChrome.css'
cp $user-chrome ~/.mozilla/firefox/$profile-name/chrome/userChrome.css

user-js = (dirname (src)[name])'/user.js'
cp $user-js ~/.mozilla/firefox/$profile-name/user.js

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
