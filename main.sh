#!/bin/sh
echo "Registering a console link"

# input validation
if [ -z "${APP_MENU_IMAGE_URL}" ]; then
    echo "Please provide APP_MENU_IMAGE_URL as an environment variable"
    exit
fi
if [ -z "${APP_MENU_SECTION}" ]; then
    echo "Please provide APP_MENU_SECTION as an environment variable"
    exit
fi
if [ -z "${ROUTE_NAME}" ]; then
    echo "Please provide ROUTE_NAME as the an environment variable"
    exit
fi
if [ -z "${ROUTE_NAMESPACE}" ]; then
    echo "Please provide ROUTE_NAMESPACE as an environment variable"
    exit
fi
if [ -z "${CONSOLE_LINK_TEXT}" ]; then
    echo "Please provide CONSOLE_LINK_TEXT as an environment variable"
    exit
fi

CONSOLE_LINK_URL="https://$(oc get route $ROUTE_NAME -o=jsonpath='{.spec.host}' -n $ROUTE_NAMESPACE)"

cat console-link.yaml | \
sed "s@#APP_MENU_IMAGE_URL@${APP_MENU_IMAGE_URL}@g" | \
sed "s@#APP_MENU_SECTION@${APP_MENU_SECTION}@g"| \
sed "s@#CONSOLE_LINK_URL@${CONSOLE_LINK_URL}@g"| \
sed "s@#CONSOLE_LINK_TEXT@${CONSOLE_LINK_TEXT}@g"| \
oc apply -f -
