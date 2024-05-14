class_name AstronomicalInfo extends Resource

## All the types of astronomical bodies
enum AstroType {Water, Dry, Alive, Gas, Ice, Lava}

## The type of this astronomical body
@export var astroType: AstroType = AstroType.Alive;