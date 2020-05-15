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

	for pet in pet_shop[:pets]
		if pet[:breed] == breed_name
			breed_array.push(pet[:breed])
		end
	end

	return breed_array

end

def find_pet_by_name(pet_shop, pet_name)
	
	pet_name_found = {}

	for pet in pet_shop[:pets]
		if pet[:name] == pet_name
			pet_name_found = pet
			return pet_name_found
		end
	end

	return nil

end

def remove_pet_by_name(pet_shop, pet_name)
	
	for pet in pet_shop[:pets]
		if pet[:name] == pet_name
			pet_shop[:pets].delete(pet)
		end
	end

end

def add_pet_to_stock(pet_shop, new_pet)
	
	pet_shop[:pets].push(new_pet)

end

def customer_cash(customer)
	
	return customer[:cash]

end

def remove_customer_cash(customer, amount)

	customer[:cash] -= amount

end

def customer_pet_count(customer)

	return customer[:pets].count()

end

def add_pet_to_customer(customer, new_pet)

	customer[:pets].push(new_pet)

end

################
####OPTIONAL####
################

def customer_can_afford_pet(customer, pet)

	customer_can_afford = customer[:cash] > pet[:price]
	customer_has_exact_funds = customer[:cash] == pet[:price]

	return customer_can_afford || customer_has_exact_funds

end

def sell_pet_to_customer(pet_shop, new_pet, customer)

	binding.pry
	can_customer_afford = customer_can_afford_pet(customer, new_pet)
	pet_found_or_not = find_pet_by_name(pet_shop, new_pet)
	
	p can_customer_afford
	p pet_found_or_not

	if can_customer_afford && pet_found_or_not != nil
		add_pet_to_customer(customer, new_pet)
	end
	binding.pry

	#return find_pet_by_name(new_pet)
	return customer_pet_count(customer)
	return pets_sold(pet_shop)
	return customer_cash(customer)
	return total_cash(pet_shop)

end



