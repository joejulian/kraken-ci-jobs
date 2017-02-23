# start k2 destroy
docker run -e "K2_CLUSTER_NAME=${K2_CLUSTER_NAME}" \
  -e "GCE_SERVICE_ACCOUNT_ID=${KRAKEN_GCE_SERVICE_ACCOUNT_ID}" \
  -e "GCE_SERVICE_ACCOUNT_KEY='/gcloud/service-account.json'" \
  -e "BUILD_TAG=${BUILD_TAG}" \
  --volumes-from=jenkins \
  -v /gcloud:/gcloud \
  ${K2_CONTAINER_IMAGE} \
  ./down.sh --output ${WORKSPACE}/${K2_CLUSTER_NAME} --config ${WORKSPACE}/${K2_CLUSTER_NAME}/${K2_CLUSTER_NAME}.yaml
