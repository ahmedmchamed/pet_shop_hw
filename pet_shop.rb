require ("pry")

def pet_shop_name(pet_shop)

	return pet_shop[:name]

end

def total_cash(pet_shop)

	return pet_shop[:admin][:total_cash]	

end

def add_or_remove_cash(pet_shop, amount)

	if amount > 0
		pet_shop[:admin][:total_cash] += amount
	end
	if amount < 0
		pet_shop[:admin][:total_cash] += amount
	end

	return pet_shop[:admin][:total_cash]
end

def pets_sold(pet_shop)

	return pet_shop[:admin][:pets_sold]

end

def increase_pets_sold(pet_shop, pets_sold)
    pet_shop[:admin][:pets_sold] += pets_sold
end

def stock_count(pet_shop)
	return pet_shop[:pets].count()
end

def pets_by_breed(pet_shop, breed_name)
	
	breed_array = []

	for breed in pet_shop[:pets]
		if breed[:breed] == breed_name
			breed_array.push(breed[:breed])
		end
	end

	return breed_array.length()

end











