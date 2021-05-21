class SightingSerializer

  def initialize(sighting_object)  
    @sighting = sighting_object
  end

  def to_serialized_json
    @sighting.to_json(:include => {
      :bird => {:only => [:name, :species]},
      :location => {:only => [:latitude, :longitude]}
    }, :except => [:updated_at])
  end

end 

# 1. initialize method to set up any instance variables that we might want to share over multiple methods. In this case, initialize will take in  
#whatever variable we're dealing with in a particular action, and store it as an instance variable.
#2. Now, whatever we pass when initializing a new instance of SightingSerializer will be stored as @sighting. We will need access to this variable elsewhere in the SightingSerializer, so an instance variable is needed here.
#The second step is to write a method that will call to_json on this instance variable, handling the inclusion and exclusion of attributes, and return the results. We will call this method to_serialized_json, and for now we can directly copy the to_json logic that currently exists in SightingsController:
