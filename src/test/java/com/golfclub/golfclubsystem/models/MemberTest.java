package com.golfclub.golfclubsystem.models;

import com.golfclub.golfclubsystem.Logger;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

public class MemberTest {
    private static Logger logger;

    @BeforeAll
    static void setup() {
        logger =  Logger.Companion.initLogger("./logs");
    }

    @Test
    void testGetFullName() {
        try {
            Member testMember = new Member(0, "Test", "Check", "test@golfclub.com", false);
            String fullName = testMember.getFullName();
            assertNotNull(fullName);
            assertEquals("Test Check", fullName);
            logger.logPassed();
        } catch (Exception e) {
            System.out.println("Error occurred while trying to test getFullName: \n" + e);
            logger.logFailed();
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
            logger.logPassed();
        } catch (Exception e) {
            System.out.println("Error occurred while trying to test getEmail: \n" + e);
            logger.logFailed();
            fail(e);
        }
    }
}
