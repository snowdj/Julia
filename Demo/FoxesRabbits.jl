
# Time parameters
start_time = 0
end_time = 100
 
# How much time passes between each successive calculation
time_step = 1/4 # In years
end_step = int((( end_time-start_time) / time_step )) 
 
# The number of rabbits when the simulation is started. (Rabbits)
initial_rabbits = 30000
 
# The number of foxes when the simulation is started (Foxes)
initial_foxes = 15
 
# The number of rabbits that must be killed for a fox to be born. (Rabbits/Fox)
rabbits_killed_per_fox_birth = 1000
 
# The chance a rabbit will die when a rabbit fox cross paths. (dmnl)
chance_a_rabbit_will_die_during_a_meeting = 0.50
 
# The chance that a rabbit and fox will cross paths. (dmnl)
chance_of_rabbit_and_fox_meeting = 0.02
 
# The percent of the rabbit population that will be born this time step. (1/Year)
rabbit_growth_rate = 0.20
 
# The percent of the fox population that will die this time step from old age. (1/Year)
fox_death_rate = 0.10
 
# Initialization
rabbits_over_time = fill(0.0, end_step+1)
foxes_over_time = fill(0.0, end_step+1)
model_time = fill(0.0, end_step+1)
 
rabbits = initial_rabbits
foxes = initial_foxes
 
rabbits_over_time[1] = rabbits
foxes_over_time[1] = foxes
