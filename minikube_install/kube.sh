

 if [ -z "${DOCKER_CERT_PATH}" ]; then
   DOCKER_CERT_PATH=/etc/docker
 fi


ku_start ()
{
   sudo /usr/local/bin/minikube start --vm-driver=none --v=5

   #* sudo /usr/local/bin/minikube start --vm-driver=docker \
   #          --container-runtime='docker'

   #* /usr/local/bin/minikube start --vm-driver=none
   #* /usr/local/bin/minikube start \
   #  --network-plugin=cni \
   #  --enable-default-cni \
   #  --container-runtime=containerd \
   #  --bootstrapper=kubeadm
}
docker_restart()
{
      systemctl status docker --no-pager || systemctl start docker

}
docker_status()
{
     systemctl status docker --no-pager
    echo "docker status : $?"

}
ku_status ()
{
    sudo /usr/local/bin/minikube status
}

ku_stop ()
{
    sudo /usr/local/bin/minikube stop
}


if [ -z "$1" ]
then
    opt="status"

fi


#################################
case "$1" in
    "start")  
              docker_restart
              ku_start
              ku_status
              ;;
    "stop")  ku_stop
              ;;
    "status")  ku_status
              ;;
     *)   echo " Usage : $0 [start|stop|status]"
              ;;
esac
