installs centos 7 with:
* standard dependencies (gcc, epel, etc)
* docker
* minikube
* asdf
  * go, java, node, python 2+3, ruby, clojure, rust
* zsh/vim configs

```sh
# macOS dependencies
brew cask install virtualbox vagrant
python3 -m pip install ansible
python3 -m pip install -U git+https://github.com/ansible-community/molecule
```

```sh
# deploy test environment with vagrant
git clone https://github.com/dsesclei/workstation
cd workstation
chmod +x test-run
./test-run
```
