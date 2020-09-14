skopeo copy oci:///home/dwinchell/tssc/tssc-disconnected-installer/package/container_images/tssc-ci-agent-jenkins:v0.4 docker://$REGISTRY/tssc/tssc-ci-agent-jenkins:v0.4
skopeo copy oci:///home/dwinchell/tssc/tssc-disconnected-installer/package/container_images/tssc-tool-maven:v0.3 docker://$REGISTRY/tssc/tssc-tool-maven:v0.3
skopeo copy oci:///home/dwinchell/tssc/tssc-disconnected-installer/package/container_images/tssc-tool-buildah:latest docker://$REGISTRY/tssc/tssc-tool-buildah:latest
skopeo copy oci:///home/dwinchell/tssc/tssc-disconnected-installer/package/container_images/tssc-tool-argocd:v0.2 docker://$REGISTRY/tssc/tssc-tool-argocd:v0.2
skopeo copy oci:///home/dwinchell/tssc/tssc-disconnected-installer/package/container_images/tssc-tool-skopeo:v0.2 docker://$REGISTRY/tssc/tssc-tool-skopeo:v0.2
skopeo copy oci:///home/dwinchell/tssc/tssc-disconnected-installer/package/container_images/tssc-tool-sonar:v0.2 docker://$REGISTRY/tssc/tssc-tool-sonar:v0.2
