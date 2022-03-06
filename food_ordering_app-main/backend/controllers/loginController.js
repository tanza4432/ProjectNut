"use strict";

const firebase = require("../db");
const Account = require("../models/login");
const firestore = firebase.firestore();

const addAccount = async (req, res, next) => {
  try {
    const data = req.body;
    await firestore.collection("account").doc().set(data);
    res.status(200).send(true);
  } catch (error) {
    res.status(400).send(error.message);
  }
};

const getAllAccount = async (req, res, next) => {
  try {
    const account = await firestore.collection("login");
    const data = await account.get();
    const AccountArray = [];
    if (data.empty) {
      res.status(404).send("ไม่พบข้อมูลใด");
    } else {
      data.forEach((doc) => {
        const account = new Account(
          doc.id,
          doc.data().username,
          doc.data().password,
          doc.data().type
        );
        AccountArray.push(account);
      });
      res.send(AccountArray);
    }
  } catch (error) {
    res.status(400).send(error.message);
  }
};

const Login = async (req, res, next) => {
  try {
    const email = req.params.email;
    const password = req.params.password;
    const accounts = await firestore
      .collection("account")
      .where("email", "==", email)
      .where("password", "==", password);
    const fetchAccount = await accounts.get();
    if (fetchAccount.empty) {
      res.status(404).send({ type: "none" });
    }
    return res.status(200).send({
      type: fetchAccount.docs[0].data().type,
      name: fetchAccount.docs[0].data().name,
    });
  } catch (error) {
    res.status(400).send(error.message);
  }
};

const updateAccount = async (req, res, next) => {
  try {
    const id = req.params.id;
    const data = req.body;
    const Account = await firestore.collection("login").doc(id);
    await Account.update(data);
    res.send("แก้ไขข้อมูลแล้ว");
  } catch (error) {
    res.status(400).send(error.message);
  }
};

const deleteAccount = async (req, res, next) => {
  try {
    const id = req.params.id;
    await firestore.collection("login").doc(id).delete();
    res.send("ลบสำเร็จ");
  } catch (error) {
    res.status(400).send(error.message);
  }
};

module.exports = {
  addAccount,
  getAllAccount,
  Login,
  updateAccount,
  deleteAccount,
};
