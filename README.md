# Quickstart Bootstrap

Quick Start Bootstrap Full Stack Solution aims to help individual developers and small software companies to kick off their projects as fast as possible built on professional extendable architecture

Quickstart Bootstrap utilizes cutting edge frameworks and libraries to deliver common functionalities out of the box in a standard way, these functionalities are needed by most of the software projects, and it consumes plenty of time to be implemented for every project

Quickstart Bootstrap is opinionated toward a short TTM (Time To Market), so it strives to have:

- Fast setup
- Easy extendability
- Up-to-date compatible dependencies
- High performance

## For Whom

Consider using Quickstart Bootstrap if you are:

- Student building graduation project or assignment
- Fresh developer into trying a full stack solution
- Adventurous developer(s) needing a fast kick-off for a hackathon
- Entrepreneur building a proof of concept
- Company prototyping a new product

| |Server|App|
| ------------ | ------------ | ------------ |
|Main Functionalities|- RESTful APIs <br> - API UI to try the RESTful APIs<br>- Basic Authentication utilizing database realm<br>- JDBC connection with pooling<br>- ORM integration<br>- Push notifications capability| - Login / Sign up module<br>- Shared preferences app data load / store<br>- Rest API client<br>- Simple Google Analytic and FCM (push notifications) integration|
|Technologies Utilized|- Docker & Docker-Compose<br>- PostgreSQL Database<br>- Quarkus (elytron-security-jdbc, jdbc-postgresql, resteasy, SmallRye OpenAPI, quarkus-jdbc-postgresql, Hibernate ORM with Panache)|- Flutter<br>- [flutter_login](https://pub.dev/packages/flutter_login "flutter_login")<br>- Flutter [shared_preferences](https://pub.dev/packages/shared_preferences/ "shared_preferences")<br>- Flutter [firebase_messaging](https://pub.dev/packages/firebase_messaging "firebase_messaging")|
|Requirements|- JDK 8 or 11<br>- Docker & Docker Compose<br>- Maven<br>- Modern IDE (VS Code recommended) |- Flutter Framework<br>- Modern IDE (Android Studio recommended) |

## Notes

- As mentioned, Quickstart Bootstrap is for prototyping, it does not fit to be a production deliverable
- Because usually prototypes have short life span, so backward compatibility is not highly considered characteristic  
- Currently mobile App target the Android platform only
- No web frontend client yet (in progress)
