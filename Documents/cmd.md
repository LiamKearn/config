---
Title: Docker find all container data directories
Tags:
  - docker
  - container
  - jq
---
Collect all the data directories for all containers on a host.
```bash
docker inspect $(docker ps -qa) --format '{"id": "{{ .ID }}", "name": "{{ .Name }}", "data":"{{ .GraphDriver.Data }}"}' > data.txt
```

_Note_ that you can do the same thing with images and other docker objects.
You may need to add a redirection of stderr to the null device because of some
weird errors.
eg.
```bash
docker inspect $(docker image ls -a) --format '{"id": "{{ .ID }}", "name": "{{ .Name }}", "data":"{{ .GraphDriver.Data }}"}' 2>/dev/null > data.txt
```

Convert the data directories into a list of key value pairs.
```bash
cat data.txt | jq 'map(.data |= (sub("map\\[";"") | sub("\\]";"") | split(" "))) | map(.data |= (map(split(":")))) | map(.data[] |= { (.[0] + "s") : .[1:] }) | map(.data |= add)'
```

You can find all image and container in-use data directories with the following:
```bash
jq -s 'flatten' imagedirs.txt containerdirs.txt | jq 'map(.data |= (sub("map\\[";"") | sub("\\]";"") | split(" "))) | map(.data |= (map(split(":")))) | map(.data[] |= { (.[0] + "s") : .[1:] }) | map(.data |= add)' | jq '.[].data| add | .[]'
```

Cleanup and unique output:
```bash
jq -s 'flatten' imagedirs.txt containerdirs.txt | jq 'map(.data |= (sub("map\\[";"") | sub("\\]";"") | split(" "))) | map(.data |= (map(split(":")))) | map(.data[] |= { (.[0] + "s") : .[1:] }) | map(.data |= add)' | jq '.[].data| add | .[]' | sed 's/"\/var\/lib\/docker\/overlay2\/\(.*\)\/\w\+"/\1/' | uniq
```

Find all the directories that are not in use:
```bash
ls -1 /var/lib/docker/overlay2/ | xargs -n1 -I{} sh -c 'if ! grep -Fxq {} inuse.txt; then echo '{}'; fi'
```
---
Title: Merge arrays from two files with JQ
Tags:
  - jq
  - json
---
```bash
jq -s 'flatten' file1.json file2.json
```
or:
Replace `.id` with the key you want to merge on.
```bash
jq -s '[ .[0] + .[1] | group_by(.id)[] | select(length > 1) | add ]' file1.json file2.json
```

Check correctness with (will not work for merges):

```bash
[[ $(echo $(jq -s 'flatten | length' file1.json) $(jq -s 'flatten | length' file2.json) | dc -e '? ? + p') -eq $(jq -s 'flatten | length' file1.json file2.json) ]] \
    && echo $?
```
---
Title: UFW basic TCP allow from IP
Tags:
  - UFW
  - Firewall
---
```bash
sudo ufw allow in from 172.0.0.1 proto tcp to any port 1
```
