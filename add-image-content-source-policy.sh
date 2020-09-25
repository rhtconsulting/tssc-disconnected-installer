DISCONNECTED_REGISTRY=quay.apps.spartaeast.rht-set.com

echo
echo "Create ImageContentSourcePolicy"
echo "
apiVersion: operator.openshift.io/v1alpha1
kind: ImageContentSourcePolicy
metadata:
  name: mirror-quay-io
spec:
  repositoryDigestMirrors:
  - mirrors:
    - ${DISCONNECTED_REGISTRY}/tssc
    source: quay.io/tssc" | oc create -f -

