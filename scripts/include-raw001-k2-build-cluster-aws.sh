# clean up
rm -rf ${WORKSPACE}/${K2_CLUSTER_NAME}/generated-keys
mkdir -p ${WORKSPACE}/${K2_CLUSTER_NAME}/generated-keys

# generate a keypair
ssh-keygen -q -t rsa -N '' -f ${K2_KEY_LOCATION}/id_rsa

# start k2
docker run -e "AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}" \
  -e "AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}" \
  -e "K2_CLUSTER_NAME=${K2_CLUSTER_NAME}" \
  -e "K2_KEY_LOCATION=${K2_KEY_LOCATION}" \
  -e "BUILD_TAG=${BUILD_TAG}" \
  --volumes-from=jenkins \
  ${K2_CONTAINER_IMAGE} \
  /kraken/up.sh --output ${WORKSPACE}/${K2_CLUSTER_NAME} --config ${WORKSPACE}/${K2_CLUSTER_NAME}/${K2_CLUSTER_NAME}.yaml
