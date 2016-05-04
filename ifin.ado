* Author: Lucia Goin
* Contact: lgoin@poverty-action.org
* Purpose: evaluate matches in two local macros

	program ifin, rclass
		
		syntax anything(equalok)
		
		gettoken contains anything:anything, parse("=")

		loc containedn: word count `anything'
		
		* clean up contained (has the equals sign)
			foreach thing of loc anything {
				loc tempthing = subinstr("`thing'", "=", "", .)
				loc contained `contained' `tempthing'
			}

		loc check_contains: word count `contains'
		loc n: word count `contained'
		
	forvalues i = 1/`check_contains' {
		
		forvalues j = 1/`n' {
			
			loc a: word `i' of `contains'
			loc b: word `j' of `contained'
			
			if "`a'" == "`b'" {
				loc match `match' `b'
			}
		}
	}

	if "`match'" == "" {
		di as err "match not found"
	}

	return local matches "`match'"

end 
