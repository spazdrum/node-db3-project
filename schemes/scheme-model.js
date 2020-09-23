const db = require("../data/db-config");

module.exports = {
  find,
  findById,
  findSteps,
  add,
  update,
  remove,
};

function find() {
  return db("schemes");
}

function findById(id) {
  return db("schemes").where({ id });
}

function findSteps(id) {
  return db("schemes as s")
    .join("steps as st", "s.id", "st.scheme_id")
    .where({ "s.id": id })
    .orderBy("st.step_number");
}

function add(newSchema) {
  return db("schemes as s")
    .insert(newSchema)
    .then((res) => {
      return db("schemes as s").where({
        "s.id": res[0],
      });
    })
    .catch((err) => {
      return console.log(err);
    });
}

function update(changes, id) {
  return db("schemes as s")
    .where({ id })
    .update(changes)
    .then((res) => {
      return findById(id);
    })
    .catch((err) => {
      console.log(err);
    });
}

function remove(id) {
  return db("schemes as s")
    .where({ "s.id": id })
    .del()
    .then((res) => {
      return res;
    })
    .catch((err) => {
      return console.log(err);
    });
}
