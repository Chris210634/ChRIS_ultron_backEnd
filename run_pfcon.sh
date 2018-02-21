pfurl --verb POST --raw --http 127.0.0.1:5005/api/v1/cmd \
      --httpResponseBodyParse \
      --jsonwrapper 'payload' --msg '
        {   "action": "coordinate",
            "threadAction":     true,
            "meta-store": {
                        "meta":         "meta-compute",
                        "key":          "jid"
            },
             
            "meta-data": {
                "remote": {
                        "key":          "%meta-store"
                },
                "localSource": {
                        "path":         "/home/chliao/workingdir/ChRIS-E2E/ChRIS_ultron_backEnd"
                },
                "localTarget": {
                        "path":         "/tmp/pfcon-test",
                        "createDir":    true
                },
                "specialHandling": {
                        "op":           "plugin",
                        "cleanup":      true
                },
                "transport": {
                    "mechanism":    "compress",
                    "compress": {
                        "encoding": "none",
                        "archive":  "zip",
                        "unpack":   true,
                        "cleanup":  true
                    }
                },
                "service":              "openshiftlocal"
            },

            "meta-compute":  {
                "cmd":      "$execshell $selfpath/$selfexec --sleepLength 30 --prefix out- /share/incoming /share/outgoing",
                "auid":     "rudolphpienaar",
                "jid":      "90",
                "threaded": true,
                "container":   {
                        "target": {
                            "image":            "fnndsc/pl-simpledsapp",
                            "cmdParse":         true
                        },
                        "manager": {
                            "image":            "fnndsc/swarm",
                            "app":              "swarm.py",
                            "env":  {
                                "meta-store":   "key",
                                "serviceType":  "docker",
                                "shareDir":     "%shareDir",
                                "serviceName":  "90"
                            }
                        }
                },
                "service":              "openshiftlocal"
            }
        }
'
