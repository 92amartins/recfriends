# RecFriends

A friends' recommendation service that connects you to interesting people!

## Endpoints
* **friends**: Get friends of a person
```
http://46.101.166.39/recfriends/friends?person=Eduardo
{
	"friends": ["Gabriel", "Mari", "Arthur"]
}
```

* **suggested**: Get suggested friends for a person
```
http://46.101.166.39/recfriends/suggested?person=Arthur
{
	"suggested": ["Gabriel"]
}
```

## Logs

For some unknown reason, the API can write logs when tested locally, but fails to do so in the server (possibly is a permission issue).

You can find a very basic logging implementation in [logs](https://github.com/a-n-d-r-e-i/recfriends/tree/logs) branch. There, sample logs are shown inside `api/logs` folder for each service.

## Built With

* [R](https://www.r-project.org/)
* [Neo4J](https://neo4j.com/) hosted at [GrapheneDB](https://www.graphenedb.com/)

## Authors

* **Andrei Martins**
