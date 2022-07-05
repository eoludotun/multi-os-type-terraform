
IMAGE_VERSION=$1
SUBSCRIPTION_ID=$2
packer build -var "version=${IMAGE_VERSION}" "subscription=${SUBSCRIPTION_ID}" .
