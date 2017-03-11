# Usage

```
docker run --rm --net=host -t -v /path/to/task:/config -v /path/to/.ssh:/ssh actionml/consul-task ./mytask.sh
```

* Task config volume must contain .aws directory with required credentials for running aws cli commands
* Ssh volume must contain ssh keys to enable remote execution
* mytask.sh is supposed to be in the config volume
