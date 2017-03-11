# Usage

```
docker run --rm -t -v /path/to/task:/config -v /path/to/.ssh:/ssh mytask.sh
```

* Task config volume must contain .aws directory with required credentials for running aws cli commands.
* Ssh volume must contain ssh keys to enable remote execution
