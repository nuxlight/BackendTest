# BackendTest

This is a backend application for a special test 😉

## 🧑‍🔧 How to launch the app

To start application, you can use docker with this command (docker-compose is required on your system)

```
$ docker-compose up
```

You can specify which service do you want to start, like this

```
# This start only the databases
$ docker-compose up db db_test 
```
> Don't forget to change database host in the settings if you want after start the app in development mode

## 🤓 API doc

This API has only one endpoint ```/user```

To create a new User in database, you have to send this POST request 

```
$ curl --location --request POST '127.0.0.1:3000/user' --header 'Content-Type: application/json' --data-raw '{"name": "TGV"}'
```

Normally, you will be able to have this response with the creation details

```
{
    "name": "TGV"
}
```

### 🤯 Errors

You have to respect this rules for the username : 3 characters only in uppercase and no number.
If the username already exist, don't worry, our API generate for you a new one.

If rules are not respected, our API return the corresponding errors like that :
```
{
    "errors": [
        "User should have 3 characters"
    ]
}
```

## 🙏 Thanks

Thanks to the secret company to give me this exercise.