* Author: Lucia Goin
* Contact: lgoin@poverty-action.org
* Purpose: This is a program that checks to see if one macro is inside of another macro

****************************************************************************

	program ifin, rclass

	syntax anything
		
	gettoken contains anything:anything
	
	loc check_contains: word count contains
	
	if `check_contains' > 1 {
		di as err "only include one macro to check"
	}
	
	loc contained `anything'		
	loc n: word count `contained'
	
	forvalues i = 1/`n' {
		gettoken pcontained contained: contained
		if "`pcontained'" == "`contains'" {
			return local match "`pcontained'"
		}
		loc pcontained ""
	}
	
	if "`r(match)'" == "" {
		di as err "match not found"
	}
	
	end 
	

