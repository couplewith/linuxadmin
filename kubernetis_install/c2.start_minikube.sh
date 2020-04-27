https://kubernetes.io/ko/docs/setup/learning-environment/minikube/


Minikube를 시작하고 클러스터를 생성

minikube start
결과는 다음과 비슷하다.

Starting local Kubernetes cluster...
Running pre-create checks...
Creating machine...
Starting local Kubernetes cluster...
특정 쿠버네티스 버전, VM, 컨테이너 런타임 상에서 클러스터를 시작하기 위한 보다 상세한 정보는 클러스터 시작하기를 참조한다.

이제, kubectl을 통해서 클러스터와 상호작용할 수 있다. 보다 상세한 정보는 클러스터와 상호 작용하기를 참조한다.

단순한 HTTP 서버인 echoserver 이미지를 사용해서 쿠버네티스 디플로이먼트를 만들고 --port를 이용해서 8080 포트로 노출해보자.

kubectl create deployment hello-minikube --image=k8s.gcr.io/echoserver:1.10
결과는 다음과 비슷하다.

deployment.apps/hello-minikube created
hello-minikube 디플로이먼트에 액세스하기 위해, 서비스로 노출시킨다.

kubectl expose deployment hello-minikube --type=NodePort --port=8080
