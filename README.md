# ASD_GolfClubSystem

## Repo Structure
The repo is organised in a typical Java-Maven project structure.
All source files can be found in the src directory, with application
files in the src/main directory and test files in the src/test directory.

The Maven pom.xml file lives in the top-level.

## Building
To build the project run:
```shell
mvn clean package
```

## Testing
To test the project run:
```shell
mvn test
```

## Contributions

### Michael

- loginServlet
- userRegistrationServlet
- MemberDao.kt
- login.jsp
- userRegistration.jsp
- login.css
- userRegistration.css
- MemberDaoTest.kt
- editPersonalDetailsServlet
- cancelMembershipServlet
- EmailManager (Could only get it sending emails from authorized devices. Calls to it have been commented out to allows use of website without error)

### Peter
- AdminAddMemberServlet
- AdminEditMemberServlet
- AdminMemberServlet
- AdminServlet
- LogoutServlet
- DBManager
- IDao
- MemberDao
- Member
- Attributes
- MemberDaoTest
- MockDBManager

### Jiale(Gala)
- reservation.jsp
- editreservation.jsp
- ReservationServlet
- EditreservationServlet
- ReservationDao
- Reservation.java
