#aliases.sh

minikube start --memory 6144


alias kubectl='minikube kubectl --'

# Used to run minikube shortly
alias mk="minikube"

# Used to run kubectl shortly
alias k="kubectl"

# Used to get ...
alias kg="kubectl get"

# Used to get all pods
alias kgp="kubectl get pods"

# Used to get all pods with watching
alias kgpw="watch kubectl get pods"

# Used to create a resource
kc() {
  kubectl create -f $1
}

# Used to delete a resource
kd() {
  kubectl delete -f $1
}

# Used to re-create a resource
# (Not replace or apply, juste re-create)
kr() {
  kubectl delete -f $1
  kubectl create -f $1
}

# Used to kill a pod now!
kpk() {
  kpko=""
  if [ -z "$2" ]; then
    kpko="--namespace=$2"
  fi
  kubectl delete pod $1 --grace-period=0 --force $kpko
}

# Used to exec in a pod
kpe() {
  kpeo=""
  if [ ! -z "$3" ]; then
    kpeo="--namespace=$3"
  fi
  kubectl exec -it $1 -c $2 $kpeo
}

# Used to find a pod name
kpf() {
  kpfo=""
  if [ ! -z "$2" ]; then
    kpfo="--namespace=$2"
  fi
  kubectl get pods $kpfo | grep $1 | awk '{print $1}'
}

# Used to display and follow pod logs
kpl() {
  kplo=""
  if [ ! -z $3 ]; then
    kplo="--namespace=$3"
  fi
  kubectl logs $1 -c $2 $kplo -f
}