const express = require("express");
const app = express();
const cors = require("cors");

//middleware

app.use(express.json());
app.use(cors());

//Router//

//Register and login routes

app.use("/auth", require("./routes/jwtAuth"));

//dashboard route

app.use("/dashboard", require("./routes/dashboard"));

app.listen(5000, () => {
  console.log("server is running at port 5000")
})
