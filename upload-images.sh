REGISTRY=$1
skopeo copy oci://${INSTALLER_DIR}/tssc-ci-agent-jenkins:v0.10 docker://$REGISTRY/tssc/tssc-ci-agent-jenkins:v0.10
skopeo copy oci://${INSTALLER_DIR}/tssc-tool-maven:v0.10 docker://$REGISTRY/tssc/tssc-tool-maven:v0.10
skopeo copy oci://${INSTALLER_DIR}/tssc-tool-buildah:v0.10 docker://$REGISTRY/tssc/tssc-tool-buildah:v0.10
skopeo copy oci://${INSTALLER_DIR}/tssc-tool-argocd:v0.10 docker://$REGISTRY/tssc/tssc-tool-argocd:v0.10
skopeo copy oci://${INSTALLER_DIR}/tssc-tool-skopeo:v0.10 docker://$REGISTRY/tssc/tssc-tool-skopeo:v0.10
skopeo copy oci://${INSTALLER_DIR}/tssc-tool-sonar:v0.10 docker://$REGISTRY/tssc/tssc-tool-sonar:v0.10