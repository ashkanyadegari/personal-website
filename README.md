# README

A simple personal blog running on ruby on rails. Hopefully to inspire others to create their own blog from scratch and continue coding after that.

In order to run it locally:

```
bundle install
yarn install
rails s
```

Hero content is hard-coded and can be adjusted in index.html.erb

Authentication is with devise, and authorization is with pundit. At the moment only an admin can CRUD content. Permissions can be changed in the policy.


##Important

Images are currently being managed via active storage and cloudinary. In order to have image upload working, make sure to set up an cloudinary account and put the key in .env file

such as:
```
CLOUDINARY_URL=cxxxxxxxxxxxxxxx

```
