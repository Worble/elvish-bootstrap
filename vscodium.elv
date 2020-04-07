# Variables
extensions-shared = [ ms-vscode-remote.vscode-remote-extensionpack syler.sass-indented yzhang.markdown-all-in-one vscode-icons-team.vscode-icons eamodio.gitlens jolaleye.horizon-theme-vscode ]
extensions-csharp = [ formulahendry.dotnet-test-explorer ffudge.auto-using ms-vscode.csharp k--kato.docomment formulahendry.dotnet-test-explorer ]
extensions-node = [ hookyqr.beautify elmtooling.elm-ls-vscode dbaeumer.vscode-eslint eg2.vscode-npm-script christian-kohler.npm-intellisense ms-vscode.vscode-typescript-tslint-plugin ]
extensions-java = [ vscjava.vscode-java-pack ]
extensions-rust = [ ungcip.better-toml serayuzgur.crates belfz.search-crates-io swellaby.vscode-rust-test-adapter matklad.rust-analyzer ]
extensions-elvish  = [ champii.language-elvish ]

# Funcs
fn install-extension [ name ]{
    vscodium --install-extension $name --force
}

fn setup [ langs ]{
    # Extensions
    for extension $extensions-shared {
        install-extension $extension
    }

    for extension $extensions-elvish {
        install-extension $extension
    }

    for lang $langs {
        if (==s $lang "csharp") {
            for extension $extensions-csharp {
                install-extension $extension
            }
        }
        if (==s $lang "node") {
            for extension $extensions-node {
                install-extension $extension
            }
        }
        if (==s $lang "java") {
            for extension $extensions-java {
                install-extension $extension
            }
        }
        if (==s $lang "rust") {
            for extension $extensions-rust {
                install-extension $extension
            }
        }
    }

    # settings.json
    echo '{
"editor.formatOnSave": true,
"window.zoomLevel": 0,
"terminal.integrated.fontFamily": "Space Mono for Powerline",
"terminal.integrated.fontSize": 16,
"editor.fontFamily": "Source Code Pro for Powerline",
"editor.fontSize": 15,
"editor.wordWrap": "on",
"editor.wrappingIndent": "indent",
"breadcrumbs.enabled": true,
"explorer.openEditors.visible": 0,
"extensions.ignoreRecommendations": false,
"files.autoSave": "onWindowChange",
"workbench.colorTheme": "Horizon Italic",
"workbench.iconTheme": "vscode-icons"
}' > ~/.config/VSCodium/User/settings.json
}