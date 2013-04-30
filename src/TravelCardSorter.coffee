@GetFirstCard = (cards) ->
	for firstCard in cards
		isFirst = true
		for card in cards
			if firstCard.from is card.to
				isFirst = false
		if isFirst
			return firstCard

@GetCardByTo = (to, cards) ->
	for card in cards
		if card.from is to
			return card

@TravelCardSorter = (cards) ->
	if cards.length < 2
		return cards

	result = []	
	result.push GetFirstCard cards

	loop
		last = result[result.length - 1]
		if not last
			throw "Some cards are lost"
		next = GetCardByTo last.to, cards
		if not next
			throw "Some cards are lost"
		result.push next
		break if (result.length is cards.length)

	return result;

template = "Take {{cardtype}}{{number}} from {{cardfrom}} to {{cardto}}. {{seat}}{{comments}}"

@ResultFormatter = (cards) ->
	result = []
	for card in cards
		seat = if card.seat then "Seat " + card.seat + "." else "No seat assignment."
		comments = if card.comments then " " + card.comments else ""
		number = if card.number then " " + card.number else ""
		str = template
			.replace("{{cardtype}}", card.type)
			.replace("{{number}}", number)
			.replace("{{cardfrom}}", card.from)
			.replace("{{cardto}}", card.to)
			.replace("{{seat}}", seat)
			.replace("{{comments}}", comments);
		result.push str
		console.log str
	console.log "*****************************"
	return result