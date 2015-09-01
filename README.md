# Docker-Prosody

## Quickstart

### Create the Data Container

```sh
docker create --name prosody-data --volume /etc/prosody --volume /var/log/prosody --volume /var/lib/prosody klingtdotnet/prosody
```

### Edit the Config File

- enter admin users
- make security settings
- add virtual hosts, preferably in `/etc/prosody/conf.avail/` and symlink them to `/etc/prosody/conf.d/`

```sh
docker run --rm --volumes-from prosody-data -it klingtdotnet/vim vim /etc/prosody/prosody.cfg.lua
```

### Register an Admin User

- replace `ADMIN`, `HOST`, `PASSWORD` with the actual values
- note that the `HOST` has to be defined as virtual host first

```sh
docker run --rm --volumes-from prosody-data -it klingtdotnet/prosody prosodyctl register ADMIN HOST PASSWORD
```

### Import Certificates Into the Data Container

```sh
docker run --rm --volumes-from prosody-data --volume /path/to/certs:/cert -it klingtdotnet/prosody /bin/bash
```

- copy your certificates from `/cert` to `/etc/prosody` or wherever you like them to be

### Run

- now you can run prosody

```sh
docker run --rm -p 5222:5222 -p 5269:5269 --volumes-from prosody-data -it klingtdotnet/prosody prosodyctl start
```
