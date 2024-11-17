{{- define "prefixWithVariable" -}}
    {{- $prefix := .prefix -}}
    {{- $variable := .variable -}}
    {{- if $prefix -}}
        {{- printf "%s-%s" $prefix $variable -}}
    {{- else -}}
        {{- $variable -}}
    {{- end -}}
{{- end -}}


{{- define "spireAgentAddr" -}}
  {{- if .Values.spire.agent -}}
    {{- .Values.spire.agent -}}
  {{- else -}}
    {{- printf "cp-node-%s.%s.svc.cluster.local:9091" .Values.clusterName .Release.Namespace -}}
  {{- end -}}
{{- end -}}

{{- define "rmqAddr" -}}
  {{- if .Values.rmq.server -}}
    {{- .Values.rmq.server -}}
  {{- else -}}
    {{- printf "%s:5672" .Values.rmq.name -}}
  {{- end -}}
{{- end -}}


{{- define "rmqCert" -}}
  {{- $cert := .cert -}}
  {{- $path := .path -}}
  {{- if $cert -}}
    {{- $cert -}}
  {{- else -}}
    {{- .Files.Get $path | b64enc -}}
  {{- end -}}
{{- end -}}

