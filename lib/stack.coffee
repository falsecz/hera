module.exports = () ->
	cbs = []
	stack = (req, res) ->
		idx = 0

		next = (err) ->
			return unless cb = cbs[idx++]
			if err?
				return next err unless cb.length is 4
				return cb.call cb, err, req, res, next

			return next() if cb.length is 4
			cb.call cb, req, res, next

		next()

	stack.push = (m) ->
		throw new TypeError "Middleware must be a function" if typeof m isnt 'function'
		cbs.push m
	stack



