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

## Built With

* [R](https://www.r-project.org/)
* [Neo4J](https://neo4j.com/) hosted at [GrapheneDB](https://www.graphenedb.com/)

## Authors

* **Andrei Martins**
