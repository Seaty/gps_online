var express = require('express');
const service = require("./service_api")
var router = express.Router();

router.post('/check_fb_data', service.fb_login)

module.exports = router;