# @Author: dongqing feng
# @Date:   2019-11-19 09:45:24
# @Last Modified by:   Holly
# @Last Modified time: 2019-11-19 16:08:17

#!/bin/bash
set -e

# Check version in https://kubernetes.io/docs/reference/setup-tools/kubeadm/kubeadm-init/
# Search "Running kubeadm without an internet connection"
# For running kubeadm without an internet connection you have to pre-pull the required master images for the version of choice:

#kube-apiserver:v1.14.6
#kube-controller-manager:v1.14.6
#kube-scheduler:v1.14.6
#kube-proxy:v1.14.6
#pause:3.1
#coredns:1.3.1
#etcd:3.3.10

KUBE_VERSION=1.14.6
KUBE_PAUSE_VERSION=3.1
ETCD_VERSION=3.3.10
DNS_VERSION=1.3.1

GCR_URL=k8s.gcr.io
ALIYUN_REGISTRY=registry.cn-hangzhou.aliyuncs.com/k8s_leaf

images=(kube-apiserver:${KUBE_VERSION}
	kube-controller-manager:${KUBE_VERSION}
	kube-scheduler:${KUBE_VERSION}
	kube-proxy:${KUBE_VERSION}
	pause：${KUBE_PAUSE_VERSION}
	etcd：${ETCD_VERSION}
	coredns:${DNS_VERSION})

for iamge_name in ${images[@]} ; do
	docker pull $ALIYUN_REGISTRY/$iamge_name
	docker tag $ALIYUN_REGISTRY/iamge_name $GCR_URL/$iamge_name
	docker rmi $ALIYUN_REGISTRY/$image_name
done

docker images
