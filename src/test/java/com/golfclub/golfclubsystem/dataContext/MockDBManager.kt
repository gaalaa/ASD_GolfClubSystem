package com.golfclub.golfclubsystem.dataContext

import org.sqlite.SQLiteDataSource
import java.lang.Exception
import java.sql.Connection
import java.sql.SQLException
import java.sql.SQLTimeoutException

private const val CONNECTION_STRING = "jdbc:sqlite:test.db"

class MockDBManager {
    private lateinit var connection: Connection

    companion object DataSource {
        private val dataSource: SQLiteDataSource = SQLiteDataSource()
        val connection: Connection
            get() {
                dataSource.url = CONNECTION_STRING
                return dataSource.connection
            }

        fun initTestDB() {
            try {
                Class.forName("org.sqlite.JDBC")

                connection.createStatement().use { statement ->

                    statement.executeUpdate("""
                    DROP TABLE IF EXISTS Member;
                    CREATE TABLE Member (
                        id INTEGER PRIMARY KEY,
                        firstName TEXT,
                        lastName TEXT,
                        email TEXT NOT NULL UNIQUE,
                        password TEXT,
                        isAdmin INTEGER NOT NULL
                    );
                    INSERT INTO Member (firstName, lastName, email, password, isAdmin)
                        VALUES ('Admin', 'User', 'admin@golfclub.com', '1234', 1),
                               ('Test', 'User', 'test@golfclub.com', '1234', 0),
                               ('Member To', 'Update', 'update@golfclub.com', '1234', 0),
                               ('Member To', 'Delete', 'delete@golfclub.com', '1234', 0);
                """.trimIndent())
                }
            } catch (e: Exception) {
                when (e) {
                    is SQLTimeoutException, is SQLException -> {
                        println(e)
                        throw e
                    }

                    is ClassNotFoundException -> {
                        println("Could not find class for sqlite.JDBC. You may need to sync your Maven dependencies.")
                        throw e
                    }

                    else -> throw Exception(e)
                }
            } finally {
                connection.close()
            }
        }
    }
}