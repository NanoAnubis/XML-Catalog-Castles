function sortCastles(sender) {
	var sortByVal = sender.options[sender.selectedIndex].value;
	var sortTokens = sortByVal.split("_");
	var sortByProp = sortTokens[0];
	var sortByDirection = sortTokens[1];
	
	debugger;
	var stuff = document.querySelectorAll(".castle-container");
	
	console.log(sortByProp);
	console.log(sortByDirection);
}