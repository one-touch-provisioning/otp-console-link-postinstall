Dockerfile creates an image at `quay.io/congxdev/otp-console-link:4.8`.

## Usage

### Create an ArgoCD console link

```yaml
apiVersion: batch/v1
kind: Job
metadata:
  name: argocd-postinstall
  annotations:
    argocd.argoproj.io/hook: PostSync
  namespace: openshift-gitops
spec:
  template:
    spec:
      containers:
      - name: argocd-console-link-postinstall
        image: quay.io/congxdev/otp-console-link:4.8
        imagePullPolicy: Always
        env:
        - name: APP_MENU_IMAGE_URL
          value: data:image/png;base64,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
        - name: APP_MENU_SECTION
          value: One Touch Provisioning
        - name: ROUTE_NAME
          value: openshift-gitops-cntk-server
        - name: ROUTE_NAMESPACE
          value: openshift-gitops
        - name: CONSOLE_LINK_TEXT
          value: OpenShift GitOps
      restartPolicy: Never
  backoffLimit: 2
```

### Create a RHACM console link

```yaml
apiVersion: batch/v1
kind: Job
metadata:
  name: rhacm-postinstall
  annotations:
    argocd.argoproj.io/hook: PostSync
  namespace: open-cluster-management
spec:
  template:
    spec:
      containers:
      - name: rhacm-console-link-postinstall
        image: quay.io/congxdev/otp-console-link:4.8
        imagePullPolicy: Always
        env:
        - name: APP_MENU_IMAGE_URL
          value: data:image/png;base64,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
        - name: APP_MENU_SECTION
          value: One Touch Provisioning
        - name: ROUTE_NAME
          value: multicloud-console
        - name: ROUTE_NAMESPACE
          value: open-cluster-management
        - name: CONSOLE_LINK_TEXT
          value: Red Hat Advanced Cluster Management
      restartPolicy: Never
  backoffLimit: 2
```

### Create an Infra Automation console link

```yaml
apiVersion: batch/v1
kind: Job
metadata:
  name: infra-auto-postinstall
  annotations:
    argocd.argoproj.io/hook: PostSync
  namespace: ibm-infra-automation
spec:
  template:
    spec:
      containers:
      - name: infra-auto-console-link-postinstall
        image: quay.io/congxdev/otp-console-link:4.8
        imagePullPolicy: Always
        env:
        - name: APP_MENU_IMAGE_URL
          value: data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAABItJREFUeNrsV11MVEcUnpm7/gts2KJiS73s0oi/KBp/QtpAG6ltgrs8tPVFo+nGNqaN6FMfmrCmUWOMQWO0SSWBNOWhTywvbTVpsf6hTaUtkHVjhN0iK6KsbPgJbu/eO/3m7m1kkV0u4Jo+eJOzc+/MmfN9c86ZObOEvHxm8GyP+FzvDfpcM7FhmclkrtIDhOuv3unaYKkGt7YFSlONqwojaoymBHBpbaXTIrC5NWjVVNq85a+AJ5mOBnBNSU6gItrhETacart1ygRuFssRTPbCzdUgIyclkMQDyA1ZVWg1xr1N0prItEIA8INwsyBSN+G4Riu1GKuckJxC6wAewfjBGWV68fV7VRtaugemOm9bn3+gvN9fNZkenYpRELFSRvYwC3cyiZdSxkepxDsY47eoRFoI5b9jPHDZUTBq1qZOwPH9I7nzo5xgMqW1v4SsAKwB2B6GoKH9EySaQEDB+yP0PcB7NuQJvnspJXdApO9Xe4GWzOb7Qz75h4yVQZr/XbiUUt6MyZeQEXvHE1n1Y+86GG0EARltPdrDf7yZNyHZEl/XPNjKhR0KewMgErlckEhi20O/DBt1VPcgKdM9IH8b9mDCAXTAxfxU584cPXGWe/vWQbkZygRtZce7Sy+ZcSuIzAGR2QhLFD7+58obDr3/7Z47wotVCFkEHjx9wbbCo++C4G6bBxm9HtleD3EZYbEiixuNrVZmFlw811bao5pGhzEvxrWEbeviMR1jvQBPmYT2hv6TYHsIqyi7+0GOafCNN7vnYp4Nq8xCmwuvqkwkK+ODCE3X1eWO6KS74PW6x69iQismegO7XvnEDHBRc4gxi7YQgBkAno+QUYiKbxtsCXvLsJjZCE3L1ULHlZTFCIfIJspoF5H4V2bAV/90n2oqmUU40xDbcGtJXmjMcKdRVxZxTpwgtLPkdlfhtRX28894YFHNkGDNYeRzsa1Cn1oPTwZe2NRHoM+gz8SK28uX8lT6W9oCbuyO7dBvvL7K3qAnYfbREWY7PjwfSTILQnGGD6I1FXe/czFBUnGRcJOBi+fG2vxaBKYdsg9kcpmRnbmQTHTyh4cyhLEekAiZTTz/jsX8dsUS0ycq7H8D+xnA280WfvkkDzU9H0VHCX+xQDEUejWFDaXrJvXbxmW9KFIXgVNkAVAx4kFGjs0JP01CFkKfms7rHMDvIiF3MLyUQAYTBlU6gr5omgn44IVshljkiaQbN6gKyaweTR8Bha4BrmQBEAoItY4jgFOE8OEjc9NGQI2xIoT5hiAQwr4sRt/P/w0iH9J6nUeRy9IUXoFFNjAUoW7E/B3iRhl9QQ8WXQuxIQe+FufAWeNIrnkR4PkN/TUAr8S2P4dD7O/4Uezm4u5+xji3PyO1tOd5A792fkCO36qIC0WuPrDLtjexFrj5JvyeECQht8R5gdyQUNlo/JzXbznEuJwQGr+aEWb0wfDTdyZ0CBmj70QrLjcRtKfvfZztmbgcu3kmfj+EvCXuoOJeAg0Gw5IgoYMYANQgMfY7AZQZpCQepHFpwt2x/v7+rMj/6g/uvwIMAOUwJgtmXuiZAAAAAElFTkSuQmCC
        - name: APP_MENU_SECTION
          value: One Touch Provisioning
        - name: ROUTE_NAME
          value: cp-console
        - name: ROUTE_NAMESPACE
          value: ibm-common-services
        - name: CONSOLE_LINK_TEXT
          value: IBM Infrastructure Automation
      restartPolicy: Never
  backoffLimit: 2
```

### Create an Ansible Tower console link

```yaml
apiVersion: batch/v1
kind: Job
metadata:
  name: ansible-postinstall
  annotations:
    argocd.argoproj.io/hook: PostSync
  namespace: ansible-automation-platform
spec:
  template:
    spec:
      containers:
      - name: ansible-console-link-postinstall
        image: quay.io/congxdev/otp-console-link:4.8
        imagePullPolicy: Always
        env:
        - name: APP_MENU_IMAGE_URL
          value: data:image/png;base64,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
        - name: APP_MENU_SECTION
          value: One Touch Provisioning
        - name: ROUTE_NAME
          value: controller
        - name: ROUTE_NAMESPACE
          value: ansible-automation-platform
        - name: CONSOLE_LINK_TEXT
          value: Ansible Tower
      restartPolicy: Never
  backoffLimit: 2
```