require ("pry")

def pet_shop_name(pet_shop)

	return pet_shop[:name]

end

def total_cash(pet_shop)

	return pet_shop[:admin][:total_cash]	

end

def add_or_remove_cash(pet_shop, amount)

		pet_shop[:admin][:total_cash] += amount

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

	for pet in pet_shop[:pets]
		if pet[:name] == pet_name
			#pet_name_found = pet
			return pet
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

	#Another way of doing it
	# if new_pet == nil
	# 	return
	# end

	#This won't work if I don't have the preceding if block active
	#can_customer_afford = customer_can_afford_pet(customer, new_pet)

	if new_pet != nil && customer_can_afford_pet(customer, new_pet) #can_customer_afford

		#Remove the pet from stock 
		remove_pet_by_name(pet_shop, new_pet[:name])

		#Withdraw amount from customer account
		remove_customer_cash(customer, new_pet[:price])

		#Add withdrawal amount to shop account
		add_or_remove_cash(pet_shop, new_pet[:price])

		#Confirm transfer of pet to customer
		add_pet_to_customer(customer, new_pet)

		#Confirm increase of number of pets sold in pet shop
		increase_pets_sold(pet_shop, customer[:pets].count())
		
	end

end



