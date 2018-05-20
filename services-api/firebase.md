# Firebase

```text
# source https://www.youtube.com/watch?v=DYfP-UIKxH0
# install node and npm
npm i -g firebase-tools
mkdir firebase-sample
firebase login
firebase init
```

Typescript: [https://stackify.com/typescript-vs-javascript-migrate/](https://stackify.com/typescript-vs-javascript-migrate/)

Implement the functions ...

Save configuration: [https://firebase.google.com/docs/functions/config-env](https://firebase.google.com/docs/functions/config-env) 

```text
# config secrets
firebase functions:config:set facebook.healthengineer.verifytoken=$(lpass show facebook-healthengineer --password)
#check
firebase functions:config:get
```

