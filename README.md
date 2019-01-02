# Docker mongodb dumper 

#### To dump database:
```bash
./dump.sh -h YOUR_HOST
```

There are several additional options:
```text
-h (required) -- host name
-p            -- port
-d            -- database name; if not set - all database will be dumped
-o            -- additional options for mongodump command; wrap in double quotas all the options
```

As a result you have db dump in the current folder. 

#### To restore database:
```bash
./restore.sh -f PATH_TO_FILE -h YOUR_HOST
```
There are several additional options:
```text
-f (required) -- path to file
-h (required) -- host name
-p            -- port
-o            -- additional options for mongorestore command; wrap in double quotas all the options
```

---

You can always see help info by run command with option `--help`:
```bash
./restore.sh --help
```
Inspired by [Ferikl](https://github.com/Ferikl)
