[https://kubernetes.io/docs/concepts/configuration/secret/](https://kubernetes.io/docs/concepts/configuration/secret/) -&gt; use `Creating a Secret Manually`

Encode the values base64 / better use visual studio code plugin Encode Decode \(`Convert Section)`

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

install gpg tools: [https://gpgtools.org/](https://gpgtools.org/)

[https://www.gnupg.org/documentation/manuals/gnupg/gpg\_002dzip.html](https://www.gnupg.org/documentation/manuals/gnupg/gpg_002dzip.html)

create to following aliases in `.zshrc`:

```
alias lock-secret-files="cd ~/Desktop/ && gpg-zip -e -o secret-files -r den.seidel@gmail.com secret && mv -f ~/Desktop/secret-files ~/Google\ Drive/backupx/ && rm -rf ~/Desktop/secret"

alias unlock-secret-files="cd ~/Desktop && gpg-zip -d ~/Google\ Drive/backupx/secret-files -r den.seidel@gmail.com"
```

create secret in kubernetes \(secrets muss be in the same namespace as the pod!\)

```
kubectl create --namespace=default -f ./secret.yaml
```

in kubernetes

