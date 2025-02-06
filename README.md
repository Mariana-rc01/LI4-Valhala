![Valhala](.github/assets/valhala.png)

## Grade: 16/20 :star:

This project was developed for LI4 course, part of the third-year curriculum in the Software Engineering bachelor's program at the University of Minho. It implements a web based application that manages a company's assembly line and business logic.

## 🛠️ Usage

To run the application with hot reload 🔥 (on the `src` directory):

```
$ dotnet watch run
```

To run the database with docker 🐋:

```
$ docker-compose -f docker-compose.yml up db
```

And to setup the schemas and seeds:

```
$ docker-compose -f docker-compose.yml up db.configurator
```
