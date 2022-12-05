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
		// castles[i].c_title     = sortingProps[0];
		// castles[i].c_type      = sortingProps[1];
		// castles[i].c_region    = sortingProps[2];
		// castles[i].c_condition = sortingProps[3];
	}
	
	var castlesCatalog = document.getElementById("catalogContainer");
	debugger;
	var castlesArray = Array.prototype.slice.call(castles);
	castlesArray.sort(customCompare);
	
	castlesCatalog.innerHTML = '';
	castlesArray.forEach(function () {
		castlesCatalog.appendChild(this);
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