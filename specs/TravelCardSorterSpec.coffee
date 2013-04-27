describe "TravelCardSorterSpecs", () ->

	it "For empty input return empty result", ()->
		expect([]).toEqual(TravelCardSorter([]))

	it "For one card input return one card", ()->
		card =
			type: "train 78A"
			from: "Madrid"
			to: "Barcelona"
			seat: "45B"
		expect([card]).toEqual(TravelCardSorter([card]))
		expect("Madrid").toEqual(TravelCardSorter([card])[0].from)

	it "Correct return count cards", ()->
		cards = [
			type: "train 78A"
			from: "Madrid"
			to: "Barcelona"
			seat: "45B"
		,
			type: "airport bus"
			from: "Barcelona"
			to: "Gerona Airport"
			seat: null
		]
		expect(2).toEqual(TravelCardSorter(cards).length)
	
	it "Return correct order input cards", ()->
		cards = [
			type: "train 78A"
			from: "Madrid"
			to: "Barcelona"
			seat: "45B"
		,
			type: "airport bus"
			from: "Barcelona"
			to: "Gerona Airport"
		,
			type: "flight SK455"
			from: "Gerona Airport"
			to: "Stockholm"
			seat: "3A"
			comments: "Gate 45B. Baggage drop at ticket counter 344."
		,
			type: "flight SK22"
			from: "Stockholm"
			to: "New York JFK"
			seat: "7B"
			comments: "Gate 22. Baggage will be automatically transferred from your last leg."
		]
		result = TravelCardSorter(cards)
		expect("Madrid").toEqual(result[0].from)
		expect("New York JFK").toEqual(result[3].to)
		ResultFormatter(result)
	
	it "Return correct order input cards 2", ()->
		cards = [
			type: "train 78A"
			from: "Madrid"
			to: "Barcelona"
			seat: "45B"
		,
			type: "flight SK455"
			from: "Gerona Airport"
			to: "Stockholm"
			seat: "3A"
			comments: "Gate 45B. Baggage drop at ticket counter 344."
		,
			type: "airport bus"
			from: "Barcelona"
			to: "Gerona Airport"
		,
			type: "flight SK22"
			from: "Stockholm"
			to: "New York JFK"
			seat: "7B"
			comments: "Gate 22. Baggage will be automatically transferred from your last leg."
		]
		result = TravelCardSorter(cards)
		expect("Madrid").toEqual(result[0].from)
		expect("New York JFK").toEqual(result[3].to)
		ResultFormatter(result)
	
	it "Return correct order input cards 3", ()->
		cards = [
			type: "airport bus"
			from: "Barcelona"
			to: "Gerona Airport"
		,
			type: "train 78A"
			from: "Madrid"
			to: "Barcelona"
			seat: "45B"
		,
			type: "flight SK455"
			from: "Gerona Airport"
			to: "Stockholm"
			seat: "3A"
			comments: "Gate 45B. Baggage drop at ticket counter 344."
		,
			type: "flight SK22"
			from: "Stockholm"
			to: "New York JFK"
			seat: "7B"
			comments: "Gate 22. Baggage will be automatically transferred from your last leg."
		]
		result = TravelCardSorter(cards)
		expect("Madrid").toEqual(result[0].from)
		expect("New York JFK").toEqual(result[3].to)
		ResultFormatter(result)
	
	it "Return correct order input cards 4", ()->
		cards = [
			type: "airport bus"
			from: "Barcelona"
			to: "Gerona Airport"
		,
			type: "train 78A"
			from: "Madrid"
			to: "Barcelona"
			seat: "45B"
		,
			type: "flight SK22"
			from: "Stockholm"
			to: "New York JFK"
			seat: "7B"
			comments: "Gate 22. Baggage will be automatically transferred from your last leg."
		,
			type: "flight SK455"
			from: "Gerona Airport"
			to: "Stockholm"
			seat: "3A"
			comments: "Gate 45B. Baggage drop at ticket counter 344."
		]
		result = TravelCardSorter(cards)
		expect("Madrid").toEqual(result[0].from)
		expect("New York JFK").toEqual(result[3].to)
		ResultFormatter(result)
	
	it "Return correct order input cards 5", ()->
		cards = [
			type: "airport bus"
			from: "Barcelona"
			to: "Gerona Airport"
		,
			type: "flight SK22"
			from: "Stockholm"
			to: "New York JFK"
			seat: "7B"
			comments: "Gate 22. Baggage will be automatically transferred from your last leg."
		,
			type: "train 78A"
			from: "Madrid"
			to: "Barcelona"
			seat: "45B"
		,
			type: "flight SK455"
			from: "Gerona Airport"
			to: "Stockholm"
			seat: "3A"
			comments: "Gate 45B. Baggage drop at ticket counter 344."
		]
		result = TravelCardSorter(cards)
		expect("Madrid").toEqual(result[0].from)
		expect("New York JFK").toEqual(result[3].to)
		ResultFormatter(result)
	
	it "Return correct order input cards 6", ()->
		cards = [
			type: "airport bus"
			from: "Barcelona"
			to: "Gerona Airport"
		,
			type: "flight SK22"
			from: "Stockholm"
			to: "New York JFK"
			seat: "7B"
			comments: "Gate 22. Baggage will be automatically transferred from your last leg."
		,
			type: "train 78A"
			from: "Madrid"
			to: "Barcelona"
			seat: "45B"
		,
			type: "flight SK455"
			from: "Gerona Airport"
			to: "Stockholm"
			seat: "3A"
			comments: "Gate 45B. Baggage drop at ticket counter 344."
		]
		result = TravelCardSorter(cards)
		expect("Madrid").toEqual(result[0].from)
		expect("New York JFK").toEqual(result[3].to)
		ResultFormatter(result)

	it "Throw if some cards are lost", ()->
		cards = [
			type: "flight SK22"
			from: "Stockholm"
			to: "New York JFK"
			seat: "7B"
			comments: "Gate 22. Baggage will be automatically transferred from your last leg."
		,
			type: "train 78A"
			from: "Madrid"
			to: "Barcelona"
			seat: "45B"
		,
			type: "flight SK455"
			from: "Gerona Airport"
			to: "Stockholm"
			seat: "3A"
			comments: "Gate 45B. Baggage drop at ticket counter 344."
		]
		expect(()-> TravelCardSorter cards).toThrow()


