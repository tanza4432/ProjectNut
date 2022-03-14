"use strict";

const firebase = require("../db");
const firestore = firebase.firestore();
const StoreModel = require("../models/store");

const getStore = async (req, res, next) => {
  try {
    const store = await firestore.collection("stores");
    const data = await store.get();
    const storeArray = [];
    if (data.empty) {
      return res.status(404).send("ไม่พบข้อมูลใด");
    }
    data.forEach((doc) => {
      const fetchStore = new StoreModel(
        doc.id,
        doc.data().address,
        doc.data().image,
        doc.data().latitude,
        doc.data().longitude,
        doc.data().name,
        doc.data().open,
        doc.data().tel,
        doc.data().total_review,
        doc.data().website
      );
      storeArray.push(fetchStore);
    });

    return res.status(200).send(storeArray);
  } catch (error) {
    return res.status(400).send(error);
  }
};

module.exports = {
  getStore,
};
