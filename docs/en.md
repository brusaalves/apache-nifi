# Apache NiFi

Apache NiFi supports powerful and scalable directed graphs of data routing, transformation, and system mediation logic. [View more](https://nifi.apache.org/).

<br>

## Usage guide

### App configuration

After repository clone, edit `.env` file located on `/env` directory. This file has environments configurations to Docker and your network. The required parameters here are:

```properties
# Docker network subnet
ENV_SUBNET=XXX.XXX.XXX.XXX/X

# Docker Image (available on DockerHub)
NIFI_IMAGE=apache/nifi:X.X.X

# NiFi container IP (according to subnet setted in: ENV_SUBNET)
NIFI_IP=XXX.XXX.XXX.XXX

# Host machine port to access container
NIFI_ACCESS_PORT=XXXX

# NiFi port (setted in /app/nifi/src/conf/nifi.properties file)
NIFI_PORT=XXXX
```

That done, if you need to change NiFi settings, edit the `/app/nifi/src/conf/nifi.properties` file (which will be loaded into the container).

---
* Obs.:
    - This application contains a simple default configuration, that can be edited if necessary.
    - The configurations reset available in official NiFi Docker image was disabled on this application.
---

<br>

### App running

This project uses MakeFile (Linux) and the system command line to facilitate application operations. After configured, execute next commands to operate NiFi:

- Starting NiFi
    ```
    make start
    ```

- Disabling NiFi
    ```
    make stop
    ```

- Restarting NiFi
    ```
    make restart
    ```

- Build NiFi Docker image
    ```
    make build
    ```

- Build NiFi Docker image and restart NiFi (to apply changes)
    ```
    make reload
    ```

- Show services status (Docker)
    ```
    make status
    ```

- Watch services logs
    ```
    make logs
    ```
    
---
* Obs.: 
    - For Windows users, there is a batch script as an alternative to MakeFile. There is no difference between the commands mentioned above.
---

<br>

### Project structure

- To load custom processors into NiFi, the `nar` packages should be placed on `/app/nifi/src/lib` folder.

- To update NiFi confiurations, edit the `nifi.properties` file, located in `/app/nifi/src/conf`. To edit or load other configuration file, these should be placed in the `/app/nifi/src/conf` (volume pointed to `/opt/nifi/nifi-current/conf/custom`) folder and reference it on `nifi.properties`.