describe "ResultFormatterSpecs", () ->

	it "Check formatter", ()->
		card =
			type: "train 78A"
			from: "Madrid"
			to: "Barcelona"
			seat: "45B"
		expect(["Take train 78A from Madrid to Barcelona. Seat 45B."]).toEqual(ResultFormatter([card]))

describe "Get First and Last Card Specs", () ->

	it "Test 1", ()->
		cards = [
			type: "flight SK22"
			from: "Stockholm"
			to: "New York JFK"
			seat: "7B"
			comments: "Gate 22. Baggage will be automatically transferred from your last leg."
		,
			type: "airport bus"
			from: "Barcelona"
			to: "Gerona Airport"
		,
			type: "train 78A"
			from: "Madrid"
			to: "Barcelona"
			seat: "45B"
		,
			type: "flight SK455"
			from: "Gerona Airport"
			to: "Stockholm"
			seat: "3A"
			comments: "Gate 45B. Baggage drop at ticket counter 344."
		]
		expect("Madrid").toEqual(GetFirstCard(cards).from)

	it "Test 2", ()->
		cards = [
			type: "airport bus"
			from: "Barcelona"
			to: "Gerona Airport"	
		,
			type: "flight SK455"
			from: "Gerona Airport"
			to: "Stockholm"
			seat: "3A"
			comments: "Gate 45B. Baggage drop at ticket counter 344."
		]
		expect("Barcelona").toEqual(GetFirstCard(cards).from)

	it "Test 3", ()->
		cards = [
			type: "flight SK455"			
			from: "Gerona Airport"
			to: "Stockholm"
			seat: "3A"
			comments: "Gate 45B. Baggage drop at ticket counter 344."
		,
			type: "flight SK22"
			from: "Stockholm"
			to: "New York JFK"
			seat: "7B"
			comments: "Gate 22. Baggage will be automatically transferred from your last leg."
		]
		expect("Gerona Airport").toEqual(GetFirstCard(cards).from)
