# Variables
extensions-shared = [ ms-vscode-remote.vscode-remote-extensionpack syler.sass-indented yzhang.markdown-all-in-one vscode-icons-team.vscode-icons eamodio.gitlens teabyii.ayu ]
extensions-csharp = [ formulahendry.dotnet-test-explorer fudge.auto-using ms-dotnettools.csharp k--kato.docomment formulahendry.dotnet-test-explorer ]
extensions-node = [ esbenp.prettier-vscode elmtooling.elm-ls-vscode dbaeumer.vscode-eslint eg2.vscode-npm-script christian-kohler.npm-intellisense ms-vscode.vscode-typescript-tslint-plugin ]
extensions-java = [ vscjava.vscode-java-pack ]
extensions-rust = [ bungcip.better-toml serayuzgur.crates belfz.search-crates-io swellaby.vscode-rust-test-adapter matklad.rust-analyzer vadimcn.vscode-lldb ]
extensions-elvish  = [ champii.language-elvish ]
extensions-python = [ donjayamanne.python-extension-pack littlefoxteam.vscode-python-test-adapter ]

# Funcs
fn install-extension [ name ]{
    vscodium --install-extension $name --force
}

fn setup [ langs ]{
    echo "Setting up vscodium"

    # Vscdodium now defaults to https://open-vsx.org/ which is great, but the extensions we need aren't on there (yet)
    # Revert Vscodium back to the default repository
    newJson = (echo '{
    "serviceUrl": "https://marketplace.visualstudio.com/_apis/public/gallery",
    "itemUrl": "https://marketplace.visualstudio.com/items"
}' | from-json)
    configLocation = "/usr/share/vscodium-bin/resources/app/product.json"
    config = (cat $configLocation | from-json)
    config[extensionsGallery] = $newJson
    put $config | to-json | sudo tee $configLocation > /dev/null 

    # Extensions
    for extension $extensions-shared {
        install-extension $extension
    }

    for extension $extensions-elvish {
        install-extension $extension
    }
    mkdir -p ~/.config/Code/User/vsicons-custom-icons
    icon = (dirname (src)[name])'/file_type_elvish.png'
    cp $icon ~/.config/Code/User/vsicons-custom-icons/file_type_elvish.png

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
        if (==s $lang "python") {
            for extension $extensions-python {
                install-extension $extension
            }
        }
    }

    # settings.json
    mkdir -p ~/.config/VSCodium/User
    config = (dirname (src)[name])'/settings.json'
    cp $config ~/.config/VSCodium/User/settings.json
}
