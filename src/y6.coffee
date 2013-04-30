(( win, doc ) -> 
  
	win.y6 = {}

	Dom = (selector, context = null) ->
		if not (this instanceof Dom)
			return new Dom selector, context

		@elems = document.getElementById selector
		@elems = if @elems then [@elems] else []
		return this


	Dom::addClass = (className) ->
		for el in @elems
			classNames = el.className.split(/\s+/)
			index = classNames.indexOf className
			if index is -1
				classNames.push className
		 	el.className = classNames.join(" ").trim()
		return this

	Dom::hasClass = (className) ->		
		for el in @elems
			classNames = el.className.split(/\s+/)
			index = classNames.indexOf className
			if not (index is -1)
				return true
		return false

	Dom::removeClass = (className) ->				
		for el in @elems
			classNames = el.className.split(/\s+/)
			index = classNames.indexOf className
			if not (index is -1)
				classNames.splice index, 1
			el.className = classNames.join(" ").trim()
		return this

	Dom::toggleClass = (className) ->
		for el in @elems
			classNames = el.className.split(/\s+/)
			index = classNames.indexOf className
			if not (index is -1)
				classNames.splice index, 1
			else
				classNames.push className
			el.className = classNames.join(" ").trim()
		return this

	y6.dom = Dom

)( window, document )