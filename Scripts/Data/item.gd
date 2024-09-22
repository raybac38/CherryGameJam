
class Item:
	var name : String
	var description: String
	
	func _init(name : String, description : String = ""):
		self.name = name
		self.description = description
	

class Food extends Item:
	var nourriture : int
	var rarity : int
	var heal : int

	func _init(name : String, description : String = "", nourriture : int = 0, rarity : int = 0, heal : int  = 0):
		self.name = name
		self.description = description
		self.nourriture = nourriture
		self.rarity = rarity
		self.heal = heal

class Armor extends Item:
	var protection : int
	var apparition_lvl : int
	
	##Add effect class /!\
	
	func _init(name : String, description : String = "", protection : int = 0, apparition_lvl : int = 0):
		self.name = name
		self.description = description
		self.apparition_lvl  = apparition_lvl
		self.protection = protection

class Weapon extends Item:
	var damage : int
	var attack_range : int
	var apparition_lvl : int
	func _init(name : String, description : String = "", damage : int = 0, attack_range: int = 0, apparition_lvl : int = 0):
	
		self.name = name
		self.description = description
		self.damage  = damage
		self.attack_range = attack_range
		self.apparition_lvl  = apparition_lvl
	
class Tools extends Item:
	var using_range : int
	var apparition_lvl : int
	func _init(name : String, description : String = "", using_range : int = 0, apparition_lvl : int = 0):
		self.name = name
		self.description = description
		self.using_range  = using_range
		self.apparition_lvl  = apparition_lvl

class Ressource extends Item:
	var apparition_lvl : int
	func _init(name : String, description : String = "", apparition_lvl : int = 0):
		self.name = name
		self.description = description
		self.apparition_lvl = apparition_lvl
