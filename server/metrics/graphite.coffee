graphite = require('graphite')
import logger from '../log'

client = graphite.createClient('plaintext://ije.algoprog.ru:2003/')

instance_number = process.env["INSTANCE_NUMBER"] || "0"
enabled = process.env["GRAPHITE"]

export default send = (metrics) ->
    console.log "Got metrics ", metrics
    if not enabled
        return

    metrics["instance"] = +instance_number

    prefix = "algoprog.#{instance_number}"
    metricsWithPrefix = {}
    for key, value of metrics
        metricsWithPrefix["#{prefix}.#{key}"] = value
    console.log "Sending metrics ", metricsWithPrefix
    client.write(metricsWithPrefix, (err) -> if err? then logger.error("Can't send metrics to graphite: #{err}"))