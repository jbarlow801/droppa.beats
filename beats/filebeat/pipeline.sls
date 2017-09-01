http://10.237.2.64:9200/_ingest/pipeline/kube-pipeline:
  http.query:
    - method: PUT
    - data: '{"description":"Salt pipleine","processors":[{"grok":{"field":"message","patterns":["%{TIMESTAMP_ISO8601:timestamp} \\[%{GREEDYDATA:function}\\]\\[%{GREEDYDATA:level}\\]\\[%{GREEDYDATA:process}\\] %{GREEDYDATA:event}"],"on_failure":[{"set":{"field":"error","value":"'{{' _ingest.on_failure_message '}}'"}}]}},{"remove":{"field":"message"}}]}'
    - match: '{"acknowledged":true}'

http://10.237.2.64:9200/_ingest/pipeline/kibana-pipeline:
  http.query:
    - method: PUT
    - data: '{ "description": "Kibana pipleine", "processors": [ { "remove": { "field": "json.req.headers" } } ] }'
    - match: '{"acknowledged":true}'

http://10.237.2.64:9200/_ingest/pipeline/haproxy-pipeline:
  http.query:
    - method: PUT
    - data: '{ "description" : "haproxy pipleine", "processors" : [ { "grok" : { "field" : "message", "patterns" : [ "%{HAPROXYHTTP}" ] } }, { "remove" : { "field" : "message" } } ] }'
    - match: '{"acknowledged":true}'

http://10.237.2.64:9200/_ingest/pipeline/syslog-pipeline:
  http.query:
    - method: PUT
    - data: '{ "description" : "syslog pipleine", "processors" : [ { "grok" : { "field" : "message", "patterns" : [ "%{SYSLOGBASE}" ] } }, { "remove" : { "field" : "message" } } ] }'
    - match: '{"acknowledged":true}'

http://10.237.2.64:9200/_ingest/pipeline/salt-pipeline:
  http.query:
    - method: PUT
    - data: '{ "description" : "Salt pipleine", "processors" : [ { "grok" : { "field" : "message", "patterns" : [ "%{TIMESTAMP_ISO8601:timestamp} \\[%{GREEDYDATA:function}\\]\\[%{GREEDYDATA:level}\\]\\[%{GREEDYDATA:process}\\] %{GREEDYDATA:event}" ] } }, { "remove" : { "field" : "message" } } ] }'
    - match: '{"acknowledged":true}'

http://10.237.2.64:9200/_ingest/pipeline/etcd-pipeline:
  http.query:
    - method: PUT
    - data: '{ "description" : "etcd pipleine", "processors" : [ { "grok" : { "field" : "message", "patterns" : [ "%{TIMESTAMP_ISO8601:timestamp} %{WORD:level} \\| %{WORD:component}\\: %{GREEDYDATA:payload}" ] } }, { "remove" : { "field" : "message" } } ] }'
    - match: '{"acknowledged":true}'
