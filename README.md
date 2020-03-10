# Play ground 

```shell script

helm repo add fluxcd https://charts.fluxcd.io

helm upgrade -i helm-operator fluxcd/helm-operator \
--namespace flux \
--set helm.versions=v3 \
--set chartsSyncInterval="1m" \
--set git.ssh.secretName=flux-git-deploy



helm upgrade -i flux \
--set git.url=git@github.com:sureshamk/hello-flux-helm.git \
--set git.user="suresh" \
--set git.email="sureshamk@gmail.com" \
--set git.label="local_sync" \
--set sops.enabled=true \
--set gpgKeys.secretName=gpg \
--namespace flux \
fluxcd/flux

#--set manifestGeneration=true \

helm template  flux \
--set git.url=git@github.com:sureshamk/hello-flux-helm.git \
--set git.branch=master \
--set git.path=charts/hello \
--set git.user="master" \
--set git.email="sureshamk@gmail.com" \
--set git.label="local_sync" \
--set helmOperator.updateChartDeps=false \
--namespace fluxcd \
fluxcd/flux > flux.yaml

```