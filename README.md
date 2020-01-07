# Play ground 

```shell script


h3 upgrade -i helm-operator fluxcd/helm-operator \
--namespace fluxcd \
--set helm.versions=v3 \
--set createCRD=true \
--set chartsSyncInterval="1m" \
--set git.ssh.secretName=flux-git-deploy



h3 upgrade -i flux \
--set git.url=git@github.com:sureshamk/hello-flux-helm.git \
--set git.branch=master \
--set git.path=charts/hello \
--set git.user="master" \
--set git.email="sureshamk@gmail.com" \
--set git.label="local_sync" \
--set helmOperator.updateChartDeps=false \
--namespace fluxcd \
fluxcd/flux


h3 template  flux \
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