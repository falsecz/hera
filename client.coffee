
birpc = require 'birpc'
pf = __dirname + '/hera.proto'

client = birpc.connect 8124, "localhost", pf, 'HeraRPC', (rpc) ->
	# rpc.on 'request', (name, data, done) ->
	# 	console.log name
	# 	return done null,
	# 	# "mrdkoooo"  + data.test
	{PayloadType} = rpc.builder
	rpc.handle 'api', (data, done) ->
		console.log data.type is PayloadType.JSON
		# console.log "aass", arguments
		# done

