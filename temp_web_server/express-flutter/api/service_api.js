const pgcon = require("./newnode_pgconnection");
const fs = require('fs')
const baseImagePath = '/images'

exports.fb_login = async (req, res) => {
  try {
    let data = req.body;
    let insert_sql = `INSERT INTO user_master(id,email,fb_name,last_config,last_login) VALUES ($1,$2,$3,NOW(),NOW())`;
    let update_sql = `UPDATE user_master SET email=$2, fb_name=$3, last_config = NOW(), last_login = NOW() WHERE id = $1`;
    let check_data = [data.id, data.email, data.fb_name];
    let r1 = await pgcon.upsertwithParams(insert_sql, update_sql, check_data);
    if (r1.code) {
      res.status(500).send(r1.message);
    } else {
      res.send("completed");
    }
  } catch (error) {
    res.status(500).send(error.message);
  }
};

exports.get_user_data = async (req, res) => {
  try {
    let id = req.query["id"];
    let sql = `SELECT id as fb_id ,email, fullname ,tel ,address ,province ,amphur ,tambon ,postcode FROM user_master WHERE id = '${id}' `;
    let r1 = await pgcon.get(sql);
    if (r1.code) {
      res.status(500).send(r1.message);
    } else {
      if (r1.data.length == 0) {
        res.send({});
      } else {
        res.send(r1.data[0]);
      }
    }
  } catch (error) {
    res.status(500).send(error.message);
  }
};

exports.get_location_check = async (req, res) => {
  try {
    let { province, amphur, tambon } = req.query;
    let sql;
    if (province && amphur && tambon) {
      sql = `SELECT postcode FROM location WHERE (province_th = '${province}' OR province_en = '${province}') AND (amphur_th = '${amphur}' OR amphur_en = '${amphur}') AND ( tambon_th  = '${tambon}' OR tambon_en = '${tambon}')`;
    } else if (province && amphur) {
      sql = `SELECT DISTINCT tambon_th , tambon_en FROM location WHERE  (province_th = '${province}' OR province_en = '${province}') AND (amphur_th = '${amphur}' OR amphur_en = '${amphur}')`;
    } else if (province) {
      sql = `SELECT DISTINCT amphur_th , amphur_en FROM location WHERE  province_th = '${province}' OR province_en = '${province}'`;
    } else {
      sql = `SELECT DISTINCT province_th , province_en FROM location `;
    }
    let r1 = await pgcon.get(sql);
    if (r1.code) {
      res.status(500).send(r1.message);
    } else {
      if (province && amphur && tambon) {
        res.send(r1.data[0].postcode);
      } else if (province && amphur) {
        res.send(r1.data.map((x) => x.tambon_th));
      } else if (province) {
        res.send(r1.data.map((x) => x.amphur_th));
      } else {
        res.send(r1.data.map((x) => x.province_th));
      }
    }
  } catch (error) {
    res.status(500).send(error.message);
  }
};


exports.update_userdata = async (req, res, next) => {
  try {
    let { fullname, tel, fb_id, province, amphur, tambon, address, postcode, } = JSON.parse(req.body['data'])
    let sqlcheck = `UPDATE user_master SET fullname = $1 , tel = $2 , address =$3 , province = $4 , amphur = $5 , tambon = $6, postcode = $7 WHERE id = $8 `
    let r1 = await pgcon.excutewithparams(sqlcheck, [fullname, tel, address, province, amphur, tambon, postcode, fb_id])
    if (r1.code) {
      console.log(r1.message);
      res.status(500).send('update user data error : ' + r1.message)
    } else {
      next()
    }
  } catch (error) {
    res.status(500).send(error.message);
  }
}

exports.create_new_order = async (req, res) => {
  try {
    let { slipimage, chassisimage } = req.files
    let { fullname, tel, fb_id, province, amphur, tambon, address, postcode, amount, email, chassis_number, remark } = JSON.parse(req.body['data'])
    debugger
    let sql_get = `SELECT indexs FROM index_master WHERE type = 'order_id'`
    let r1 = await pgcon.get(sql_get)
    if (r1.code) {
      res.status(500).send('User error : get index error')
    } else {
      let newIndex = r1.data[0].indexs + 1
      let orderId = 'DTC' + ("000000" + newIndex).slice(-6)
      let sqlArr = []
      let dataArr = []
      let insert_sql = `INSERT INTO order_master(order_id,price,status,amount,address,tel,province,amphur,tambon,postcode,last_update,order_time,fullname,email,fb_id,chassis_no,remark)
                        VALUES ($1,$12,$2,$3,$4,$5,$6,$7,$8,$9,NOW(),NOW(),$10,$11,$13,$14,$15)`
      let insert_data = [orderId, "1", amount, address, tel, province, amphur, tambon, postcode, fullname, email, 4500, fb_id, chassis_number, remark]
      let update_index_sql = `UPDATE index_master SET indexs = indexs + 1 WHERE type = 'order_id'`
      sqlArr = [insert_sql, update_index_sql]
      dataArr = [insert_data, []]
      let r2 = await pgcon.inserttransactionwithData(sqlArr, dataArr)
      if (r2.code) {
        res.status(500).send('Query error : ' + r2.message)
      } else {
        if (!fs.existsSync(`./api/images/${orderId}`)) {
          fs.mkdirSync(`./api/images/${orderId}`);
        }
        if (chassisimage) {
          var chassis_error = await chassisimage.mv(__dirname + baseImagePath + `/${orderId}/${chassisimage.name}`)
          if (chassis_error)
            return res.status(500).send("upload chassis image error")
        }
        var slip_error = await slipimage.mv(__dirname + baseImagePath + `/${orderId}/${slipimage.name}`)
        if (slip_error)
          return res.status(500).send("upload slip image error")
        res.send(orderId)
      }
    }
  } catch (error) {
    console.error(error);
    res.status(500).send(error.message);
  }
}

exports.search_order_master_by_id = async (req, res) => {
  try {
    let order_id = req.query['orderid']
    let sql = `SELECT order_id , status , last_update , fullname , amount FROM order_master WHERE order_id = '${order_id}'`
    let r1 = await pgcon.get(sql)
    if (r1.code) {
      res.status(500).send('Query error : ' + r1.message)
    } else {
      res.send(r1)
    }
  } catch (error) {
    console.error(error);
    res.status(500).send(error.message);
  }
}