extends Node

class Inventory:
	var inventory_max_size : int = Constante.IVENTORY_MAX_SIZE
	var inventory_size : int = 0
	var inventory : Array = []
	
	func is_full():
		return inventory_max_size == inventory_size
	
	##Return true if inventory get the item
	##false if inventory full
	func add_item(item):
		if not self.is_full():
			inventory.append(item)
			inventory_size += 1
			return true
		return false

	func remove_item_at_index(index : int):
		if index <= inventory_size:
			inventory.remove_at(index)
			inventory_size -= 1
