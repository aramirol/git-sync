git remote add gitlab https://${INPUT_GITLAB_USERNAME}:${INPUT_GITLAB_TOKEN}@${INPUT_GITLAB_URL#https://}

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
