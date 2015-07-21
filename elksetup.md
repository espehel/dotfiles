**Basic testsetup

* Last ned ElasticSearch, Logstash og Kibana
* Kjør de direkte i terminal på loggserveren.

**Hvorfor dette er dumt?
Endte opp med å få out of memory på batchjobb ved importering. Feilmelding: 
```Failed to read segments on last flush. java.nio.file.FileSystemException: /data/elk/elasticsearch/data/elasticsearch/nodes/0/indices/logstash-2015.07.08/1/index/_0.si: Too many open files```

Det vi fant ut vha `ulimit -a` at maks åpne filer er 1024 og dette endret vi i `etc/security/limits.conf` til å være 50000.
```
aas            hard    nofile          50000
aas            soft    nofile          50000
```

Vi ser også at garbage collection jobber hardt for å redusere minnet til under 1GB som var max heap size. Dette kan gjøres som vist [her](https://www.elastic.co/guide/en/elasticsearch/guide/current/heap-sizing.html)

Så i `~/.bash_profile` satte vi:
```
export ES_HEAP_SIZE=2g
```

**Logg med samme parameternavn
NOTIS: Det er en åpenbar fordel å logge med samme parameternavn i parset logg og i jsonlogg. Hvis ikke blir søket helt ubrukelig.

