#!/bin/bash

function color {
    echo -e "\e[1;36m$1\e[0m"
}

venv_path=$(echo "$VIRTUAL_ENV" | tr '[:upper:]' '[:lower:]')
pwd_path=$(echo "$(pwd)/venv" | tr '[:upper:]' '[:lower:]')

if [ -n "$venv_path" ] && [ "$pwd_path" != "$venv_path" ]; then
    color "Deactivating other venv..."
    deactivate
fi

if [ ! -d venv ]; then
    color "Creating a venv..."
    python3 -m venv venv
fi

zed_config="pyrightconfig.json"

if ! grep -qxF "$zed_config" .gitignore; then
    echo "$zed_config" >> .gitignore
    color "Added $zed_config to .gitignore"
fi

if [ ! -f "$zed_config" ]; then
    color "Add $zed_config..."
    cat > "$zed_config" << EOF
{
    "venvPath": ".",
    "venv": "venv"
}
EOF
fi

if [ "$pwd_path" != "$venv_path" ];then
    color "Activate venv..."
    source venv/bin/activate
fi

color "Install requirements..."
pip install -q --upgrade pip
pip install -r requirements.txt
color "Done!"

echo
color "Version: $(py --version)"
echo
