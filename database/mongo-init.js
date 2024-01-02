conn = new Mongo();
db = conn.getDB("database");

console.log(db);

db.createUser({
  user: "myUser",
  pwd: "myPassword",
  roles: [{ role: "readWrite", db: "database" }],
});

db.myCollectionName.createIndex({ "user.email": 1 }, { unique: false });

db.myCollectionName.insert({
  email: "hhh@ggg.com",
  name: "Mike",
  phone: "1234",
});
db.myCollectionName.insert({
  email: "ggg@ggg.com",
  name: "Helga",
  phone: "4321",
});
