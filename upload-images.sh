REGISTRY=$1
IMAGE_DIR=${PACKAGE_DIR}/container-images
TAG=v0.10.0
skopeo copy oci://${IMAGE_DIR}/tssc-ci-agent-jenkins:${TAG} docker://$REGISTRY/tssc/tssc-ci-agent-jenkins:${TAG}
skopeo copy oci://${IMAGE_DIR}/tssc-tool-maven:${TAG} docker://$REGISTRY/tssc/tssc-tool-maven:${TAG}
skopeo copy oci://${IMAGE_DIR}/tssc-tool-buildah:${TAG} docker://$REGISTRY/tssc/tssc-tool-buildah:${TAG}
skopeo copy oci://${IMAGE_DIR}/tssc-tool-argocd:${TAG} docker://$REGISTRY/tssc/tssc-tool-argocd:${TAG}
skopeo copy oci://${IMAGE_DIR}/tssc-tool-skopeo:${TAG} docker://$REGISTRY/tssc/tssc-tool-skopeo:${TAG}
skopeo copy oci://${IMAGE_DIR}/tssc-tool-sonar:${TAG} docker://$REGISTRY/tssc/tssc-tool-sonar:${TAG}
skopeo copy oci://${IMAGE_DIR}/tssc-tool-config-lint:${TAG} docker://$REGISTRY/tssc/tssc-tool-config-lint:${TAG}
skopeo copy oci://${IMAGE_DIR}/tssc-tool-openscap:${TAG} docker://$REGISTRY/tssc/tssc-tool-openscap:${TAG}
