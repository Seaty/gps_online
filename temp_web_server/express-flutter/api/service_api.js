const pgcon = require('./newnode_pgconnection')


exports.fb_login = async (req, res) => {
    try {
        let data = req.body
        let insert_sql = `INSERT INTO user_master(id,email,fb_name,last_config,last_login) VALUES ($1,$2,$3,NOW(),NOW())`
        let update_sql = `UPDATE user_master SET email=$2, fb_name=$3, last_config = NOW(), last_login = NOW() WHERE id = $1`
        let check_data = [data.id, data.email, data.fb_name]
        let r1 = await pgcon.upsertwithParams(insert_sql, update_sql, check_data)
        if (r1.code) {
            res.status(500).send(r1.message)
        } else {
            res.send("completed")
        }
    } catch (error) {
        res.status(500).send(error.message)
    }
}


exports.get_user_data = async (req, res) => {
    try {
        let id = req.query['id']
        let sql = `SELECT email, fullname ,tel ,address ,province ,amphur ,tambon ,postcode FROM user_master WHERE id = '${id}' `
    } catch (error) {

    }
}