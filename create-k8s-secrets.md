[https://kubernetes.io/docs/concepts/configuration/secret/](https://kubernetes.io/docs/concepts/configuration/secret/) -&gt; use `Creating a Secret Manually`

Encode the values base64 / better use visual studio code plugin Encode Decode

```
echo -n "admin" | base64
```

! in kubernetes the env variables are authomatically decoded !

create secret file in a folder without version control

```
apiVersion: v1
kind: Secret
metadata:
  name: mysecret
type: Opaque
data:
  username: YWRtaW4=
  password: MWYyZDFlMmU2N2Rm
```

encrypt the folder with gpg

create secret in kubernetes

```
kubectl create -f ./secret.yaml
```

in kubernete

