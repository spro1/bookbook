const mysql = require('mysql');
const secret_config = require('../common/secret');

module.exports = function () {
    return {
        init: function () {
            return mysql.createConnection({
                host: secret_config.db_info.local.host,
                port: secret_config.db_info.local.port,
                user: secret_config.db_info.local.user,
                password: secret_config.db_info.local.password,
                database: secret_config.db_info.local.database
            })
        },

        test_open: function(con) {
            con.connect(function (err) {
                if (err) {
                    console.error('mysql connection error :' + err);
                } else {
                    console.info('mysql is connected successfully.');
                }
            });
        }
    }
};