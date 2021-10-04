git remote add remotegit https://${INPUT_REPO_USERNAME}:${INPUT_REPO_TOKEN}@${INPUT_REPO_URL#https://}

case "${GITHUB_EVENT_NAME}" in
    push)
        git push -f --all remotegit
        git push -f --tags remotegit
        ;;
    delete)
        git push -d target ${GITHUB_EVENT_REF}
        ;;
    *)
        break
        ;;
esac
