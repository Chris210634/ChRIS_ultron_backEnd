sudo oc cluster up
sudo oc login -u system:admin --insecure-skip-tls-verify=true
sudo oc create sa robot -n myproject
sudo oc describe sa robot -n myproject
token="$(sudo oc describe sa robot)"
token=$(echo "$token" | grep -A 2 "Mountable secrets" | grep -v "Tokens: ")
token=$(echo "$token" | grep "robot-token-*")
token=$(echo "$token" | cut --delimiter=: --fields=2)
token=$(echo "$token" | tr -d '[:space:]')
sudo oc adm policy add-role-to-user edit system:serviceaccount:myproject:robot -n myproject
sudo oc describe secret $token -n myproject
token_val=$(sudo oc describe secret $token | grep "token: *" )
token_val=$(echo "$token_val" | cut -c 7- | sed -e 's/^[ \t]*//')

#set up shared dir and scc restricted 
sudo mkdir /tmp/share
sudo chcon -R -t svirt_sandbox_file_t /tmp/share/
sudo oc patch scc restricted -p 'allowHostDirVolumePlugin: true'
sudo oc patch scc restricted -p '"runAsUser": {"type": "RunAsAny"}'
rm -f ~/.kube/config
oc login --token=$token_val --server=172.30.0.1:443 --insecure-skip-tls-verify=true
oc project myproject
oc create secret generic kubecfg --from-file=$HOME/.kube/config -n myproject
rm -f ~/.kube/config
oc login --username='developer' --password='developer' --server=localhost:8443 --insecure-skip-tls-verify=true
#oc new-app pman/openshift/pman-openshift-template-without-swift.json
#oc set env dc/pman OPENSHIFTMGR_PROJECT=myproject
#oc new-app pfioh/openshift/pfioh-openshift-template-without-swift.json
