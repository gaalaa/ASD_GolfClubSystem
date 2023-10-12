package com.golfclub.golfclubsystem.dataContext;

import com.golfclub.golfclubsystem.models.Member;
import org.junit.jupiter.api.*;
import java.util.*;
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
            assertTrue(testMemberResponse.isPresent());
            Member testMember = testMemberResponse.get();

            assertNotNull(testMember);
            assertEquals("Test", testMember.getFirstName());
            assertEquals("User", testMember.getLastName());
            assertEquals("test@golfclub.com", testMember.getEmail());
            assertFalse(testMember.isAdmin());

        } catch (Exception e) {
            System.out.println("Error occurred while trying to get member by ID: \n" + e);
            fail(e);
        }
    }

    @Test
    void getByEmailAndPassword(){

        try{
            Optional<Member> testMemberResponse = memberDao.get("test@golfclub.com", "1234");
            assertTrue(testMemberResponse.isPresent());
            Member testMember = testMemberResponse.get();

            assertEquals("Test", testMember.getFirstName());
            assertEquals("User", testMember.getLastName());
            assertEquals(2, testMember.getId());
            assertFalse(testMember.isAdmin());
        }
        catch (Exception e){
            System.out.println("Error occurred while trying to get member by email and password: \n" + e);
            fail(e);
        }
    }

    @Test
    void getAll(){
        try {
            List<Member> testMembersList = memberDao.getAll();
            assertNotNull(testMembersList);
            for(Member member : testMembersList){

                switch (member.getId()){
                    case 1:
                        assertEquals("Admin", member.getFirstName());
                        assertEquals("User", member.getLastName());
                        assertEquals("admin@golfclub.com", member.getEmail());
                        assertTrue(member.isAdmin());
                        break;
                    case 2:
                        assertEquals("Test", member.getFirstName());
                        assertEquals("User", member.getLastName());
                        assertEquals("test@golfclub.com", member.getEmail());
                        assertFalse(member.isAdmin());
                        break;
                    case 3:
                        assertEquals("Member To", member.getFirstName());
                        assertEquals("Update", member.getLastName());
                        assertEquals("update@golfclub.com", member.getEmail());
                        assertFalse(member.isAdmin());
                        break;
                    case 4:
                        assertEquals("Admin", member.getFirstName());
                        assertEquals("User", member.getLastName());
                        assertEquals("admin@golfclub.com", member.getEmail());
                        assertFalse(member.isAdmin());
                        break;
                    case 5:
                        assertEquals("Test Add", member.getFirstName());
                        assertEquals("User", member.getLastName());
                        assertEquals("add@golfclub.com", member.getEmail());
                        assertFalse(member.isAdmin());
                        break;
                }
            }

        }
        catch (Exception e){
            System.out.println("Error occurred while trying to get all members: \n" + e);
            fail(e);
        }
    }

    @Test
    void add(){
        try{
            Member member = new Member(5, "Test Add", "User", "add@golfclub.com", true);
            member.setPassword("1234");
            memberDao.add(member);
            Optional<Member> retrievedMemberResponse = memberDao.get("add@golfclub.com", "1234");
            assertTrue(retrievedMemberResponse.isPresent());
            Member retrievedMember = retrievedMemberResponse.get();
            assertEquals("Test Add", retrievedMember.getFirstName());
            assertEquals("User", retrievedMember.getLastName());
            assertEquals("add@golfclub.com", member.getEmail());
            assertTrue(member.isAdmin());
        }
        catch (Exception e){
            System.out.println("Error occurred while trying to add a member: \n" + e);
            fail(e);
        }
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
            System.out.println("Error occurred while trying to update member: \n" + e);
            fail(e);
        }
    }

    @Test
    void delete() {
        try {
            memberDao.delete(4);
            Optional<Member> testMemberResponse = memberDao.get(4);
            assertFalse(testMemberResponse.isPresent());
        } catch (Exception e) {
            System.out.println("Error occurred while trying to delete member: \n" + e);
            fail(e);
        }
    }

    @Test
    void testGetFullName() {
        try {
            Member testMember = new Member(0, "Test", "Check", "test@golfclub.com", false);
            String fullName = testMember.getFullName();
            assertNotNull(fullName);
            assertEquals("Test Check", fullName);
        } catch (Exception e) {
            System.out.println("Error occurred while trying to test getFullName: \n" + e);
            fail(e);
        }
    }


}