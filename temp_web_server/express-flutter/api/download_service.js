var express = require("express");
const service = require("./service_api");
var router = express.Router();
var path = require("path");
const fs = require('fs')


router.get('/slip/:id', async (req, res) => {
    let id = req.params['id']
    var options = {
        root: path.join(__dirname, "images", id),
        dotfiles: 'deny',
        headers: {
            'x-timestamp': Date.now(),
            'x-sent': true
        }
    }
    res.sendFile("slipfile.png", options, (err) => {
        if (err) {
            console.error(err);
            res.status(500).send("error")
        }
    })
})


router.get('/chassis/:id', async (req, res) => {
    let id = req.params['id']
    var options = {
        root: path.join(__dirname, "images", id),
        dotfiles: 'deny',
        headers: {
            'x-timestamp': Date.now(),
            'x-sent': true
        }
    }
    res.sendFile("chassisfile.png", options, (err) => {
        if (err) {
            if(err.statusCode == 404){
                return res.status(err.statusCode).send("not found")
            }
            console.error(err);
            res.status(500).send("error")
        }
    })
})

module.exports = router;