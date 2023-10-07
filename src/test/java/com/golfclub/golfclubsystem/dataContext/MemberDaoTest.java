package com.golfclub.golfclubsystem.dataContext;

import com.golfclub.golfclubsystem.models.Member;
import org.junit.jupiter.api.*;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;

class MemberDaoTest {
    private static MemberDao memberDao;

    @BeforeAll
    static void setup() {
        MockDBManager.DataSource.initTestDB();
        memberDao = new MemberDao(MockDBManager.DataSource.getConnection());
    }

    @AfterAll
    static void cleanup() {
        try {
            memberDao.close();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Test
    void getById() {
        try {
            Optional<Member> testMemberResponse = memberDao.get(2);
            Member testMember = testMemberResponse.get();

            assertNotNull(testMember);
            assertEquals("Test", testMember.getFirstName());
            assertEquals("User", testMember.getLastName());
            assertEquals("test@golfclub.com", testMember.getEmail());
            assertFalse(testMember.isAdmin());

        } catch (Exception e) {
            System.out.println(e);
            fail(e);
        }
    }

    @Test
    void getByEmailAndPassword() {
    }

    @Test
    void getAll() {
    }

    @Test
    void add() {
    }

    @Test
    void update() {
        try {
            Optional<Member> testMemberResponse = memberDao.get(3);
            Member testMember = testMemberResponse.get();

            String newFirstName = "Updated";
            String newLastName = "Member";
            String newEmail = "updated@golfclub.com";

            testMember.setFirstName(newFirstName);
            testMember.setLastName(newLastName);
            testMember.setEmail(newEmail);
            testMember.setAdmin(true);
            memberDao.update(testMember);

            Optional<Member> updatedMemberResponse = memberDao.get(3);
            Member updatedMember = updatedMemberResponse.get();

            assertNotNull(updatedMember);
            assertEquals(newFirstName, updatedMember.getFirstName());
            assertEquals(newLastName, updatedMember.getLastName());
            assertEquals(newEmail, updatedMember.getEmail());
            assertTrue(updatedMember.isAdmin());

        } catch (Exception e) {
            System.out.println(e);
            fail(e);
        }
    }

    @Test
    void delete() {
        try {
            memberDao.delete(4);
        } catch (Exception e) {
            System.err.println(e);
            fail(e);
        }
    }
}