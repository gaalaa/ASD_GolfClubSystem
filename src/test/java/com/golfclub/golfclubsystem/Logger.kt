package com.golfclub.golfclubsystem

import java.nio.charset.Charset
import java.nio.file.OpenOption
import java.nio.file.Path
import java.nio.file.StandardOpenOption
import java.time.Instant
import java.time.ZoneOffset
import java.time.format.DateTimeFormatter
import java.util.*
import kotlin.io.path.Path
import kotlin.io.path.createFile
import kotlin.io.path.writeText
import kotlin.io.path.writer

class Logger(pathToLogDirectory: String) {
    private var file: Path

    companion object {
        private var _logger: Logger? = null
        fun initLogger(pathToLogDirectory: String): Logger {
            if (_logger == null)
                _logger = Logger(pathToLogDirectory)
            return _logger as Logger
        }
    }

    init {
        val date = DateTimeFormatter.ofPattern("yyyy-MM-dd HH_mm_ss").withZone(ZoneOffset.UTC).format(Instant.now())
        file = Path("${pathToLogDirectory}/${date}_log")
        file.createFile()
    }

    fun log(message: String) {
        val callerDetails = Thread.currentThread().stackTrace[2]
        file.writeText("[LOG] - ${callerDetails.className}:${callerDetails.methodName}:${callerDetails.lineNumber}\n", Charsets.UTF_8, StandardOpenOption.APPEND);
    }

    fun logPassed() {
        val callerDetails = Thread.currentThread().stackTrace[2]
        file.writeText("[SUCCESS] - ${callerDetails.className}:${callerDetails.methodName}:${callerDetails.lineNumber}\n", Charsets.UTF_8, StandardOpenOption.APPEND)
    }

    fun logFailed() {
        val callerDetails = Thread.currentThread().stackTrace[2]
        file.writeText("[FAIL] - ${callerDetails.className}:${callerDetails.methodName}:${callerDetails.lineNumber}\n", Charsets.UTF_8, StandardOpenOption.APPEND)
    }
}