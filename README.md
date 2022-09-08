# safe_password_with_hasura

## Project developed using Firebase as authenticator and Hasura as Back-end

### This Project consists of an app to store passwords in the cloud, so you can add passwords, delete them and copy them to the clipboard.





https://user-images.githubusercontent.com/81427844/189205647-8ad14641-7015-4978-b217-78ecd78385c4.mp4



Installation of this project is very easy.

You will need to configure your Firebase through the [Firebase CLI](https://firebase.google.com/docs/cli) , the official firebase tool that makes project configuration easy.


After installing, when finished, run the commands

     firebase login

     flutterfire config

Enable email authentication mode in your firebase.

change the name of the **example.env** file to **.env**

Now configure the **.env** file in your project with the necessary Keys.

Create the table "password" and "users" in your hasura and that's it !! Your app is ready to use.
