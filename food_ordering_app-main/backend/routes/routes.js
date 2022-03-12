const express = require("express");
const {
  addAccount,
  getAllAccount,
  Login,
  updateAccount,
  deleteAccount,
} = require("../controllers/loginController");

const router = express.Router();

// router.get("/account", getAllAccount);
router.get("/account/:email/:password", Login);
router.post("/account", addAccount);
router.put("/account/:id", updateAccount);
router.delete("/account/:id", deleteAccount);

// stores
router.get("/store", );

module.exports = {
  routes: router,
};
