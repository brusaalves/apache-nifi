@ECHO OFF

SET trigger=%1
SET command=%2

CD docker

REM ALL TRIGGERS
IF "%trigger%" == "run-docker" (
    CALL :run-docker %command%
) ELSE IF "%trigger%" == "docker-up" (
    CALL :docker-up
) ELSE IF "%trigger%" == "docker-down" (
    CALL :docker-down
) ELSE IF "%trigger%" == "docker-logs" (
    CALL :docker-logs
) ELSE IF "%trigger%" == "docker-ps" (
    CALL :docker-ps
) ELSE IF "%trigger%" == "docker-build" (
    CALL :docker-build
) ELSE IF "%trigger%" == "docker-build-no-cached" (
    CALL :docker-build-no-cached
) ELSE IF "%trigger%" == "start" (
    CALL :start
) ELSE IF "%trigger%" == "stop" (
    CALL :stop
) ELSE IF "%trigger%" == "restart" (
    CALL :restart
) ELSE IF "%trigger%" == "build" (
    CALL :build
) ELSE IF "%trigger%" == "reload" (
    CALL :reload
) ELSE IF "%trigger%" == "status" (
    CALL :status
) ELSE IF "%trigger%" == "logs" (
    CALL :logs
) ELSE (
    ECHO unknown command
)
CD ..
EXIT /B 0

REM MAIN FUNCTIONS
:start
    CALL :docker-up
EXIT /B 0
:stop
    CALL :docker-down
EXIT /B 0
:restart
    CALL :stop
    CALL :start
EXIT /B 0
:build
    CALL :docker-build-no-cached
EXIT /B 0
:reload
    CALL :build
    CALL :restart
EXIT /B 0
:status
    CALL :docker-ps
EXIT /B 0
:logs
    CALL :docker-logs
EXIT /B 0

REM DOCKER FUNCTIONS
:docker-up
    CALL :run-docker "up -d"
EXIT /B 0
:docker-down
    CALL :run-docker "down"
EXIT /B 0
:docker-logs
    CALL :run-docker "logs -f"
EXIT /B 0
:docker-ps
    CALL :run-docker "ps"
EXIT /B 0
:docker-build
    CALL :run-docker "build"
EXIT /B 0
:docker-build-no-cached
    CALL :run-docker "build --no-cache"
EXIT /B 0

REM RUN DOCKER
:run-docker
    SET operation=%~1
    ECHO MAKING: docker-compose %operation%
    docker-compose %operation%
EXIT /B 0