birpc = require 'birpc'
pf = __dirname + '/hera.proto'

# birpc.Proto.loadProtoFile __

server = birpc.createServer pf, 'HeraRPC', (rpc) ->
	rpc.api
		type: "JSON"
		payload: JSON.stringify {ahojda: "mrdko"}
	, (data, done) ->
		console.log "ddd", arguments
		console.log data
		console.log "ttt", JSON.parse data.payload
		# console.log arguments

	# rpc.status test:12323, () ->
	# 	setTimeout () ->
	# 		rpc.status test:3, () ->
	# 	, 500

		# console.log 'ssss', arguments

server.listen 8124, () ->
	console.log "Listening on 8124"
