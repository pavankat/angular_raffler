# This function takes a scope, which is an object that allows us to interact with a view. 
# We can get and set variables and functions on this scope and we’ve set an entries variable # and set it to an array of entries for the raffle. In our view template we want to render 
# this data as a list which we do like this:

app = angular.module("Raffler", ["ngResource"])

app.factory "Entry", ["$resource", ($resource) ->
	$resource("/entries/:id", {id: "@id"}, {update: {method: "PUT"}})
]

@RaffleCtrl = ["$scope", "Entry", ($scope, Entry) ->
	Entry = $resource("/entries/:id", {id: "@id"}, {update: {method: "PUT"}})
	$scope.entries = Entry.query()

	$scope.addEntry = ->
		entry = Entry.save($scope.newEntry)
		$scope.entries.push($scope.newEntry)
		$scope.newEntry = {}
		$scope.lastWinner = entry

	$scope.drawWinner = ->
		pool = []
		angular.forEach $scope.entries, (entry) ->
			pool.push(entry) if !entry.winner
		if pool.length > 0
			entry = pool[Math.floor(Math.random() * pool.length)]
			entry.winner = true
			entry.$update()
			$scope.lastWinner = entry