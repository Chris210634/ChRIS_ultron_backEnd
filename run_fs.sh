# pl-dircopy
pfurl --auth chris:chris1234 --verb POST --http ${HOST_IP}:8000/api/v1/plugins/8/instances/ \
--content-type application/vnd.collection+json \
--jsonwrapper 'template' --msg '
{"data":
    [{"name":"dir",
      "value":"/data/ants"}
    ]
}' \
--quiet --jsonpprintindent 4
