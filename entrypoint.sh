git remote add gitlab https://${INPUT_REPO_DEST_USERNAME}:${INPUT_REPO_DEST_TOKEN}@${INPUT_REPO_DEST_URL#https://}

case "${GITHUB_EVENT_NAME}" in
    push)
        git push -f --all gitlab
        git push -f --tags gitlab
        ;;
    delete)
        git push -d target ${GITHUB_EVENT_REF}
        ;;
    *)
        break
        ;;
esac
