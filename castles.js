function sortCastles(sender) {
	var sortByVal       = sender.options[sender.selectedIndex].value;
	var sortTokens      = sortByVal.split("_");
	var sortByProp      = sortTokens[0];
	var sortByDirection = sortTokens[1];
	
	var castles = document.querySelectorAll(".castle-container");
	
	for (i = 0; i < castles.length; ++i) {
		var sortingProps = castles[i].getAttribute("sorting-properties").split(";");
		
		switch(sortByProp) {
		case "title":
			castles[i].c_sort_rule = sortingProps[0];
			break;
		case "type":
			castles[i].c_sort_rule = sortingProps[1];
			break;
		case "region":
			castles[i].c_sort_rule = sortingProps[2];
			break;
		case "condition":
			castles[i].c_sort_rule = sortingProps[3];
			break;
		default:
			console.error("error");
		}
		
		castles[i].c_sort_direction = 1;
		if (sortByDirection === "DSC") {
			castles[i].c_sort_direction *= -1;
		}
	}
	
	var castlesCatalog = document.getElementById("catalogContainer");
	var castlesArray = Array.prototype.slice.call(castles);
	castlesArray.sort(customCompare);
	
	castlesArray.forEach(function (item) {
		castlesCatalog.removeChild(item);
		castlesCatalog.appendChild(item);
	});
}

function customCompare(a, b) {
	var result = 0;
	
	if(a.c_sort_rule.toUpperCase() > b.c_sort_rule.toUpperCase()) {
		result = 1;
	}
	if(a.c_sort_rule.toUpperCase() < b.c_sort_rule.toUpperCase()) {
		result = -1;
	}
	
	return result * a.c_sort_direction;
}