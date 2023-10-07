package com.golfclub.golfclubsystem.dataContext

import jakarta.servlet.ServletContextEvent
import jakarta.servlet.ServletContextListener
import org.sqlite.SQLiteDataSource
import java.sql.Connection
import java.sql.SQLException
import java.sql.SQLTimeoutException

private const val CONNECTION_STRING = "jdbc:sqlite:database.db"
private const val CURRENT_VERSION = 1

/**
 * DBManager is responsible for initialising and upgrading the database on startup and managing connections to the database.
 */
class DBManager : ServletContextListener {
    private lateinit var connection: Connection

    // Note(Pete): This is effectively the same as a static object in Java. To get a connection to the database
    // you must access DBManager.DataSource and call `getConnection()` from Java or access the `connection` property
    // in Kotlin.
    companion object DataSource {
        private val dataSource: SQLiteDataSource = SQLiteDataSource()
        val connection: Connection
            get() {
                dataSource.url = CONNECTION_STRING
                return dataSource.connection
            }

        fun getGeneratedKey(c: Connection): Int {
            c.createStatement().use { statement ->
                val rs = statement.executeQuery("SELECT last_insert_rowid()")
                if (rs.next()) {
                    return rs.getInt(1)
                }
            }
            // RowId not found.
            throw Exception("Row ID not found")
        }
    }

    // This runs each time the web application starts.
    override fun contextInitialized(sce: ServletContextEvent?) {
        try {
            // Load the sqlite JDBC class at runtime.
            Class.forName("org.sqlite.JDBC")

            // Connect to the database file. This also creates the file if it doesn't exist yet.
            connection = DataSource.connection
            connection.createStatement().use { statement -> // This will close the statement automatically when we're finished.
                // Check the user_version field and apply any necessary migrations.
                // Note(Pete): user_version is special field that sqlite doesn't use itself, so we can use it for anything
                // we like. In this case, keeping track of the database version without a separate table.
                statement.executeQuery("PRAGMA user_version").use { userVersionResult ->
                    if (userVersionResult.next()) {
                        val dbVersion = userVersionResult.getInt("user_version")

                        // Note(Pete): This is effectively a fallthrough mechanism that will apply each migration one at a time
                        // so that the database can be upgrade from any version.
                        if (dbVersion == 0) upgradeFromV0()
                        if (dbVersion < 1) { /* Next migration goes here. */
                        }
                    } else {
                        throw SQLException("Could not get user_version.")
                    }
                }

                // Set the user_version to the new current database version.
                statement.executeUpdate("PRAGMA user_version = $CURRENT_VERSION")
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

    // Note(Pete): Upgrade steps should not be changed unless there's a good reason as they are needed to upgrade the database
    // from any given version. If the database needs a change, create a new upgrade.
    private fun upgradeFromV0() {
        connection.createStatement().use { statement ->
            statement.executeUpdate("""
            CREATE TABLE Member (
                id INTEGER PRIMARY KEY, -- Alias rowid to auto increment (this is a sqlite thing)
                firstName TEXT,
                lastName TEXT,
                email TEXT NOT NULL UNIQUE,
                password TEXT,
                isAdmin INTEGER NOT NULL
            );
            INSERT INTO Member (firstName, lastName, email, password, isAdmin)
            VALUES ('Admin', 'User', 'admin@golfclub.com', '1234', 1)
        """.trimIndent())
        }
    }

}