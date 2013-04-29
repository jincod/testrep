describe "TravelCardSorterSpecs", () ->

	beforeEach () ->
		@card1 =
			type: "train"
			number: "78A"
			from: "Madrid"
			to: "Barcelona"
			seat: "45B"
		@card2 =
			type: "airport bus"
			from: "Barcelona"
			to: "Gerona Airport"
		@card3 =
			type: "flight"
			number: "SK455"
			from: "Gerona Airport"
			to: "Stockholm"
			seat: "3A"
			comments: "Gate 45B. Baggage drop at ticket counter 344."
		@card4 =
			type: "flight"
			number: "SK22"
			from: "Stockholm"
			to: "New York JFK"
			seat: "7B"
			comments: "Gate 22. Baggage will be automatically transferred from your last leg."

	it "For empty input return empty result", ()->
		expect([]).toEqual(TravelCardSorter([]))

	it "For one card input return one card", ()->					
		expect([@card1]).toEqual(TravelCardSorter([@card1]))
		expect("Madrid").toEqual(TravelCardSorter([@card1])[0].from)

	it "Correct return count cards", ()->
		cards = [@card1, @card2]
		expect(2).toEqual(TravelCardSorter(cards).length)
	
	it "Return correct order input cards", ()->
		cards = [@card1, @card2, @card3, @card4]
		result = TravelCardSorter(cards)
		expect("Madrid").toEqual(result[0].from)
		expect("New York JFK").toEqual(result[3].to)
		ResultFormatter(result)
	
	it "Return correct order input cards 2", ()->
		cards = [@card1, @card3, @card2, @card4]
		result = TravelCardSorter(cards)
		expect("Madrid").toEqual(result[0].from)
		expect("New York JFK").toEqual(result[3].to)
		ResultFormatter(result)
	
	it "Return correct order input cards 3", ()->
		cards = [@card2, @card1, @card3, @card4]
		result = TravelCardSorter(cards)
		expect("Madrid").toEqual(result[0].from)
		expect("New York JFK").toEqual(result[3].to)
		ResultFormatter(result)
	
	it "Return correct order input cards 4", ()->
		cards = [@card2, @card1, @card4, @card3]
		result = TravelCardSorter(cards)
		expect("Madrid").toEqual(result[0].from)
		expect("New York JFK").toEqual(result[3].to)
		ResultFormatter(result)
	
	it "Return correct order input cards 5", ()->
		cards = [@card2, @card4, @card1, @card3]
		result = TravelCardSorter(cards)
		expect("Madrid").toEqual(result[0].from)
		expect("New York JFK").toEqual(result[3].to)
		ResultFormatter(result)
	
	it "Return correct order input cards 6", ()->
		cards = [@card2, @card3, @card4, @card1]
		result = TravelCardSorter(cards)
		expect("Madrid").toEqual(result[0].from)
		expect("New York JFK").toEqual(result[3].to)
		ResultFormatter(result)

	it "Throw if some cards are lost", ()->
		cards = [@card4, @card1, @card3]
		expect(()-> TravelCardSorter cards).toThrow()


	describe "ResultFormatterSpecs", () ->

		it "Check formatter", () ->
			expect(["Take train 78A from Madrid to Barcelona. Seat 45B."]).toEqual(ResultFormatter([@card1]))

	describe "Get First and Last Card Specs", () ->

		it "Test 1", () ->
			cards = [@card4, @card2, @card1, @card3]
			expect("Madrid").toEqual(GetFirstCard(cards).from)

		it "Test 2", () ->
			cards = [@card2, @card3]
			expect("Barcelona").toEqual(GetFirstCard(cards).from)

		it "Test 3", ()->
			cards = [@card3, @card4]
			expect("Gerona Airport").toEqual(GetFirstCard(cards).from)