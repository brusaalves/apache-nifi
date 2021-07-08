# Apache NiFi

Apache NiFi supports powerful and scalable directed graphs of data routing, transformation, and system mediation logic. [View more](https://nifi.apache.org/).

<br>

## Usage guide

### App configuration

After repository clone, if you need to change NiFi settings, edit the `./app/nifi/src/conf/nifi.properties` file (which will be loaded into the container).

---
* Obs.:
    - This application contains a simple default configuration, that can be edited if necessary.
---

<br>

### App running

This project uses MakeFile (Linux) and the system command line to facilitate application operations. After configured, execute next commands to operate NiFi:

- Starting NiFi
    ```
    make up
    ```

- Stopping NiFi
    ```
    make down
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

- To load custom processors into NiFi, the `nar` packages should be placed on `./app/nifi/src/lib` folder.

- NiFi configurations file are located in `./app/nifi/src/conf`.

- NiFi flows are saved in `./app/nifi/src/flow`.