az aks get-credentials --resource-group rg-aula-infra --name aks-aula-infra

kubectl config get-contexts
kubectl config use-context [nome contexto]
kubectl config use-context [nome contexto] --namespace
kubectl config unset contexts.[nome contexto]
