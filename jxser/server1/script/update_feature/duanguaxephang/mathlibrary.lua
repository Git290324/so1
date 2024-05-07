function main()
end

function mod(a, b)
	
	if b ~= 0 and b ~= null then
		return a - floor(a/b)*b;
	end
	return 0;
end

function div(a, b)
	if b ~= 0 and b ~= null then
		result = a/b;
		if a >= 0 then 
			return floor(result); 
		else 
			return ceil(result); 
		end
	end
	return 0;	
end