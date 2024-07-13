{{ range .observed.composite.resource.spec.branches }}
{{- if ne . "main" }}
---
apiVersion: repo.github.upbound.io/v1alpha1
kind: Branch
metadata:
  name: {{ $.observed.composite.resource.spec.name }}-{{ . }}
  annotations:
    crossplane.io/external-name: {{ $.observed.composite.resource.spec.name }}:{{ . }}
    gotemplating.fn.crossplane.io/composition-resource-name: {{ $.observed.composite.resource.spec.name }}-{{ . }}
spec:
  forProvider:
    branch: {{ . }}
    repositoryRef:
      name: {{ $.observed.composite.resource.spec.name }}
  providerConfigRef:
    name: default
{{ end }}
{{ end }}
