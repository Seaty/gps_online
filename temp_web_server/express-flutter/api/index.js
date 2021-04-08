var express = require("express");
const service = require("./service_api");
// var router = express.Router();
var router = express();


router.post("/check_fb_data", service.fb_login);
router.get("/get_user_data", service.get_user_data);
router.get("/get_location_check", service.get_location_check);
router.post('/createNewOrder', service.update_userdata, service.create_new_order)
router.get('/search_order_master_by_id', service.search_order_master_by_id)


module.exports = router;
