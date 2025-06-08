# Function to delete ECR images
function delete_ecr_images() {
  if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: delete_ecr_images \"<region>\" \"<repositories separated by space>\""
    return 1
  fi
  local region=$1
  local repositories=$2

  for repo in "${repositories[@]}"; do
    aws ecr list-images --region "$region" --repository-name "$repo" --query 'imageIds[*]' --output json | \
    jq -c '.[] | if .imageTag == null then [{imageDigest: .imageDigest}] else [{imageDigest: .imageDigest, imageTag: .imageTag}] end' | \
    while read -r image; do
      aws ecr batch-delete-image --region "$region" --repository-name "$repo" --image-ids "$image" > /dev/null 2>&1
    done
  done
}
