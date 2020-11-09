#! /bin/bash

tag="${1:-latest}"
url="git@github.com:2DegreesInvesting/"

clone_and_log () {
    for repo in ${clones}
    do
        remote="${url}${repo}.git"
        git clone -b master ${remote} --depth 1
        echo "--"
    done

    for repo in ${clones}
    do
        git -C "${repo}" tag -a "${tag}" -m "Release pacta ${tag}" HEAD
        echo "${repo}"
        echo "$(git -C ${repo} log --pretty='%h %d <%an> (%cr)' | head -n 1)"
        echo "--"
    done
}

clones="${2:-PACTA_analysis create_interactive_report StressTestingModelDev pacta-data}"
clone_and_log

docker rmi --force $(docker images -q '2dii_pacta' | uniq)
docker build --tag 2dii_pacta:"${tag}" --tag 2dii_pacta:latest .

for repo in ${clones}
do
    rm -rf "${repo}"
done

unzip pacta_web_template.zip

clones="user_results"
clone_and_log

needless_files=".git .gitignore .DS_Store README.md user_results.Rproj"
for file in ${needless_files}
do
  rm -rf user_results/"${file}"
done

cp -R user_results/ pacta_web/user_results/4/
rm -rf user_results

docker save 2dii_pacta | gzip > pacta_web/2dii_pacta.tar.gz

zip -r pacta_web.zip pacta_web -x ".DS_Store" -x "__MACOSX"

rm -rf pacta_web

exit 0
