const express = require("express");
const app = express();

const bodyParser = require("body-parser");

const authRoutes = require("./routes/auth");

const mongoose = require("mongoose");
const cors = require("cors");

require("dotenv").config();
const { MONGO_URL, PORT } = process.env;

const port = 3000;
app.use(cors());

mongoose
  .connect(MONGO_URL, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  })
  .then(() => console.log("MongoDB is  connected successfully"))
  .catch((err) => console.error(err));

app.use(bodyParser.json());

app.use("/api", authRoutes);

app.get("/", (req, res) => {
  res.send("Hello World!");
});

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
