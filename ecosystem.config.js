module.exports = {
  "apps": [{
    "name": "xz-mqtt",
    "script": "app.js",
    "time": true,
    error_file: '/app/logs/pm2-error.log',
    out_file: '/app/logs/pm2-out.log',
    log_date_format: 'YYYY-MM-DD HH:mm:ss Z',
    merge_logs: true
  }]
}
