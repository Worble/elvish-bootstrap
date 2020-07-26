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
user_pref("browser.link.open_newwindow.restriction", 0);
user_pref("font.name.monospace.x-western", JetBrains Mono NL);
user_pref("font.name.sans-serif.x-western", Ubuntu);
user_pref("browser.display.use_document_fonts", 0);
user_pref("devtools.toolbox.host", "window");
user_pref("devtools.toolbox.previousHost", "bottom");' > ~/.mozilla/firefox/$profile-name/user.js

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
