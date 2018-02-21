pfurl --verb POST --raw --http ${HOST_IP}:5005/api/v1/cmd --httpResponseBodyParse --jsonwrapper 'payload' --msg \
    '{  "action": "hello",
        "meta": {
                    "askAbout":     "sysinfo",
                    "echoBack":      "Hi there!",
                    "service":       "host"
                }
    }'
