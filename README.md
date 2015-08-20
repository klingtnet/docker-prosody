# Docker-Prosody

## Quickstart

### Create the Data Container

```sh
docker create --name prosody-data --volume /etc/prosody --volume /var/log/prosody --volume /var/lib/prosody prosody
```

### Register an Admin User

- replace `ADMIN`, `HOST`, `PASSWORD` with the actual values

```sh
docker run --rm --volumes-from prosody-data -it prosody prosodyctl register ADMIN HOST PASSWORD
```

### Edit the Config File

- enter admin users
- make security settings
- ...

```sh
docker run --rm --volumes-from prosody-data -it vim klingtdotnet/vim /etc/prosody/prosody.cfg.lua
```

### Import Certificates Into the Data Container

```sh
docker run --rm --volumes-from prosody-data --volume /path/to/certs:/cert -it prosody /bin/bash
```

- copy your certificates from `/cert` to `/etc/prosody` or wherever you like them to be

### Run

- now you can run prosody

```sh
docker run --rm -p 5222:5222 -p 5269:5269 --volumes-from prosody-data -it prosody prosodyctl start
```
