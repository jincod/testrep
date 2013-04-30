(( win, doc ) -> 
  
	win.y6 = {}

	regexp =
		Tag: /^[-_a-z0-9]+$/i
		Class: /^\.[-_a-z0-9]+$/i
		Id: /^#[-_a-z0-9]+$/i

	Dom = (selector, context = null) ->
		if not (this instanceof Dom)
			return new Dom selector, context

		if selector.match regexp.Id
			@elems = document.getElementById(selector.substr(1))
			@elems = if @elems then [@elems] else []
		if selector.match regexp.Class
			@elems = document.getElementsByClassName(selector.substr(1))
		if selector.match regexp.Tag
			@elems = document.getElementsByTagName selector

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