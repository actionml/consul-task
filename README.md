# Usage

```
docker run --rm --net=host -t -v /path/to/task:/config -v /path/to/.ssh:/ssh actionml/consul-task ./mytask.sh
```

The bellow is started on management machine (cron):

```
docker run --rm --net=host -t -v /home/aml/scheduled-train:/config -v /home/aml/.ssh:/ssh actionml/consul-task ./train_and_clean.sh
```

* Task config volume must contain .aws directory with required credentials for running aws cli commands
* Ssh volume must contain ssh keys to enable remote execution
* mytask.sh is supposed to be in the config volume
