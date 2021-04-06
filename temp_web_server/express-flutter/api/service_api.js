const pgcon = require("./newnode_pgconnection");

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
    let sql = `SELECT email, fullname ,tel ,address ,province ,amphur ,tambon ,postcode FROM user_master WHERE id = '${id}' `;
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
