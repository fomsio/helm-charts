{{/* vim: set filetype=mustache: */}}

{{- define "tesseractcube.fullname" -}}
{{- include "common.names.fullname" . -}}
{{- end -}}

{{/*
Return the proper image name
*/}}
{{- define "tesseractcube.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.image "global" .Values.global) }}
{{- end -}}

{{- define "tesseract.agent.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.agent.image "global" .Values.global) }}
{{- end -}}

{{/*
Return the proper Docker Image Registry Secret Names
*/}}
{{- define "tesseractcube.imagePullSecrets" -}}
{{- include "common.images.pullSecrets" (dict "images" (list .Values.image) "global" .Values.global) }}
{{- end -}}

{{/*
Create the name of the cluster role to use
*/}}
{{- define "tesseractcube.clusterRoleName" -}}
{{- if .Values.rbac.create }}
{{- default (include "common.names.fullname" .) .Values.rbac.name }}
{{- else }}
{{- default "default" .Values.rbac.name }}
{{- end }}
{{- end }}

{{/*
Create the name of the cluster role binding to use
*/}}
{{- define "tesseractcube.clusterRoleBindingName" -}}
{{- if .Values.rbac.create }}
{{- default (include "common.names.fullname" .) .Values.rbac.name }}
{{- else }}
{{- default "default" .Values.rbac.name }}
{{- end }}
{{- end }}

{{/*
 Create the name of the service account to use
 */}}
{{- define "tesseractcube.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
{{ default (include "common.names.fullname" .) .Values.serviceAccount.name | trunc 63 | trimSuffix "-" }}
{{- else -}}
{{ default "default" .Values.serviceAccount.name | trunc 63 | trimSuffix "-" }}
{{- end -}}
{{- end -}}

{{/*
Create the name of the role to use
*/}}
{{- define "tesseractcube.roleName" -}}
{{- if .Values.rbac.create }}
{{- default (include "common.names.fullname" .) .Values.rbac.name }}
{{- else }}
{{- default "default" .Values.rbac.name }}
{{- end }}
{{- end }}

{{/*
Create the name of the role binding to use
*/}}
{{- define "tesseractcube.roleBindingName" -}}
{{- if .Values.rbac.create }}
{{- default (include "common.names.fullname" .) .Values.rbac.name }}
{{- else }}
{{- default "default" .Values.rbac.name }}
{{- end }}
{{- end }}