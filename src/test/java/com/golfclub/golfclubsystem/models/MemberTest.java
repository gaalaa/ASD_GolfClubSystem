package com.golfclub.golfclubsystem.models;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

public class MemberTest {

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

    @Test
    void testGetEmail() {
        try {
            Member testMember = new Member(0, "Test", "Check", "test@golfclub.com", false);
            String email = testMember.getEmail();
            assertNotNull(email);
            assertEquals("test@golfclub.com", email);
        } catch (Exception e) {
            System.out.println("Error occurred while trying to test getEmail: \n" + e);
            fail(e);
        }
    }
}
