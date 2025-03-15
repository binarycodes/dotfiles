#!/usr/bin/env sh

name='Sujoy Das'
email='me@binarycodes.io'
ssh_file_path='~/.ssh/id_github'

printf "extracting key id from gpg\n"
key_id=$(gpg --list-public-keys --with-colons $email | awk -F':' '/pub/ {print $5}')

if [[ -z $key_id ]]
then
    printf "no keys found in gpg\n"
    printf "starting gpg key generation. try again when keys are generated\n\n\n"
    gpg --quick-generate-key "$name <$email>" ed25519 sign 1y
else
    printf "found key in gpg, setting up git now..."
    git config --replace-all user.name "$name"
    git config --replace-all user.email "$email"
    git config user.signkey $key_id
    git config core.sshCommand "ssh -i $ssh_file_path"
    git config commit.gpgsign true
    git config tag.gpgsign true

    printf "done\n\n"
    printf "add the following key to git remote\n"
    gpg --armor --export $key_id
fi
