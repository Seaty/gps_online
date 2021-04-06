var express = require("express");
const service = require("./service_api");
var router = express.Router();

router.post("/check_fb_data", service.fb_login);
router.get("/get_user_data", service.get_user_data);
router.get("/get_location_check", service.get_location_check);

module.exports = router;
