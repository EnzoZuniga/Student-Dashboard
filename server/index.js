const { ApolloServer } = require("apollo-server");
const mongoose = require("mongoose");
const typeDefs = require("./Schema");
const { resolvers } = require("./Resolvers");

const server = new ApolloServer({
  typeDefs,
  resolvers
});

mongoose.connect(
  "mongodb://student:hetic2019@ds239578.mlab.com:39578/student",
  () => {
    console.log("connect to the database🌈");
  }
);

server.listen({ port: process.env.PORT || 4000 }).then(({ url }) => {
  console.log(`🚀 Server ready at ${url}`);
});
