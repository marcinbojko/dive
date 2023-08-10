#!/usr/bin/env bash

# ANSI color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}Determining operating system...${NC}"
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux; grep_command=grep; sed_binary=sed;;
    Darwin*)    machine=Mac; grep_command=ggrep; sed_binary=gsed;;
    *)          machine="UNKNOWN:${unameOut}"
esac
printf "%-30s %s\n" "Operating system:" "${machine}"

file="../dive.nuspec"
powershell="../tools/chocolateyinstall.ps1"

if [[ ! -f "$file" ]]; then
    echo -e "${RED}File $file does not exist. Exiting.${NC}"
    exit 1
fi

if [[ ! -f "$powershell" ]]; then
    echo -e "${RED}File $powershell does not exist. Exiting.${NC}"
    exit 1
fi

echo -e "${GREEN}Extracting version and id from $file...${NC}"
version=$($grep_command -oPm1 "(?<=<version>)[^<]+" "$file")
id=$($grep_command -oPm1 "(?<=<id>)[^<]+" "$file")
url64=https://github.com/wagoodman/dive/releases/download/v"$version"/dive_"$version"_windows_amd64.zip
checksum64_file=https://github.com/wagoodman/dive/releases/download/v"$version"/dive_"$version"_checksums.txt
checksum64=$(curl -sL "$checksum64_file" | grep windows_amd64.zip | awk '{print $1}')

printf "%-30s %s\n" "Version:" "${version}"
printf "%-30s %s\n" "ID:" "${id}"
printf "%-30s %s\n" "URL64:" "${url64}"
printf "%-30s %s\n" "Checksum64:" "${checksum64}"

# Check if the file under the URL exists
echo -e "${GREEN}Checking if the file under the URL exists...${NC}"
if curl --output /dev/null --silent --head --fail "$url64"; then
    echo "File exists."
else
    echo -e "${RED}File does not exist. Exiting.${NC}"
    exit 1
fi

# Check if the file under the URL has the same checksum
echo -e "${GREEN}Checking if the file under the URL has the same checksum...${NC}"
remote_checksum=$(curl -sL "$url64" | sha256sum | cut -d ' ' -f 1)
if [ "$remote_checksum" == "$checksum64" ]; then
    echo "Checksums match."
else
    echo -e "${RED}Checksums do not match. Exiting.${NC}"
    exit 1
fi

if [ -n "$version" ] && [ -n "$checksum64" ]; then
    echo -e "${GREEN}Version and checksum are not empty. Updating $powershell...${NC}"
    "$sed_binary" -i "s|^\$version.*|\$version            = '$version'|g" "$powershell"
    "$sed_binary" -i "s|^\$checksum64.*|\$checksum64         = '$checksum64'|g" "$powershell"
    echo "Updated $powershell with new version and checksum."
    # Check if the tag exists
    if git rev-parse --quiet --verify "$version" >/dev/null; then
        echo "Tag already exists: $version"
    else
    # Create the tag
    git add -A
    git commit -m "Version ${version}"
    git tag "$version"
    git push origin "$version"
    # Push the tag to the remote repository
    #
    echo "Tag created and pushed: $version"
    fi

else
    echo -e "${RED}Error: version or checksum is/are empty.${NC}"
    printf "%-30s %s\n" "Version:" "${version}"
    printf "%-30s %s\n" "Checksum:" "${checksum64}"
    exit 1
fi
