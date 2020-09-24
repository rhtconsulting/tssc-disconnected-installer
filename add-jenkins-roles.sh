JENKINS_PROJECT_NAME=devsecops
JENKINS_NAME=jenkins
JENKINS_SERVICE_NAME=jenkins
JENKINS_MEMORY_LIMIT='4Gi'
JENKINS_VOLUME_CAPACITY='20Gi'
JENKINS_WORKERS_IMAGES_UID=1001

echo
echo "Switch to the project (${JENKINS_PROJECT_NAME}) for Jenkins to reside in"
oc project ${JENKINS_PROJECT_NAME}

# TISC already does this
#echo
#echo "Deploy Jenkins via the template"
#oc process --namespace=openshift jenkins-persistent-monitored NAME=${JENKINS_NAME} JENKINS_SERVICE_NAME=${JENKINS_SERVICE_NAME} MEMORY_LIMIT=${JENKINS_MEMORY_LIMIT} VOLUME_CAPACITY=${JENKINS_VOLUME_CAPACITY} | oc create -f -

echo
echo "Create an SCC that can use the UID (${JENKINS_WORKERS_IMAGES_UID}) that the jenkins workers use"
echo "
kind: SecurityContextConstraints
apiVersion: security.openshift.io/v1
metadata:
  annotations:
    kubernetes.io/description: TODO
  name: run-as-user-${JENKINS_WORKERS_IMAGES_UID}
runAsUser:
  type: MustRunAsRange
  uidRangeMax: ${JENKINS_WORKERS_IMAGES_UID}
  uidRangeMin: ${JENKINS_WORKERS_IMAGES_UID}
seLinuxContext:
  type: MustRunAs" | oc create -f -

echo
echo "Create role that can use the new SCC"
__JENKINS_CUSTOM_ROLE_NAME=${JENKINS_PROJECT_NAME}-scc-run-as-user-${JENKINS_WORKERS_IMAGES_UID}
oc create role ${__JENKINS_CUSTOM_ROLE_NAME} --verb=use --resource=scc --resource-name=run-as-user-${JENKINS_WORKERS_IMAGES_UID} --namespace=${JENKINS_PROJECT_NAME}

echo
echo "Create RoleBinding for Jenkins ServiceAccount (${JENKINS_SERVICE_NAME}) to the custome Role (${__JENKINS_CUSTOM_ROLE_NAME}) to allow Jenkins to spin up Jenkins Workers using the custom UID (${JENKINS_WORKERS_IMAGES_UID})"
oc create rolebinding ${JENKINS_PROJECT_NAME}-${JENKINS_SERVICE_NAME}-sa-run-as-user-${JENKINS_WORKERS_IMAGES_UID} --role=${__JENKINS_CUSTOM_ROLE_NAME} --serviceaccount=${JENKINS_PROJECT_NAME}:${JENKINS_SERVICE_NAME}

echo
echo "Jenkins URL"
echo "https://$(oc get route ${JENKINS_SERVICE_NAME} -o=jsonpath='{.spec.host}')"
