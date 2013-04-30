describe "y6 dom specs", () ->
	beforeEach () ->
		@testId = "testId"
		@testClass = "testClass"
		div = document.createElement "div"
		div.setAttribute "id", @testId
		document.body.appendChild div
		div = document.createElement "div"
		div.setAttribute "class", @testClass
		document.body.appendChild div
		p = document.createElement "p"
		document.body.appendChild p

	afterEach () ->
		node = document.getElementById @testId
		if node.parentNode
  			node.parentNode.removeChild node
		node = document.getElementsByClassName @testClass
		if node.parentNode
  			node.parentNode.removeChild node
		node = document.getElementsByTagName "p"
		if node.parentNode
  			node.parentNode.removeChild node

	it "Test 1", () ->
		expect(y6.dom("#" + @testId).elems[0]).toEqual(document.getElementById(@testId))
		expect(y6.dom("." + @testClass).elems[0]).toEqual(document.getElementsByClassName(@testClass)[0])
		expect(y6.dom("p").elems[0]).toEqual(document.getElementsByTagName("p")[0])
		expect(y6.dom("#element_is_null").elems[0]).toEqual(undefined)
		expect(y6.dom(".element_is_null").elems[0]).toEqual(undefined)


describe "y6 css class specs", () ->

	beforeEach () ->
		@testId1 = "fixture-id"
		@testClass1 = "class1"
		@testClass2 = "class2"
		div = document.createElement "div"
		div.setAttribute "id", @testId1
		document.body.appendChild div
		@testEl = y6.dom "#" + @testId1

	afterEach () ->
		node = document.getElementById @testId1
		if node.parentNode
  			node.parentNode.removeChild node

	describe "addClass specs", () ->

		it "must make elements selectable with getElementsByClassName(@testClass1)", () ->
			@testEl.addClass @testClass1
			expect(1).toEqual(document.getElementsByClassName(@testClass1).length)
			expect(0).toEqual(document.getElementsByClassName(@testClass2).length)

		it "must make elements selectable with getElementsByClassName(@testClass2)", () ->
			@testEl.addClass @testClass2
			expect(0).toEqual(document.getElementsByClassName(@testClass1).length)
			expect(1).toEqual(document.getElementsByClassName(@testClass2).length)

		it "must not remove @testClass1 from elements", () ->
			@testEl.addClass @testClass1
			expect(1).toEqual(document.getElementsByClassName(@testClass1).length)
			expect(0).toEqual(document.getElementsByClassName(@testClass2).length)

			@testEl.addClass @testClass2
			expect(1).toEqual(document.getElementsByClassName(@testClass1).length)
			expect(1).toEqual(document.getElementsByClassName(@testClass2).length)

		it "repeated adding classes must have no effect", () ->
			@testEl.addClass @testClass1
			@testEl.addClass @testClass1
			expect(1).toEqual(document.getElementsByClassName(@testClass1)[0].className.split(" ").length)

	describe "hasClass specs", () ->

		it "must return true id element className is @testClass1", () ->
			@testEl.addClass @testClass1
			expect(true).toEqual(@testEl.hasClass @testClass1)
			expect(false).toEqual(@testEl.hasClass @testClass2)

		it "must return true if one of the elements has this class", () ->
			@testEl.addClass @testClass1
			@testEl.addClass @testClass2
			expect(true).toEqual(@testEl.hasClass @testClass1)
			expect(true).toEqual(@testEl.hasClass @testClass2)

	describe "toggleClass specs", () ->

		it "after toggling @testClass1 the only elements having @testClass1 must be those which didn\'t have @testClass1 before toggling", () ->
			@testEl.toggleClass @testClass1
			expect(true).toEqual(@testEl.hasClass @testClass1)

		it "double toggle not not change state", () ->
			@testEl.toggleClass @testClass1
			@testEl.toggleClass @testClass1
			expect(false).toEqual(@testEl.hasClass @testClass1)

		it "test 1", () ->
			@testEl.toggleClass @testClass1
			expect(true).toEqual(@testEl.hasClass @testClass1)

			@testEl.toggleClass @testClass1
			expect(false).toEqual(@testEl.hasClass @testClass1)

		it "test 2", () ->
			@testEl.addClass @testClass2
			@testEl.toggleClass @testClass1
			expect(true).toEqual(@testEl.hasClass @testClass1)
			expect(true).toEqual(@testEl.hasClass @testClass2)

	describe "removeClass specs", () ->

		it "removeClass @testClass1 must remove class @testClass1 but keep @testClass2", () ->
			@testEl.addClass @testClass1
			@testEl.addClass @testClass2
			@testEl.removeClass @testClass1
			expect(false).toEqual(@testEl.hasClass @testClass1)
			expect(true).toEqual(@testEl.hasClass @testClass2)

		it "removeClass  @testClass2 must remove class @testClass2", () ->			
			@testEl.addClass @testClass2
			@testEl.removeClass @testClass2
			expect(false).toEqual(@testEl.hasClass @testClass2)

		it "removeClass  @testClass2 must remove class @testClass2 from all elements", () ->			
			@testEl.addClass @testClass2
			@testEl.removeClass @testClass2
			expect(0).toEqual(document.getElementsByClassName(@testClass2).length)