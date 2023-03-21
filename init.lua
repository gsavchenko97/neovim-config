local log = require("kernel.log")

log.print("Start")

local config = require("config")
config.init_config()

log.print("Finish")
