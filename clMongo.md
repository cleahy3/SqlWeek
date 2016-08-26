# MongoDB Brewdog Lab

So now you've seen how we can interact with MongoDB NoSQL databases, it's time to stretch ourselves and have a bit of a pratice. 

### Setup
Run the following bash script from your command line to import the data from Brewdog's Punk API into a database called `brewdog` on your local machine:

```bash
touch punkapi.json && curl https://punkapi.com/api/v1/beers -u c4ae17fcb0f44fccb93f5c8494732b72 >> punkapi.json && mongoimport --db brewdog --collection beers --jsonArray --file ./punkapi.json && rm ./punkapi.json
```
Inside the brewdog database you'll find a collection called beers, containing loads of data about the beers brewdog provide for us.

### Tasks

Find a Mongo command that will do each of the following tasks. Google and the MongoDB docs are your friends: 

1. Returns all the beers in the database 
````javascript
db.beers.find();
````
2. Returns how many beers are in the database as a number
````javascript
db.beers.find().count();
````
3. Returns the names and alcohol contents of all the beers in the database 
````javascript
db.beers.find({},{name:true,abv:true);
````
4. Adds a custom beer with your chosen values
````javascript
db.beers.insert({ id:60, name:'Callum's Beer',\s\s tagline:'Boss Beer',first_brewed:'December \s\s 1992',description:'tasty'});
````
10. Returns the 10 strongest beers
````javascript
db.beers.find({}).sort({abv:-1}).limit(10);
````
11. Returns the three weakest beers
````javascript
db.beers.find({}).sort({abv:1}).limit(3);
````
4. Returns the beer with the highest pH value
````javascript
db.beers.find({}).sort({ph:-1}).limit(1).pretty();
````
6. Returns the beer with the highest number of hop varieties in its recipe
````javascript
db.beers.find({}).sort({hops:-1}.limit(1).pretty();
````
7. Returns the beer that pairs best with Haggis Spring Rolls
````javascript
db.beers.find({
````
8. Finds your favourite beer and adds a "favourites" field to it with your name
````javascript
db.beers.update({name:'Bad Pixie'},{$setOnInsert:{favourites:'Callum'}});
````
9. Changes the "contributed_by" field for all the beers to your name
````javascript
db.beers.update({},{$set:{contributed_by:'Callum Leahy'}},{multi:true});
````
