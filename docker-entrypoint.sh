#!/bin/sh
set -e

if [ -d "${DOCKER_ENTRYPOINT_DIR}" ]; then
    /bin/run-parts --verbose --regex '^[.a-zA-Z0-9_-]+$' "${DOCKER_ENTRYPOINT_DIR}"
fi

for DOCKER_ENV_HIDEVAR in ${DOCKER_ENV_HIDEVARS}; do
    unset ${DOCKER_ENV_HIDEVAR}
done

exec "$@"
