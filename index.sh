#!/bin/bash

# you can define an alias in your shell configuration file (e.g., .bashrc or .bash_profile).
# sudo bash ./path-to-file

printf "\nAVAILABLE TEMPLATES\n\n";
printf "1 - vite+bootstrap\n\n";

# Prompt user for template
read -p "project-template: " PROJECT_TEMPLATE;

# Prompt user for project name
read -p "project-name: " PROJECT_NAME;

# Check the template in an if statement
if [ "$PROJECT_TEMPLATE" == "vite+bootstrap" ]; then
    yarn create vite "$PROJECT_NAME" --template vanilla;

    # new directory
    # mkdir $PROJECT_NAME;
    cd $PROJECT_NAME;

    rm -rf index.html style.css public/vite.svg main.js counter.js javascript.svg;

    touch vite.config.js app.scss index.html;

    VITE_CONFIG_BOILERPLATE=$(cat ../boilerplate/vite+bootstrap/vite.config.js);
    printf "%b" "$VITE_CONFIG_BOILERPLATE" > vite.config.js;

    APP_SCSS_BOILERPLATE=$(cat ../boilerplate/vite+bootstrap/app.scss);
    printf "%b" "$APP_SCSS_BOILERPLATE" > app.scss;

    HTML_BOILERPLATE=$(cat ../boilerplate/vite+bootstrap/index.html);
    printf "%b" "$HTML_BOILERPLATE" > index.html;

    yarn add bootstrap sass --dev;

    yarn dev;
    exit 0;

else
    echo "Error:: Invalid template option";
    exit 1;
fi