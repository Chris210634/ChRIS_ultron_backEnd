# pl-simpledsapp
pfurl --auth chris:chris1234 --verb POST --http ${HOST_IP}:8000/api/v1/plugins/9/instances/ \
--content-type application/vnd.collection+json \
--jsonwrapper 'template' --msg '
{"data":
    [
     {"name":"sleepLength",
      "value":"0"},
     {"name":"prefix",
      "value":"test-"},
     {"name":"previous_id",
      "value":"1"},
     {"name":"priority",
      "value":"9"}
    ]
}' \
--quiet --jsonpprintindent 4
