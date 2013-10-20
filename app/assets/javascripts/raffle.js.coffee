# This function takes a scope, which is an object that allows us to interact with a view. 
# We can get and set variables and functions on this scope and we’ve set an entries variable # and set it to an array of entries for the raffle. In our view template we want to render 
# this data as a list which we do like this:

@RaffleCtrl = ($scope) ->
	$scope.entries = [
		{name: "Larry"}
		{name: "Curly"}
		{name: "Moe"}
	]