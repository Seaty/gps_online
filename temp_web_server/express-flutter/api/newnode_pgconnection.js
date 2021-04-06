const {
    Pool, Client
} = require('pg')


const connectionstring = {
    host: '203.151.70.147',
    port: '5432',
    user: 'postgres',
    password: 'db@devbackground01',
    database: 'selling_gps'
}

exports.execute = async (script) => {
    //execute data
    try {
        var pool = new Pool(connectionstring)
        const client = await pool.connect()
        try {
            const res = await client.query(script)
            console.log("Execute action: " + res.rowCount + " row(s)");
            return {
                code: false,
                rowaction: res.rowCount
            }

        } catch (e) {
            console.log(script + ' : error code : ' + e.code + ' err.message : ' + e.message)
            return {
                code: e.code,
                message: e.message
            }
        } finally {
            client.release()
        }
    } catch (error) {
        console.log(script + ' : error code : ' + error.code + ' err.message : ' + error.message)
        return {
            code: error.code,
            message: error.message
        }
    }
}

exports.get = async (script) => {
    //get data
    try {
        var pool = new Pool(connectionstring)
        const client = await pool.connect()
        try {
            const res = await client.query(script)
            if (Array.isArray(res)) {
                return { code: false, data: res[res.length - 1].rows }
            }
            return { code: false, data: res.rows }

        } catch (e) {
            console.log(script + ' : error code : ' + e.code + ' err.message : ' + e.message)
            return {
                code: e.code,
                message: e.message
            }
        } finally {
            client.release()
        }
    } catch (error) {
        console.log(script + ' : error code : ' + error.code + ' err.message : ' + error.message)
        return {
            code: error.code,
            message: error.message
        }
    }
}

exports.upsert1 = async (insert, update) => {
    // 1 by 1 upsert
    var arr = [];
    var script = '';
    var temp = '';

    try {
        //debugger;
        arr = insert.split('VALUES')
        temp = arr[1].replace(/^\s+|\s+$/g, '');
        arr[1] = temp.substring(1, temp.length - 1);
        insert = arr[0] + " SELECT " + arr[1];

        var script = " WITH upsert AS (" + update + "  RETURNING *)";
        script += " " + insert + " ";
        script += " WHERE NOT EXISTS (SELECT * FROM upsert)";

        let r = await this.execute(script)

        return r;


    } catch (ex) {
        console.log('setUpsertScript : ' + ex)
        return { code: true, message: ex }
    }

};

exports.upsertwithParams = async (insert, update, data) => {
    // 1 by 1 upsert
    var arr = [];
    var script = '';
    var temp = '';

    try {
        //debugger;
        arr = insert.split('VALUES')
        temp = arr[1].replace(/^\s+|\s+$/g, '');
        arr[1] = temp.substring(1, temp.length - 1);
        insert = arr[0] + " SELECT " + arr[1];

        var script = " WITH upsert AS (" + update + "  RETURNING *)";
        script += " " + insert + " ";
        script += " WHERE NOT EXISTS (SELECT * FROM upsert)";

        let r = await this.excutewithparams(script, data)

        return r;


    } catch (ex) {
        console.log('setUpsertScript : ' + ex)
        return { code: true, message: ex }
    }

};

exports.excutewithparams = async (query, params) => {
    const client = new Client(connectionstring)
    await client.connect()
    try {
        const res = await client.query(query, params)
        await client.end()
        return { code: false, rowCount: res.rowCount }
    } catch (err) {
        await client.end()
        console.log(err.stack)
        return { code: err.rrcode, message: err.message }
    }
}

exports.inserttransactionwithData = async (arr_insert, arr_data) => {
    var pool = new Pool(connectionstring)
    const client = await pool.connect()
    try {
        await client.query('BEGIN')
        for (let index = 0; index < arr_insert.length; index++) {
            let res = await client.query(arr_insert[index], arr_data[index])
        }
        await client.query('COMMIT')
        return { code: false }
    } catch (e) {
        await client.query('ROLLBACK')
        console.log(e.stack)
        return { code: true, message: e.message }
    } finally {
        client.release()
    }
}

exports.upserttransaction = async (insert_sql, update_sql, arr_data) => {

    var pool = new Pool(connectionstring)
    const client = await pool.connect()
    try {
        await client.query('BEGIN')

        for (let index = 0; index < arr_data.length; index++) {
            arr = insert_sql.split('VALUES')
            temp = arr[1].replace(/^\s+|\s+$/g, '');
            arr[1] = temp.substring(1, temp.length - 1);
            let temp_insert = arr[0] + " SELECT " + arr[1];
            let script = `WITH upsert AS ( ${update_sql} RETURNING *) ${temp_insert} WHERE NOT EXISTS (SELECT * FROM upsert)`
            await client.query(script, arr_data[index])
        }
        await client.query('COMMIT')
        return { code: false }
    } catch (error) {
        await client.query('ROLLBACK')
        console.log(error.stack)
        return { code: true, message: error.message }
    } finally {
        client.release()
    }
}

exports.excuteParamsTransaction = async (script, arr_data) => {
    var pool = new Pool(connectionstring)
    const client = await pool.connect()
    try {
        await client.query('BEGIN')

        for (let index = 0; index < arr_data.length; index++) {
            await client.query(script, arr_data[index])
        }
        await client.query('COMMIT')
        return { code: false }
    } catch (error) {
        await client.query('ROLLBACK')
        console.log(error.stack)
        return { code: true, message: error.message }
    } finally {
        client.release()
    }

}